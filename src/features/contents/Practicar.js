// src/features/contents/Practicar.js
import React, { useState, useEffect } from 'react';
import { clasesDeUsuario } from '../../components/usuario/Usuario';
import ComponenteClasePracticar from '../../components/clase/ComponenteClasePracticar';
import obtenerGlosarioPorClaseYEstudiante from '../../components/glosario/Glosario';
import ComponenteGlosarioPracticar from '../../components/glosario/ComponenteGlosarioPracticar';

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
    <h2>Bienvenido a la sección Practicar</h2>
    <p>Aquí podrás poner en práctica lo que has aprendido.</p>
    {error && <p>{error}</p>} {/* Si hay un error, lo mostramos */}

    {clases.length > 0 ? (
      <div style={{ display: 'flex', flexDirection: 'column', gap: '1rem', padding: '1rem' }}>
        {clases.map((clase) => (
          <ComponenteClasePracticar 
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

const InterfazPracticarGlosarioClase = ({cambiarInterface, id_claseActual, id_usuario}) => {
  const [glosario, setGlosario] = useState([]);
  const [error, setError] = useState(null);

  useEffect(() => {
    if (id_claseActual && id_usuario) {
      // Obtener el glosario de la clase
      obtenerGlosarioPorClaseYEstudiante(id_claseActual, id_usuario)
        .then((data) => {
          setGlosario(data); // Guardamos el glosario en el estado
        })
        .catch((err) => {
          setError('Error al obtener el glosario');
          console.error(err);
        });
    }
  }, [id_claseActual, id_usuario]); // Este efecto se ejecuta cuando cambia el id de la clase actual

  return (
    <div>
      {error && <p>{error}</p>} {/* Si hay un error, lo mostramos */}

      {/* Mostrar el glosario de la clase */}
      {glosario.length > 0 && (
        <div>
          <ComponenteGlosarioPracticar glosario={glosario} />
        </div>
      )}
      <button 
        onClick={() => cambiarInterface('A')} 
        style={{
          backgroundColor: '#007BFF',  // Azul
          color: '#fff',               // Texto blanco
          border: 'none',              // Sin borde
          borderRadius: '5px',         // Bordes redondeados
          padding: '10px 20px',        // Espaciado interno
          fontSize: '16px',            // Tamaño de fuente
          cursor: 'pointer',          // Cursor de mano al pasar por encima
          transition: 'background-color 0.3s',  // Efecto suave en el cambio de color
          marginRight: '10px',         // Separación entre los botones
        }}
        onMouseEnter={(e) => e.target.style.backgroundColor = '#0056b3'} // Cambio de color al pasar el mouse
        onMouseLeave={(e) => e.target.style.backgroundColor = '#007BFF'}  // Vuelve al color original
      >
        Atras
      </button>
    </div> 
  );
};

function Practicar({userId}) {
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
      {currentInterface === 'B' && <InterfazPracticarGlosarioClase cambiarInterface={manejarCambioInterface} id_claseActual={id_claseActual} id_usuario={userId}/>}
    </div>
  );
}

export default Practicar;
