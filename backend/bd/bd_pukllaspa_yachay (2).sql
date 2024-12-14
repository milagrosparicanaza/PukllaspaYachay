-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 14-12-2024 a las 03:33:26
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
  `descripcion_clase` text DEFAULT NULL,
  `img_clase` varchar(255) DEFAULT NULL,
  `boton_color` varchar(7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `clase`
--

INSERT INTO `clase` (`id_clase`, `nombre_clase`, `descripcion_clase`, `img_clase`, `boton_color`) VALUES
(1, 'Animales', 'En esta sesion aprenderemos los animales', 'public/images/clases/animales.jpg', '#FFA851'),
(2, 'Colores', '## Objetivo\r\n\r\nEn esta lección aprenderemos a nombrar y utilizar los colores en el idioma quechua. Además, exploraremos cómo los colores tienen un significado profundo en la cultura andina, y cómo se reflejan en nuestra vida cotidiana.\r\n', 'public/images/clases/colores.jpg', '#4CAF50'),
(101, 'Objetos', '¡Bienvenidos al curso de **Enseñanza de Objetos en Quechua**! Este curso está diseñado para aquellos que desean aprender vocabulario relacionado con los objetos en la lengua quechua, promoviendo el entendimiento de su uso cotidiano en contextos culturales y lingüísticos.\r\n\r\n## Objetivos del Curso\r\n\r\n- **Aprender el vocabulario básico** de objetos comunes en quechua.\r\n- **Desarrollar habilidades para identificar objetos** en diferentes contextos.\r\n- **Fomentar la integración de objetos quechuas** en la vida diaria de los estudiantes.\r\n\r\n## Contenido del Curso\r\n\r\n### Lección 1: Objetos del Hogar\r\nEn esta lección, aprenderás sobre los objetos más comunes que puedes encontrar en una casa típica en las comunidades quechuas.\r\n\r\n- **Ñawi** - Ojo\r\n- **Wasi** - Casa\r\n- **Panka** - Mesa\r\n- **Ñawi wasi** - Espejo\r\n\r\n### Lección 2: Objetos Naturales\r\nConocerás algunos de los objetos naturales más relevantes en la vida diaria, relacionados con la naturaleza y el entorno.\r\n\r\n- **Sumaq** - Hermoso\r\n- **Ñawi** - Ojo\r\n- **Ñawi chakra** - Huerta\r\n\r\n### Lección 3: Objetos de Trabajo\r\nEn esta lección, se abordarán objetos comunes usados en actividades laborales y agrícolas en la región andina.\r\n\r\n- **Chaka** - Herramienta\r\n- **Kallpa** - Fuerza\r\n- **Pampa** - Campo\r\n\r\n## Modalidad del Curso\r\n\r\nEl curso se imparte de manera **virtual** y se organiza en **lecciones semanales**. Cada lección incluye un video educativo, ejercicios prácticos y un cuestionario al final.\r\n\r\n- **Duración:** 4 semanas\r\n- **Modalidad:** Online\r\n- **Requisitos:** Conocimiento básico de quechua (opcional)', 'public/images/clases/objetos.jpg', '#9f5faf');

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
(101, 2, 1, 0),
(102, 101, 1, 50);

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
(5, 2, 7),
(6, 2, 8),
(7, 2, 9),
(8, 1, 10),
(9, 1, 11),
(10, 2, 12),
(11, 101, 13),
(12, 101, 14),
(13, 101, 15);

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
(1, 'casa', 'wasi', '/public/images/glosarios/glosario_1.jpg'),
(2, 'puerta', 'punku', '/public/images/glosarios/glosario_2.jpg'),
(3, 'negro', 'yana', '/public/images/glosarios/glosario_3.jpg'),
(4, 'blanco', 'yurak', '/public/images/glosarios/glosario_4.jpg'),
(5, 'rojo', 'puka', '/public/images/glosarios/glosario_5.jpg'),
(6, 'verde', 'qumir', '/public/images/glosarios/glosario_6.png'),
(7, 'amarillo', 'qillu', '/public/images/glosarios/glosario_7.jpg'),
(8, 'azul', 'anqas', '/public/images/glosarios/glosario_8.png'),
(9, 'rosado', 'panti', '/public/images/glosarios/glosario_9.jpg'),
(10, 'zorro', 'atuq', '/public/images/glosarios/glosario_10.jpg'),
(11, 'perro', 'alqu', '/public/images/glosarios/glosario_11.jpg'),
(12, 'vaca', 'waka', '/public/images/glosarios/glosario_12.jpg'),
(13, 'cama', 'kawitu', '/public/images/glosarios/glosario_13.jpg'),
(14, 'ventana', 'wasi tuqu', '/public/images/glosarios/glosario_14.jpg'),
(15, 'casa', 'pichana', '/public/images/glosarios/glosario_15.png');

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
(7, 1, 7, 0),
(8, 1, 8, 0),
(9, 1, 9, 0),
(10, 1, 10, 0),
(11, 1, 11, 0),
(12, 1, 12, 0),
(13, 1, 13, 0),
(14, 1, 14, 0),
(15, 1, 15, 0);

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
  MODIFY `id_clase` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT de la tabla `clase_estudiante`
--
ALTER TABLE `clase_estudiante`
  MODIFY `id_clase_estudiante` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=103;

--
-- AUTO_INCREMENT de la tabla `clase_glosario`
--
ALTER TABLE `clase_glosario`
  MODIFY `id_clase_glosario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `glosario`
--
ALTER TABLE `glosario`
  MODIFY `id_glosario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `progreso`
--
ALTER TABLE `progreso`
  MODIFY `id_progreso` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
