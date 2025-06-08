# Taller 09/06/25 — **Operadores Lógicos y Relacionales en MongoDB**

## Descripción

En este taller se trabajó con la base de datos **MongoDB** para realizar una práctica sobre los **operadores lógicos y relacionales** que ofrece el lenguaje de consultas de MongoDB.

El objetivo fue crear una base de datos organizada que permitiera almacenar, consultar y practicar con estos operadores.

## Actividades realizadas

✅ Se creó una base de datos con dos colecciones:

- **`logicos`** → contiene los operadores lógicos de MongoDB:
  - `$and`
  - `$or`
  - `$not`
  - `$nor`

- **`relacionales`** → contiene los operadores de comparación y otros operadores relacionales de MongoDB:
  - `$eq`
  - `$ne`
  - `$gt`
  - `$gte`
  - `$lt`
  - `$lte`
  - `$in`
  - `$nin`
  - `$exists`
  - `$type`

✅ Se insertaron documentos en cada colección. Cada documento contiene los siguientes campos:

- **`titulo`**: nombre del operador (por ejemplo `$and`).
- **`tipo`**: tipo de operador (`Lógico` o `Relacional`).
- **`descripcion`**: breve descripción del uso del operador.
- **`sintaxis`**: ejemplo de cómo se usa el operador.
- **`ejemplo`**: ejemplo concreto del uso.

✅ Se creó un archivo de **guía de consultas**, en el cual se incluyen ejemplos prácticos de consultas que se pueden realizar sobre las colecciones:

- Consultar todos los operadores de una colección.
- Buscar operadores por nombre.
- Buscar operadores que contengan ciertas palabras en la descripción o en el campo ejemplo.
- Mostrar únicamente campos seleccionados (por ejemplo título y tipo).
- Contar la cantidad de documentos en cada colección.

## Propósito del taller

Este taller sirve como guía de consulta y práctica para aprender a trabajar con:

- La creación y uso de colecciones en MongoDB.
- La inserción de documentos estructurados.
- Consultas básicas y avanzadas utilizando:
  - `find()`
  - expresiones regulares (regex)
  - proyecciones de campos
  - conteo de documentos

## Archivos del taller

- **`insert_operadores.js`** → contiene el código para crear las dos colecciones (`logicos` y `relacionales`) y sus documentos.
- **`consultas_operadores.js`** → contiene ejemplos de consultas para practicar con la base de datos creada.

---
