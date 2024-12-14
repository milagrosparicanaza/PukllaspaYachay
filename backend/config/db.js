// config/db.js
require('dotenv').config();
const mysql = require('mysql2');

// Verifica que las variables de entorno se carguen correctamente 
console.log('MYSQLHOST:', process.env.MYSQLHOST); 
console.log('MYSQLUSER:', process.env.MYSQLUSER); 
console.log('MYSQLPASSWORD:', process.env.MYSQLPASSWORD); 
console.log('MYSQL_DATABASE:', process.env.MYSQL_DATABASE); 
console.log('MYSQLPORT:', process.env.MYSQLPORT);

const db = mysql.createConnection({
  host: process.env.MYSQLHOST,
  user: process.env.MYSQLUSER,
  password: process.env.MYSQLPASSWORD,
  database: process.env.MYSQL_DATABASE,
  port: process.env.MYSQLPORT
});

db.connect((err) => {
  if (err) {
    console.error('Error al conectar a la base de datos:', err);
    throw err;
  }
  console.log('Conectado a MySQL');
});

module.exports = db;
