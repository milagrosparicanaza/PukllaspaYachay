// src/components/clase/Clase.js
import axios from 'axios';
import API_BASE_URL from '../../config/Config';

// Función para obtener el glosario de una clase
const obtenerGlosarioClase = async (id_clase) => {
  try {
    // Realizamos una solicitud GET al servidor para obtener el glosario de la clase
    const response = await axios.get(`${API_BASE_URL}/clase/glosario/${id_clase}`);
  
    // Si la solicitud es exitosa, devolvemos los datos del glosario
    return response.data;
  } catch (err) {
    if (err.response) {
      // Si el servidor devuelve un error, lo lanzamos para manejarlo fuera de la función
      throw new Error(err.response.data.error);
    } else {
      // Si ocurre un error de red u otro tipo de error
      throw new Error('Error de red o servidor no disponible');
    }
  }
};

// Función para obtener la información de la clase por su id
const obtenerClasePorId = async (id_clase) => {
  try {
    // Realizamos una solicitud GET al servidor para obtener la información de la clase
    const response = await axios.get(`${API_BASE_URL}/clase/${id_clase}`);
  
    // Si la solicitud es exitosa, devolvemos los datos de la clase
    return response.data;
  } catch (err) {
    if (err.response) {
      // Si el servidor devuelve un error, lo lanzamos para manejarlo fuera de la función
      throw new Error(err.response.data.error);
    } else {
      // Si ocurre un error de red u otro tipo de error
      throw new Error('Error de red o servidor no disponible');
    }
  }
};

export { obtenerGlosarioClase, obtenerClasePorId };
