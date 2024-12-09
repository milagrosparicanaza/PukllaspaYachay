-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 09-12-2024 a las 03:43:27
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `bd_pukllaspa_yachay`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `id_clase` int(11) NOT NULL,
  `nombre_clase` varchar(100) NOT NULL,
  `descripcion_clase` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`id_clase`, `nombre_clase`, `descripcion_clase`) VALUES
(1, 'Animales', 'En esta sesion aprenderemos los animales'),
(2, 'Colores', '## Objetivo\r\n\r\nEn esta lección aprenderemos a nombrar y utilizar los colores en el idioma quechua. Además, exploraremos cómo los colores tienen un significado profundo en la cultura andina, y cómo se reflejan en nuestra vida cotidiana.\r\n');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase_estudiante`
--

CREATE TABLE `clase_estudiante` (
  `id_clase_estudiante` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `progreso` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clase_estudiante`
--

INSERT INTO `clase_estudiante` (`id_clase_estudiante`, `id_clase`, `id_usuario`, `progreso`) VALUES
(100, 1, 1, 10),
(101, 2, 1, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase_glosario`
--

CREATE TABLE `clase_glosario` (
  `id_clase_glosario` int(11) NOT NULL,
  `id_clase` int(11) NOT NULL,
  `id_glosario` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clase_glosario`
--

INSERT INTO `clase_glosario` (`id_clase_glosario`, `id_clase`, `id_glosario`) VALUES
(1, 2, 4),
(2, 2, 3),
(3, 2, 5),
(4, 2, 6),
(5, 2, 7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `glosario`
--

CREATE TABLE `glosario` (
  `id_glosario` int(11) NOT NULL,
  `palabra_espanol` varchar(50) NOT NULL,
  `palabra_quechua` varchar(50) NOT NULL,
  `img_glosario` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `glosario`
--

INSERT INTO `glosario` (`id_glosario`, `palabra_espanol`, `palabra_quechua`, `img_glosario`) VALUES
(1, 'casa', 'wasi', NULL),
(2, 'puerta', 'punku', NULL),
(3, 'negro', 'yana', NULL),
(4, 'blanco', 'yurak', NULL),
(5, 'rojo', 'puka', NULL),
(6, 'verde', 'qumir', NULL),
(7, 'amarillo', 'qillu', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `progreso`
--

CREATE TABLE `progreso` (
  `id_progreso` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `id_glosario` int(11) NOT NULL,
  `progreso_puntaje` float DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `progreso`
--

INSERT INTO `progreso` (`id_progreso`, `id_usuario`, `id_glosario`, `progreso_puntaje`) VALUES
(1, 1, 1, 0),
(2, 1, 4, 0),
(3, 1, 3, 0),
(4, 1, 5, 0),
(6, 1, 6, 0),
(7, 1, 7, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id_usuario` int(11) NOT NULL,
  `nombre_usuario` varchar(50) NOT NULL,
  `edad` int(11) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `img_perfil` varchar(255) DEFAULT NULL,
  `contraseña` varchar(255) NOT NULL,
  `ultimo_acceso` datetime DEFAULT NULL,
  `rol` enum('admin','maestro','estudiante') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id_usuario`, `nombre_usuario`, `edad`, `nombre`, `apellidos`, `img_perfil`, `contraseña`, `ultimo_acceso`, `rol`) VALUES
(1, 'Elvis_123', 23, 'Elvis', 'Nifla Zanca', 'public/images/usuarios/1.jpg', 'Elvis_123', NULL, 'estudiante'),
(2, 'Samuel', 40, 'Samuel', 'Ramirez', NULL, 'Samuel', '2024-11-29 14:27:09', 'estudiante');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD PRIMARY KEY (`id_clase`);

--
-- Indices de la tabla `clase_estudiante`
--
ALTER TABLE `clase_estudiante`
  ADD PRIMARY KEY (`id_clase_estudiante`),
  ADD KEY `id_clase` (`id_clase`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `clase_glosario`
--
ALTER TABLE `clase_glosario`
  ADD PRIMARY KEY (`id_clase_glosario`),
  ADD KEY `id_clase` (`id_clase`),
  ADD KEY `id_glosario` (`id_glosario`);

--
-- Indices de la tabla `glosario`
--
ALTER TABLE `glosario`
  ADD PRIMARY KEY (`id_glosario`);

--
-- Indices de la tabla `progreso`
--
ALTER TABLE `progreso`
  ADD PRIMARY KEY (`id_progreso`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `id_glosario` (`id_glosario`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id_usuario`),
  ADD UNIQUE KEY `nombre_usuario` (`nombre_usuario`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `clase`
--
ALTER TABLE `clase`
  MODIFY `id_clase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT de la tabla `clase_estudiante`
--
ALTER TABLE `clase_estudiante`
  MODIFY `id_clase_estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de la tabla `clase_glosario`
--
ALTER TABLE `clase_glosario`
  MODIFY `id_clase_glosario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `glosario`
--
ALTER TABLE `glosario`
  MODIFY `id_glosario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `progreso`
--
ALTER TABLE `progreso`
  MODIFY `id_progreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id_usuario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=72283811;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `clase_estudiante`
--
ALTER TABLE `clase_estudiante`
  ADD CONSTRAINT `clase_estudiante_ibfk_1` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id_clase`),
  ADD CONSTRAINT `clase_estudiante_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`);

--
-- Filtros para la tabla `clase_glosario`
--
ALTER TABLE `clase_glosario`
  ADD CONSTRAINT `clase_glosario_ibfk_1` FOREIGN KEY (`id_clase`) REFERENCES `clase` (`id_clase`),
  ADD CONSTRAINT `clase_glosario_ibfk_2` FOREIGN KEY (`id_glosario`) REFERENCES `glosario` (`id_glosario`);

--
-- Filtros para la tabla `progreso`
--
ALTER TABLE `progreso`
  ADD CONSTRAINT `progreso_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuario` (`id_usuario`),
  ADD CONSTRAINT `progreso_ibfk_2` FOREIGN KEY (`id_glosario`) REFERENCES `glosario` (`id_glosario`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
