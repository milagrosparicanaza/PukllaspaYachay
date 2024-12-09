// routes/clase.js
const express = require('express');
const router = express.Router();
const claseController = require('../controllers/claseController');

router.get('/glosario/:id_clase', claseController.getAllGlosario);
router.get('/:id_clase', claseController.getClaseById);

module.exports = router;