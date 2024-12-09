// Perfil.js
import React from 'react';
import MostrarUsuario from '../../components/usuario/MostrarUsuario'

const Perfil = ({ userId }) => {
  return (
    <div>
      <h2>Bienvenido a tu Perfil</h2>
      <p>Administra tu información y personaliza tu experiencia.</p>
      <MostrarUsuario userId={userId}/>
    </div>
  );
}

export default Perfil;