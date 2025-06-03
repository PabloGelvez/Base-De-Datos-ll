# Disparadores (*Triggers*) en Bases de Datos

## ¿Qué son?
Un **disparador** es una unidad lógica que vive dentro del motor de la base de datos y **se ejecuta de forma automática** cuando ocurre un evento predefinido (inserción, actualización, eliminación, etc.) sobre una tabla o vista. Funciona como un “observador” que detecta el cambio y lanza la lógica que hayas definido, todo dentro de la misma transacción.

## ¿Para qué sirven?
- **Garantizar reglas de negocio complejas** que no pueden expresarse solo con restricciones (`CHECK`, claves externas, etc.).  
- **Auditar cambios** registrando qué se modificó, quién lo hizo y cuándo.  
- **Sincronizar o derivar datos** (p. ej., mantener tablas resumen, históricos o bitácoras).  
- **Automatizar procesos** internos (cálculos, envío de notificaciones, actualizaciones encadenadas).  

## Ventajas
1. **Automatización transparente:** la lógica se ejecuta sin intervención de la aplicación cliente.  
2. **Consistencia centralizada:** todas las interfaces que acceden a la BD obedecen la misma regla.  
3. **Seguridad:** evita que los desarrolladores olviden validaciones críticas.  
4. **Auditoría fiable:** el registro de cambios queda en manos del SGBD, no del front-end.

## Desventajas
1. **Complejidad oculta:** el flujo de datos es menos evidente y puede dificultar el mantenimiento.  
2. **Impacto en el rendimiento:** lógica pesada dentro de un disparador alarga la transacción.  
3. **Portabilidad limitada:** cada SGBD posee dialéctos y capacidades distintas.  
4. **Riesgo de recursión/bucles:** un disparador que modifica la misma tabla (o tablas encadenadas) puede auto-invocarse y generar bloqueos si no se diseña bien.

## Sintaxis genérica (conceptual)
1. **Definir la lógica** en el lenguaje procedimental que admita el SGBD (PL/pgSQL, T-SQL, PL/SQL, etc.).  
2. **Crear el disparador** indicando:
   - **Momento:** `BEFORE`, `AFTER` o `INSTEAD OF` (según el motor).  
   - **Evento:** `INSERT`, `UPDATE`, `DELETE` (algunos motores añaden `TRUNCATE` o eventos de sentencia).  
   - **Ámbito:** `FOR EACH ROW` (sobre cada fila) o `FOR EACH STATEMENT` (una vez por sentencia).  
   - **Objeto:** la tabla o vista que vigilará.  
   - **Acción:** vincular la lógica escrita en el paso 1.

> **Nota:** la forma concreta de la orden `CREATE TRIGGER` varía entre PostgreSQL, MySQL/MariaDB, SQL Server, Oracle, etc.; consulta la documentación de tu motor para la sintaxis exacta.

## ¿Cómo se utilizan? — Buenas prácticas
- Decide si la lógica debe ejecutarse **antes** (para validar o modificar datos) o **después** (para auditoría o procesos dependientes de cambios ya confirmados).  
- Mantén el código del disparador **ligero y focalizado**; delega las tareas costosas a procesos asíncronos si es posible.  
- **Documenta** el propósito y el efecto de cada disparador para evitar confusión futura.  
- Controla la **recursión** y los efectos laterales: usa banderas, tablas de control o cláusulas que impidan invocaciones infinitas.  
- Incluye el disparador en tu **suite de pruebas** para asegurarte de que se comporta como se espera tras cada cambio de esquema.

---

> **Resumen:** los disparadores son poderosas herramientas para reforzar integridad, auditoría y automatización directamente en la capa de datos. Aprovecha su potencial diseñándolos con moderación, documentándolos claramente y midiendo su impacto en el rendimiento.

