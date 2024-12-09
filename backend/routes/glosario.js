// routes/glosario.js
const express = require('express');
const router = express.Router();
const glosarioController = require('../controllers/glosarioController');

// Define las rutas y asigna los métodos del controlador
router.get('/', glosarioController.get);
router.get('/buscar-espanol', glosarioController.getByFilterPalabraEspanol);// Ruta para obtener palabras con filtro en palabra_espanol
router.get('/elementos-menor-puntaje-aleatorio/:n', glosarioController.getNElementosMenorPuntaje);
router.get('/glosario-por-usuario-y-clase', glosarioController.getGlosariosByUserAndClass)
router.post('/', glosarioController.create);
router.put('/:id', glosarioController.update);
router.delete('/:id', glosarioController.delete);

module.exports = router;
