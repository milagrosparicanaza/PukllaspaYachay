import React from 'react';

function ComponenteJuegos({ nombre_juego, img_juego, boton_color, onClick }) {
  return (
    <div
    onClick={() =>{
      onClick();
    }}
      style={{
        backgroundColor: boton_color || '#007BFF',  // Asegúrate de que boton_color esté definido
        borderRadius: '10px',
        padding: '1rem',
        textAlign: 'center',
        boxShadow: '0 4px 6px rgba(0, 0, 0, 0.1)',
        fontFamily: 'Arial, sans-serif',
        width: '250px',
        margin: 'auto',
      }}
    >
      <h2 style={{ fontSize: '1.5rem', margin: 0 }}>{nombre_juego}</h2>
      
      {/* Agregar la imagen aquí */}
      {img_juego && (
        <img
          src={img_juego}
          alt={nombre_juego} 
          style={{
            width: '200px',   // Ancho fijo de 200px
            height: '200px',  // Alto fijo de 200px
            objectFit: 'cover',  // Esto asegura que la imagen se recorte para llenar el espacio
            borderRadius: '5px',
            marginTop: '1rem',
          }}
        />
      )}
    </div>
  );
}

export default ComponenteJuegos;

