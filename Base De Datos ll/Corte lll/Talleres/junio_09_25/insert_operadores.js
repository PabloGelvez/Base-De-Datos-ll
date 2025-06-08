// Operadores Lógicos

var operadorAnd = {
  titulo: "$and",
  tipo: "Lógico",
  descripcion: "Devuelve los documentos que cumplen todas las condiciones especificadas.",
  sintaxis: "{ $and: [ { <expresión1> }, { <expresión2> }, ... ] }",
  ejemplo: "{ $and: [ { edad: { $gt: 18 } }, { activo: true } ] }"
};

var operadorOr = {
  titulo: "$or",
  tipo: "Lógico",
  descripcion: "Devuelve los documentos que cumplen al menos una condición.",
  sintaxis: "{ $or: [ { <expresión1> }, { <expresión2> }, ... ] }",
  ejemplo: "{ $or: [ { ciudad: 'Bogotá' }, { ciudad: 'Medellín' } ] }"
};

var operadorNot = {
  titulo: "$not",
  tipo: "Lógico",
  descripcion: "Invierte el resultado de una expresión de consulta.",
  sintaxis: "{ campo: { $not: { <operador-expresión> } } }",
  ejemplo: "{ edad: { $not: { $gt: 65 } } }"
};

var operadorNor = {
  titulo: "$nor",
  tipo: "Lógico",
  descripcion: "Devuelve documentos que no cumplen ninguna de las condiciones especificadas.",
  sintaxis: "{ $nor: [ { <expresión1> }, { <expresión2> }, ... ] }",
  ejemplo: "{ $nor: [ { ciudad: 'Bogotá' }, { activo: false } ] }"
};

// Insertamos los operadores LÓGICOS en la colección "logicos"

db.logicos.insertMany([
  operadorAnd,
  operadorOr,
  operadorNot,
  operadorNor
]);

// Operadores Relacionales (Comparación)

var operadorEq = {
  titulo: "$eq",
  tipo: "Relacional",
  descripcion: "Compara si el valor del campo es igual al valor especificado.",
  sintaxis: "{ campo: { $eq: <valor> } }",
  ejemplo: "{ edad: { $eq: 30 } }"
};

var operadorNe = {
  titulo: "$ne",
  tipo: "Relacional",
  descripcion: "Compara si el valor del campo es diferente al valor especificado.",
  sintaxis: "{ campo: { $ne: <valor> } }",
  ejemplo: "{ estado: { $ne: 'activo' } }"
};

var operadorGt = {
  titulo: "$gt",
  tipo: "Relacional",
  descripcion: "Compara si el valor del campo es mayor que el valor especificado.",
  sintaxis: "{ campo: { $gt: <valor> } }",
  ejemplo: "{ edad: { $gt: 18 } }"
};

var operadorGte = {
  titulo: "$gte",
  tipo: "Relacional",
  descripcion: "Compara si el valor del campo es mayor o igual que el valor especificado.",
  sintaxis: "{ campo: { $gte: <valor> } }",
  ejemplo: "{ edad: { $gte: 65 } }"
};

var operadorLt = {
  titulo: "$lt",
  tipo: "Relacional",
  descripcion: "Compara si el valor del campo es menor que el valor especificado.",
  sintaxis: "{ campo: { $lt: <valor> } }",
  ejemplo: "{ precio: { $lt: 100 } }"
};

var operadorLte = {
  titulo: "$lte",
  tipo: "Relacional",
  descripcion: "Compara si el valor del campo es menor o igual que el valor especificado.",
  sintaxis: "{ campo: { $lte: <valor> } }",
  ejemplo: "{ edad: { $lte: 12 } }"
};

var operadorIn = {
  titulo: "$in",
  tipo: "Relacional",
  descripcion: "El valor del campo coincide con alguno de los valores especificados en un arreglo.",
  sintaxis: "{ campo: { $in: [ <valor1>, <valor2>, ... ] } }",
  ejemplo: "{ ciudad: { $in: ['Bogotá', 'Cali', 'Medellín'] } }"
};

var operadorNin = {
  titulo: "$nin",
  tipo: "Relacional",
  descripcion: "El valor del campo no coincide con ninguno de los valores especificados en un arreglo.",
  sintaxis: "{ campo: { $nin: [ <valor1>, <valor2>, ... ] } }",
  ejemplo: "{ categoria: { $nin: ['ropa', 'calzado'] } }"
};

