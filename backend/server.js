// server.js
const express = require('express');
const path = require('path');
const cors = require('cors');
const db = require('./config/db'); // Importa la conexión a la base de datos
const glosarioRoutes = require('./routes/glosario'); // Ejemplo de una ruta para la tabla glosario
const usuarioRoutes = require('./routes/usuario');
const claseRoutes = require('./routes/clase');

const app = express();
const port = 3001;

// Middleware para servir archivos estáticos (como imágenes)
app.use('/public', express.static(path.join(__dirname, 'public')));

app.use(cors());
app.use(express.json());

// Usar las rutas específicas de las tablas
app.use('/glosario', glosarioRoutes);
app.use('/usuario', usuarioRoutes);
app.use('/clase', claseRoutes);

// Ruta GET para la raíz del servidor
app.get('/', (req, res) => {
  res.send('Bienvenido a la API de PUKLLASPA YACHAY');
});

app.listen(port, () => {
  console.log(`Servidor corriendo en http://localhost:${port}`);
});
