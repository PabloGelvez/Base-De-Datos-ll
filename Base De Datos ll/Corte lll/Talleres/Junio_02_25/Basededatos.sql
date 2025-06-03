
/* =========================================================
   1. TABLA: HUESPED
   ========================================================= */
CREATE TABLE huesped (
  hue_id          SERIAL PRIMARY KEY,
  hue_nombre      VARCHAR(100) NOT NULL,
  hue_apellido    VARCHAR(100) NOT NULL,
  hue_documento   VARCHAR(40)  NOT NULL UNIQUE,
  hue_telefono    VARCHAR(20),
  hue_email       VARCHAR(120)
);

/* =========================================================
   2. TABLA: HABITACION
   ========================================================= */
CREATE TABLE habitacion (
  hab_id       SERIAL PRIMARY KEY,
  hab_numero   VARCHAR(10)  NOT NULL UNIQUE,
  hab_tipo     VARCHAR(30)  NOT NULL,        -- Ej.: Individual, Doble, Suite
  hab_precio   NUMERIC(10,2) NOT NULL,       -- Precio por noche
  hab_estado   VARCHAR(20)  NOT NULL         -- Disponible, Ocupada, Mantenimiento
);

/* =========================================================
   3. TABLA: RESERVA
   ========================================================= */
CREATE TABLE reserva (
  res_id          SERIAL PRIMARY KEY,
  hue_id          INT  NOT NULL,
  hab_id          INT  NOT NULL,
  res_fecha_inicio DATE NOT NULL,
  res_fecha_fin    DATE NOT NULL,
  res_estado       VARCHAR(20) NOT NULL,     -- Pendiente, Confirmada, Cancelada, Completada
  -- FK
  CONSTRAINT fk_reserva_huesped   FOREIGN KEY (hue_id) REFERENCES huesped(hue_id),
  CONSTRAINT fk_reserva_habitacion FOREIGN KEY (hab_id) REFERENCES habitacion(hab_id)
);

/* =========================================================
   4. TABLA: PAGO
   ========================================================= */
CREATE TABLE pago (
  pag_id       SERIAL PRIMARY KEY,
  res_id       INT NOT NULL,
  pag_fecha    DATE NOT NULL,
  pag_monto    NUMERIC(10,2) NOT NULL,
  pag_metodo   VARCHAR(30)  NOT NULL,        -- Tarjeta, Efectivo, Transferencia, PayPal…
  -- FK
  CONSTRAINT fk_pago_reserva FOREIGN KEY (res_id) REFERENCES reserva(res_id)
);

/* =========================================================
   INSERCIONES DE DATOS DE EJEMPLO
   ========================================================= */

/* ---- HUESPED (10) ---- */
INSERT INTO huesped (hue_nombre, hue_apellido, hue_documento, hue_telefono, hue_email) VALUES
 ('Carlos',   'Ramírez',   'CC100001', '3105551001', 'carlos.ramirez@email.com'),
 ('María',    'López',     'CC100002', '3105551002', 'maria.lopez@email.com'),
 ('Juan',     'Gómez',     'CC100003', '3105551003', 'juan.gomez@email.com'),
 ('Laura',    'Torres',    'CC100004', '3105551004', 'laura.torres@email.com'),
 ('Diego',    'Martínez',  'CC100005', '3105551005', 'diego.martinez@email.com'),
 ('Paula',    'Herrera',   'CC100006', '3105551006', 'paula.herrera@email.com'),
 ('Andrés',   'Díaz',      'CC100007', '3105551007', 'andres.diaz@email.com'),
 ('Sofía',    'Castro',    'CC100008', '3105551008', 'sofia.castro@email.com'),
 ('Luis',     'Moreno',    'CC100009', '3105551009', 'luis.moreno@email.com'),
 ('Daniela',  'Vega',      'CC100010', '3105551010', 'daniela.vega@email.com');

/* ---- HABITACION (10) ---- */
INSERT INTO habitacion (hab_numero, hab_tipo, hab_precio, hab_estado) VALUES
 ('101', 'Individual',  80.00, 'Disponible'),
 ('102', 'Individual',  80.00, 'Mantenimiento'),
 ('201', 'Doble',      120.00, 'Disponible'),
 ('202', 'Doble',      120.00, 'Ocupada'),
 ('301', 'Suite',      220.00, 'Disponible'),
 ('302', 'Suite',      220.00, 'Ocupada'),
 ('401', 'Familiar',   150.00, 'Disponible'),
 ('402', 'Familiar',   150.00, 'Disponible'),
 ('501', 'Individual',  90.00, 'Disponible'),
 ('502', 'Doble',      130.00, 'Mantenimiento');

/* ---- RESERVA (10) ---- */
INSERT INTO reserva (hue_id, hab_id, res_fecha_inicio, res_fecha_fin, res_estado) VALUES
 (1, 1, '2025-06-10', '2025-06-12', 'Completada'),
 (2, 3, '2025-06-15', '2025-06-18', 'Confirmada'),
 (3, 5, '2025-06-20', '2025-06-22', 'Pendiente'),
 (4, 4, '2025-07-01', '2025-07-05', 'Confirmada'),
 (5, 2, '2025-07-08', '2025-07-10', 'Cancelada'),
 (6, 6, '2025-07-12', '2025-07-15', 'Completada'),
 (7, 7, '2025-07-18', '2025-07-20', 'Confirmada'),
 (8, 8, '2025-07-22', '2025-07-25', 'Pendiente'),
 (9, 9, '2025-07-28', '2025-07-29', 'Completada'),
(10,10, '2025-08-01', '2025-08-04', 'Confirmada');

/* ---- PAGO (10) ---- */
INSERT INTO pago (res_id, pag_fecha, pag_monto, pag_metodo) VALUES
 (1,  '2025-06-10', 160.00, 'Tarjeta'),
 (2,  '2025-06-15', 360.00, 'Efectivo'),
 (3,  '2025-06-20', 440.00, 'Transferencia'),
 (4,  '2025-07-01', 480.00, 'Tarjeta'),
 (5,  '2025-07-08',   0.00, 'Reintegro'),     -- Reserva cancelada
 (6,  '2025-07-12', 660.00, 'PayPal'),
 (7,  '2025-07-18', 300.00, 'Tarjeta'),
 (8,  '2025-07-22', 450.00, 'Efectivo'),
 (9,  '2025-07-28',  90.00, 'Transferencia'),
(10,  '2025-08-01', 520.00, 'Tarjeta');