var operadorExists = {
  titulo: "$exists",
  tipo: "Relacional",
  descripcion: "Devuelve documentos si el campo especificado existe o no.",
  sintaxis: "{ campo: { $exists: <booleano> } }",
  ejemplo: "{ telefono: { $exists: true } }"
};

var operadorType = {
  titulo: "$type",
  tipo: "Relacional",
  descripcion: "Devuelve documentos donde el campo es de un tipo especificado.",
  sintaxis: "{ campo: { $type: <alias o número de tipo BSON> } }",
  ejemplo: "{ edad: { $type: 'int' } }"
};

// Insertamos los operadores RELACIONALES en la colección "relacionales"

db.relacionales.insertMany([
  operadorEq,
  operadorNe,
  operadorGt,
  operadorGte,
  operadorLt,
  operadorLte,
  operadorIn,
  operadorNin,
  operadorExists,
  operadorType
]);


// Operadores Relacionales (Comparación)

var operadorEq = {
  titulo: "$eq",
  tipo: "Relacional",
  descripcion: "Compara si el valor del campo es igual al valor especificado.",
  sintaxis: "{ campo: { $eq: <valor> } }",
  ejemplo: "{ edad: { $eq: 30 } }"
};

var operadorNe = {
  titulo: "$ne",
  tipo: "Relacional",
  descripcion: "Compara si el valor del campo es diferente al valor especificado.",
  sintaxis: "{ campo: { $ne: <valor> } }",
  ejemplo: "{ estado: { $ne: 'activo' } }"
};

var operadorGt = {
  titulo: "$gt",
  tipo: "Relacional",
  descripcion: "Compara si el valor del campo es mayor que el valor especificado.",
  sintaxis: "{ campo: { $gt: <valor> } }",
  ejemplo: "{ edad: { $gt: 18 } }"
};

var operadorGte = {
  titulo: "$gte",
  tipo: "Relacional",
  descripcion: "Compara si el valor del campo es mayor o igual que el valor especificado.",
  sintaxis: "{ campo: { $gte: <valor> } }",
  ejemplo: "{ edad: { $gte: 65 } }"
};

var operadorLt = {
  titulo: "$lt",
  tipo: "Relacional",
  descripcion: "Compara si el valor del campo es menor que el valor especificado.",
  sintaxis: "{ campo: { $lt: <valor> } }",
  ejemplo: "{ precio: { $lt: 100 } }"
};

var operadorLte = {
  titulo: "$lte",
  tipo: "Relacional",
  descripcion: "Compara si el valor del campo es menor o igual que el valor especificado.",
  sintaxis: "{ campo: { $lte: <valor> } }",
  ejemplo: "{ edad: { $lte: 12 } }"
};

var operadorIn = {
  titulo: "$in",
  tipo: "Relacional",
  descripcion: "El valor del campo coincide con alguno de los valores especificados en un arreglo.",
  sintaxis: "{ campo: { $in: [ <valor1>, <valor2>, ... ] } }",
  ejemplo: "{ ciudad: { $in: ['Bogotá', 'Cali', 'Medellín'] } }"
};

var operadorNin = {
  titulo: "$nin",
  tipo: "Relacional",
  descripcion: "El valor del campo no coincide con ninguno de los valores especificados en un arreglo.",
  sintaxis: "{ campo: { $nin: [ <valor1>, <valor2>, ... ] } }",
  ejemplo: "{ categoria: { $nin: ['ropa', 'calzado'] } }"
};

var operadorExists = {
  titulo: "$exists",
  tipo: "Relacional",
  descripcion: "Devuelve documentos si el campo especificado existe o no.",
  sintaxis: "{ campo: { $exists: <booleano> } }",
  ejemplo: "{ telefono: { $exists: true } }"
};

var operadorType = {
  titulo: "$type",
  tipo: "Relacional",
  descripcion: "Devuelve documentos donde el campo es de un tipo especificado.",
  sintaxis: "{ campo: { $type: <alias o número de tipo BSON> } }",
  ejemplo: "{ edad: { $type: 'int' } }"
};

// Insertamos todos los operadores

db.operadores.insertMany([
  operadorAnd,
  operadorOr,
  operadorNot,
  operadorNor,
  operadorEq,
  operadorNe,
  operadorGt,
  operadorGte,
  operadorLt,
  operadorLte,
  operadorIn,
  operadorNin,
  operadorExists,
  operadorType
]);

