// src/components/glosario/Glosario.js

import axios from "axios";
import API_BASE_URL from "../../config/Config";

// Función para obtener el glosario por clase y usuario
const obtenerGlosarioPorClaseYEstudiante = async (id_clase, id_usuario) => {
  try {
    // Realizamos la solicitud GET a la API del backend
    const response = await axios.get(`${API_BASE_URL}/glosario/glosario-por-usuario-y-clase`, {
      params: {
        id_clase: id_clase,
        id_usuario: id_usuario
      }
    });

    // Si la solicitud es exitosa, retornamos los datos
    return response.data;
  } catch (error) {
    // Si ocurre un error, lo capturamos y mostramos el mensaje de error
    console.error("Error al obtener el glosario:", error);
    throw new Error("No se pudo obtener el glosario para el usuario y clase especificados.");
  }
};

export default obtenerGlosarioPorClaseYEstudiante;
