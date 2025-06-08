
// GUÍA DE CONSULTAS PARA LA BASE 'operadores'
// Estructura con dos colecciones: 'logicos' y 'relacionales'



//  Consultas sobre la colección 'logicos'


// Ejemplo → Buscar todos los operadores lógicos
// Sintaxis:
db.logicos.find({});

// Ejemplo → Buscar operador lógico por nombre (titulo)
// Sintaxis:
db.logicos.find({ titulo: "$and" });

// Ejemplo → Buscar operadores lógicos cuya descripcion contenga la palabra 'condiciones'
// Sintaxis:
db.logicos.find({ descripcion: /condiciones/ });

// Ejemplo → Mostrar solo el título y tipo de todos los operadores lógicos
// Sintaxis:
db.logicos.find({}, { titulo: 1, tipo: 1, _id: 0 });

// Ejemplo → Buscar operadores lógicos cuyo titulo comience con "$n"
// Sintaxis:
db.logicos.find({ titulo: /^\$n/ });

// Ejemplo → Contar cuántos operadores lógicos hay
// Sintaxis:
db.logicos.countDocuments({});


// Consultas sobre la colección 'relacionales'


// Ejemplo → Buscar todos los operadores relacionales
// Sintaxis:
db.relacionales.find({});

// Ejemplo → Buscar operador relacional por nombre (titulo)
// Sintaxis:
db.relacionales.find({ titulo: "$eq" });

// Ejemplo → Buscar operadores relacionales cuya descripcion contenga la palabra 'mayor'
// Sintaxis:
db.relacionales.find({ descripcion: /mayor/ });

// Ejemplo → Mostrar solo el título y tipo de todos los operadores relacionales
// Sintaxis:
db.relacionales.find({}, { titulo: 1, tipo: 1, _id: 0 });

// Ejemplo → Buscar operadores relacionales cuyo titulo comience con "$n"
// Sintaxis:
db.relacionales.find({ titulo: /^\$n/ });

// Ejemplo → Contar cuántos operadores relacionales hay
// Sintaxis:
db.relacionales.countDocuments({});
