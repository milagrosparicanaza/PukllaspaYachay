// src/features/contents/Aprender.js
import React, { useState, useEffect } from 'react';
import { clasesDeUsuario } from '../../components/usuario/Usuario';
import ComponenteClase from '../../components/ComponenteClase';
import { obtenerClasePorId, obtenerGlosarioClase } from '../../components/clase/Clase';
import { Markdown } from '../../features/formateo/Markdown'; // Importamos la función Markdown

const InterfazMostrarClases = ({ cambiarInterface, userId, manejarIdClaseActual }) => {
  const [clases, setClases] = useState([]); 
  const [error, setError] = useState(null);

  useEffect(() => {
    if (userId) {
      // Usamos la función clasesDeUsuario para obtener las clases del usuario
      clasesDeUsuario(userId)
        .then((data) => {
          setClases(data);
        })
        .catch((err) => {
          setError('Error al obtener las clases del usuario');
        });
    }
  }, [userId]);
  
  return(
  <div>
    <h2>Bienvenido a la sección Aprender</h2>
    <p>Aquí encontrarás recursos y contenido educativo para mejorar tus habilidades.</p>

    {error && <p>{error}</p>} {/* Si hay un error, lo mostramos */}

    {clases.length > 0 ? (
      <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem', padding: '1rem' }}>
        {clases.map((clase) => (
          <ComponenteClase 
            key={clase.id_clase} 
            clase={clase} 
            onClick={() => cambiarInterface('B')} 
            manejarIdClaseActual={manejarIdClaseActual}
          />
        ))}
      </div>
    ) : (
      <p>No tienes clases disponibles o aún no has comenzado ninguna clase.</p>
    )}
  </div>
  );
};

const InterfazMostrarContenidoClase = ({ cambiarInterface, id_claseActual }) => {
  const [clase, setClase] = useState(null);
  const [glosario, setGlosario] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    if (id_claseActual) {
      // Obtener los detalles de la clase
      obtenerClasePorId(id_claseActual)
        .then((data) => {
          setClase(data); // Guardamos la clase en el estado
        })
        .catch((err) => {
          setError('Error al obtener la clase');
          console.error(err);
        });

      // Obtener el glosario de la clase
      obtenerGlosarioClase(id_claseActual)
        .then((data) => {
          setGlosario(data); // Guardamos el glosario en el estado
        })
        .catch((err) => {
          setError('Error al obtener el glosario');
          console.error(err);
        });
    }
  }, [id_claseActual]); // Este efecto se ejecuta cuando cambia el id de la clase actual

  return (
    <div>
      {error && <p>{error}</p>} {/* Si hay un error, lo mostramos */}

      {/* Si los datos de la clase están disponibles */}
      {clase && (
        <div>
          <h2>{clase.nombre_clase}</h2>
          {/* Aplicamos Markdown a la descripcion_clase */}
          <p dangerouslySetInnerHTML={{ __html: Markdown(clase.descripcion_clase) }} />
        </div>
      )}

      {/* Mostrar el glosario de la clase */}
      {glosario.length > 0 && (
        <div>
          <h2>Glosario</h2>
          <ul>
            {glosario.map((item, index) => (
              <li key={index}>{item.palabra_espanol} - {item.palabra_quechua}</li>
            ))}
          </ul>
        </div>
      )}

      <button onClick={() => cambiarInterface('A')}>Atras</button>
      <button onClick={() => cambiarInterface('C')}>Practicar</button>
    </div>
  );
};

const InterfazC = ({ cambiarInterface }) => (
  <div>
    <h2>Interfaz C</h2>
    <p>Contenido de la interfaz C.</p>
    <button onClick={() => cambiarInterface('A')}>Ir a Interfaz A</button>
  </div>
);

const Aprender = ({ userId }) => {
  const [currentInterface, setCurrentInterface] = useState('A');
  const [id_claseActual, setClaseActual] = useState(null);

  const manejarCambioInterface = (interfaceName) => {
    setCurrentInterface(interfaceName);
  };

  const manejarIdClaseActual = (claseId) => {
    setClaseActual(claseId);
  };

  return (
    <div>
      {/* Mostrar la interfaz actual */}
      {currentInterface === 'A' && <InterfazMostrarClases cambiarInterface={manejarCambioInterface} userId={userId} manejarIdClaseActual={manejarIdClaseActual}/>}
      {currentInterface === 'B' && <InterfazMostrarContenidoClase cambiarInterface={manejarCambioInterface} id_claseActual={id_claseActual} />}
      {currentInterface === 'C' && <InterfazC cambiarInterface={manejarCambioInterface} />}
    </div>
  );
};

export default Aprender;
