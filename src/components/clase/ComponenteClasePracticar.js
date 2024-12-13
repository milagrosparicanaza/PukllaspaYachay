// src/componets/clase/ComponenteClasePracticar.js
import React from 'react';

function ComponenteClase({ clase, onClick, manejarIdClaseActual}) {
  const {nombre_clase, progreso, id_clase, boton_color } = clase;

  return (
    <div
      onClick={() => {
        manejarIdClaseActual(id_clase);  // Llamamos a la función para actualizar el estado en el componente padre
        onClick();  // También llamamos a onClick para cambiar la interfaz
      }}
   
      style={{
        backgroundColor: boton_color,
        borderRadius: '10px',
        padding: '1rem',
        textAlign: 'center',
        boxShadow: '0 4px 6px rgba(0, 0, 0, 0.1)',
        fontFamily: 'Arial, sans-serif',
        width: '250px',
        margin: 'auto',
      }}
    >
      <h2 style={{ fontSize: '1.5rem', margin: 0 }}>{nombre_clase}</h2>
      <div
        style={{
          marginTop: '1rem',
          backgroundColor: '#fff',
          borderRadius: '5px',
          height: '20px',
          overflow: 'hidden',
          display: 'flex',
          alignItems: 'center',
          justifyContent: 'flex-start',
          border: '1px solid #ccc',
        }}
      >
        <div
          style={{
            width: `${progreso}%`,
            height: '100%',
            backgroundColor: progreso > 50 ? 'green' : 'red',
            transition: 'width 0.5s ease',
          }}
        ></div>
      </div>
    </div>
  );
}

export default ComponenteClase;
