
/*
  EJERCICIO 1 · GENERAR PAGO AUTOMÁTICO AL CONFIRMAR RESERVA
  ----------------------------------------------------------------------
  PROBLEMA
    Cuando el campo res_estado pase a 'Confirmada', se debe crear de
    forma automática un registro en la tabla pago con:
      · res_id       = NEW.res_id
      · pag_fecha    = CURRENT_DATE
      · pag_monto    = nº de noches × habitacion.hab_precio
      · pag_metodo   = 'Pendiente'
  SOLUCIÓN
    Función + trigger AFTER UPDATE sobre reserva.
  ======================================================================*/

-- 1.1  Función
CREATE OR REPLACE FUNCTION public.fn_generar_pago_autom()
RETURNS TRIGGER AS $$
DECLARE
  v_precio   NUMERIC(10,2);
  v_noches   INT;
  v_monto    NUMERIC(10,2);
BEGIN
  --------------------------------------------------------------------
  -- Solo opera si el estado cambió A Confirmada (antes no lo era)
  --------------------------------------------------------------------
  IF TG_OP = 'UPDATE'
     AND NEW.res_estado = 'Confirmada'
     AND OLD.res_estado <> 'Confirmada' THEN

     -- Precio de la habitación
     SELECT hab_precio
     INTO   v_precio
     FROM   public.habitacion
     WHERE  hab_id = NEW.hab_id;

     -- Nº de noches (fin no incluido, ej.: 10-12 → 2 noches)
     v_noches := NEW.res_fecha_fin - NEW.res_fecha_inicio;

     -- Monto total
     v_monto  := v_precio * v_noches;

     ----------------------------------------------------------------
     -- Inserta el pago pendiente
     ----------------------------------------------------------------
     INSERT INTO public.pago (res_id, pag_fecha, pag_monto, pag_metodo)
     VALUES (NEW.res_id, CURRENT_DATE, v_monto, 'Pendiente');
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 1.2  Trigger
DROP TRIGGER IF EXISTS trg_generar_pago_autom ON public.reserva;
CREATE TRIGGER trg_generar_pago_autom
AFTER UPDATE ON public.reserva
FOR EACH ROW EXECUTE FUNCTION public.fn_generar_pago_autom();


/*
  EJERCICIO 2 · HISTÓRICO DE CAMBIOS DE ESTADO DE HABITACIÓN
  ----------------------------------------------------------------------
  PROBLEMA
    Se requiere auditar cada vez que `hab_estado` cambie en la tabla
    habitacion, guardando estado viejo, nuevo y marca de tiempo.
  SOLUCIÓN
    − Crear tabla habitacion_estado_log.
    − Crear función + trigger AFTER UPDATE ON habitacion que inserte
      registro solo si el valor efectivamente cambió.
  ======================================================================*/

-- 2.1 Tabla de histórico
CREATE TABLE IF NOT EXISTS public.habitacion_estado_log (
  log_id        SERIAL PRIMARY KEY,
  hab_id        INT          NOT NULL,
  estado_old    VARCHAR(20)  NOT NULL,
  estado_new    VARCHAR(20)  NOT NULL,
  fecha_evento  TIMESTAMP    DEFAULT NOW()
);

-- 2.2 Función
CREATE OR REPLACE FUNCTION public.fn_log_estado_habitacion()
RETURNS TRIGGER AS $$
BEGIN
  IF OLD.hab_estado IS DISTINCT FROM NEW.hab_estado THEN
     INSERT INTO public.habitacion_estado_log
            (hab_id, estado_old, estado_new)
     VALUES (NEW.hab_id, OLD.hab_estado, NEW.hab_estado);
  END IF;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 2.3 Trigger
DROP TRIGGER IF EXISTS trg_log_estado_habitacion ON public.habitacion;
CREATE TRIGGER trg_log_estado_habitacion
AFTER UPDATE ON public.habitacion
FOR EACH ROW EXECUTE FUNCTION public.fn_log_estado_habitacion();


/*
  EJERCICIO 3 · CONTROL DE CAPACIDAD / SOBREOCUPACIÓN
  ----------------------------------------------------------------------
  PROBLEMA
    Cada reserva indicará cuántos huéspedes llegarán. Ese número no
    puede exceder la capacidad declarada de la habitación.
  SOLUCIÓN
    − Añadir columna capacidad INT a habitacion.
    − Añadir columna res_cantidad_huespedes INT a reserva.
    − Trigger BEFORE INSERT OR UPDATE en reserva para validar.
  ======================================================================*/

-- 3.1 Ampliar la tabla HABITACION (si no existe la columna)
DO $$
BEGIN
  IF NOT EXISTS (
      SELECT 1 FROM information_schema.columns
      WHERE  table_schema = 'public'
        AND  table_name   = 'habitacion'
        AND  column_name  = 'capacidad'
  ) THEN
     ALTER TABLE public.habitacion
       ADD COLUMN capacidad INT NOT NULL DEFAULT 2;
     
     /* Ajuste rápido de capacidades para los registros actuales
        (puedes modificarlas después a mano si lo prefieres) */
     UPDATE public.habitacion
        SET capacidad = CASE
                          WHEN hab_tipo = 'Individual' THEN 1
                          WHEN hab_tipo = 'Doble'      THEN 2
                          WHEN hab_tipo = 'Suite'      THEN 2
                          WHEN hab_tipo = 'Familiar'   THEN 4
                          ELSE 2
                        END;
  END IF;
END $$;

-- 3.2 Ampliar la tabla RESERVA (si no existe la columna)
DO $$
BEGIN
  IF NOT EXISTS (
      SELECT 1 FROM information_schema.columns
      WHERE  table_schema = 'public'
        AND  table_name   = 'reserva'
        AND  column_name  = 'res_cantidad_huespedes'
  ) THEN
     ALTER TABLE public.reserva
       ADD COLUMN res_cantidad_huespedes INT NOT NULL DEFAULT 1;
     
     -- Asignar 1 huésped a reservas ya existentes
     UPDATE public.reserva
        SET res_cantidad_huespedes = 1
      WHERE res_cantidad_huespedes IS NULL;
  END IF;
END $$;

-- 3.3 Función de validación
CREATE OR REPLACE FUNCTION public.fn_validar_capacidad()
RETURNS TRIGGER AS $$
DECLARE
  v_capacidad INT;
BEGIN
  -- Capacidad de la habitación solicitada
  SELECT capacidad
  INTO   v_capacidad
  FROM   public.habitacion
  WHERE  hab_id = NEW.hab_id;

  IF NEW.res_cantidad_huespedes > v_capacidad THEN
     RAISE EXCEPTION
       'La habitación % admite máximo %, pero se intentan alojar % huésped(es)',
       NEW.hab_id, v_capacidad, NEW.res_cantidad_huespedes;
  END IF;

  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

-- 3.4 Trigger
DROP TRIGGER IF EXISTS trg_validar_capacidad ON public.reserva;
CREATE TRIGGER trg_validar_capacidad
BEFORE INSERT OR UPDATE ON public.reserva
FOR EACH ROW EXECUTE FUNCTION public.fn_validar_capacidad();


