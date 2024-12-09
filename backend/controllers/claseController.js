// controllers/claseController.js
const db = require('../config/db');

exports.getClaseById = (req, res) => {
    const { id_clase } = req.params; // Captura el id_clase desde los parámetros de la URL
  
    if (isNaN(id_clase) || id_clase <= 0) {
      return res.status(400).json({ error: 'El id_clase debe ser un número positivo' });
    }
  
    const sql = `
      SELECT * 
      FROM Clase 
      WHERE id_clase = ?;
    `;
  
    db.query(sql, [id_clase], (err, result) => {
      if (err) {
        console.error('Error al obtener la clase:', err);
        res.status(500).json({ error: 'Error al obtener la clase' });
      } else if (result.length === 0) {
        res.status(404).json({ error: 'Clase no encontrada' });
      } else {
        res.json(result[0]); // Devuelve solo el primer resultado (ya que es único)
      }
    });
  };

exports.getAllGlosario = (req, res) => {
  const { id_clase } = req.params; // Captura el id_clase desde los parámetros de la URL

  if (isNaN(id_clase) || id_clase <= 0) {
    return res.status(400).json({ error: 'El id_clase debe ser un número positivo' });
  }

  const sql = `
    SELECT g.*
    FROM Glosario g
    JOIN Clase_Glosario cg ON g.id_glosario = cg.id_glosario
    WHERE cg.id_clase = ?;
  `;

  db.query(sql, [id_clase], (err, result) => {
    if (err) {
      console.error('Error al obtener el glosario para la clase:', err);
      res.status(500).json({ error: 'Error al obtener el glosario para la clase' });
    } else {
      res.json(result); // Envía el resultado (glosarios asociados a la clase)
    }
  });
};
