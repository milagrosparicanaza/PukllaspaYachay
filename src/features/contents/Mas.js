// src/features/content/Mas.js
import React from 'react';
import { useAuth } from '../../context/AuthContext';

function Mas() {
  const { logout } = useAuth();  // Asegúrate de usar la función logout (no login) para cerrar sesión

  // Función para cerrar sesión
  const handleLogout = () => {
    logout();  // Llamada a la función logout

    window.location.href = '/login';  // Redirige a la página de login
  };

  return (
    <div>
      <h2>Sección de Más Opciones</h2>
      <p>Encuentra más herramientas y configuraciones aquí.</p>
      <button onClick={handleLogout}>Cerrar sesión</button>  {/* Botón para cerrar sesión */}
    </div>
  );
}

export default Mas;
