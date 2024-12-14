// controllers/glosarioController.js
const db = require('../config/db');

// Obtener palabras con paginación
exports.get = (req, res) => {
  const limit = parseInt(req.query.limit, 10) || 10; // Número de elementos por página (10 por defecto)
  const page = parseInt(req.query.page, 10) || 1; // Página actual (1 por defecto)
  const offset = (page - 1) * limit; // Cálculo del offset para SQL

  const sql = `SELECT * FROM glosario LIMIT ${limit} OFFSET ${offset}`;

  db.query(sql, (err, result) => {
    if (err) {
      console.error('Error al obtener el glosario:', err);
      res.status(500).json({ error: 'Error al obtener el glosario' });
    } else {
      res.json(result); // Envía la página solicitada de datos
    }
  });
};

// Obtener palabras en base a un filtro aplicado a palabra_espanol
exports.getByFilterPalabraEspanol = (req, res) => {
  const { filtro } = req.query; // Captura el parámetro de filtro

  const sql = 'SELECT * FROM glosario WHERE palabra_espanol LIKE ?';
  const filterValue = `%${filtro}%`; // Usa comodines para buscar coincidencias parciales

  db.query(sql, [filterValue], (err, result) => {
    if (err) {
      console.error('Error al obtener palabras filtradas:', err);
      res.status(500).json({ error: 'Error al obtener palabras filtradas' });
    } else {
      res.json(result); // Envía el resultado filtrado
    }
  });
};

// Obtener los N elementos con el menor puntaje en orden aleatorio
exports.getNElementosMenorPuntaje = (req, res) => {
  const n = parseInt(req.params.n, 10); // Captura el límite de elementos desde los parámetros de la URL

  if (isNaN(n) || n <= 0) {
    return res.status(400).json({ error: 'El parámetro debe ser un número positivo' });
  }

  const sql = `
    SELECT * FROM (
      SELECT * FROM glosario
      ORDER BY puntaje ASC
      LIMIT ?
    ) AS subquery
    ORDER BY RAND();
  `;

  db.query(sql, [n], (err, result) => {
    if (err) {
      console.error('Error al obtener los elementos con el menor puntaje en orden aleatorio:', err);
      res.status(500).json({ error: 'Error al obtener los elementos con el menor puntaje en orden aleatorio' });
    } else {
      res.json(result); // Envía los resultados al frontend
    }
  });
};

exports.getGlosariosByUserAndClass = (req, res) => {
  const { id_usuario, id_clase } = req.query;  // Captura los parámetros de id_usuario y id_clase

  if (!id_usuario || !id_clase) {
    return res.status(400).json({ error: 'Faltan parámetros: id_usuario o id_clase' });
  }

  const sql = `
  SELECT 
    g.id_glosario,
    g.palabra_espanol,
    g.palabra_quechua,
    g.img_glosario,
    p.progreso_puntaje
  FROM 
    glosario g
  JOIN 
    clase_glosario cg ON g.id_glosario = cg.id_glosario
  JOIN 
    progreso p ON g.id_glosario = p.id_glosario
  WHERE 
    p.id_usuario = ?   
    AND cg.id_clase = ?;  

  `;
  
  db.query(sql, [id_usuario, id_clase], (err, result) => {
    if (err) {
      console.error('Error al obtener glosarios del usuario:', err);
      res.status(500).json({ error: 'Error al obtener los glosarios del usuario' });
    } else {
      res.json(result); // Envía el resultado filtrado
    }
  });
};

// Añadir una nueva palabra al glosario
exports.create = (req, res) => {
  const { palabra_espanol, palabra_quechua, puntaje } = req.body;
  const sql = 'INSERT INTO glosario (palabra_espanol, palabra_quechua, puntaje) VALUES (?, ?, ?)';
  db.query(sql, [palabra_espanol, palabra_quechua, puntaje || 0], (err, result) => {
    if (err) {
      console.error('Error al añadir palabra:', err);
      res.status(500).json({ error: 'Error al añadir palabra' });
    } else {
      res.send('Palabra añadida al glosario');
    }
  });
};

// Actualizar una palabra en el glosario
exports.update = (req, res) => {
  const { id } = req.params;
  const { palabra_espanol, palabra_quechua, puntaje } = req.body;
  const sql = 'UPDATE glosario SET palabra_espanol = ?, palabra_quechua = ?, puntaje = ? WHERE id = ?';
  db.query(sql, [palabra_espanol, palabra_quechua, puntaje, id], (err, result) => {
    if (err) {
      console.error('Error al actualizar palabra:', err);
      res.status(500).json({ error: 'Error al actualizar palabra' });
    } else {
      res.send('Palabra actualizada en el glosario');
    }
  });
};

// Eliminar una palabra del glosario
exports.delete = (req, res) => {
  const { id } = req.params;
  const sql = 'DELETE FROM glosario WHERE id = ?';
  db.query(sql, [id], (err, result) => {
    if (err) {
      console.error('Error al eliminar palabra:', err);
      res.status(500).json({ error: 'Error al eliminar palabra' });
    } else {
      res.send('Palabra eliminada del glosario');
    }
  });
};
