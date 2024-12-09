// components/PublicLayout.js
import React from "react";
import { Outlet } from "react-router-dom";

function PublicLayout() {
  return (
    <div>
      <Outlet />  {/* Solo se renderiza el contenido de la ruta pública */}
    </div>
  );
}

export default PublicLayout;
