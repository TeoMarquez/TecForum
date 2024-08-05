-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-05-2024 a las 04:58:41
-- Versión del servidor: 8.0.33
-- Versión de PHP: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `tecforum`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alumnos`
--

CREATE TABLE `alumnos` (
  `DNI` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  `padres_tutores_DNI` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asistencias`
--

CREATE TABLE `asistencias` (
  `ID` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `estado` varchar(45) DEFAULT NULL,
  `curso_num_curso` int NOT NULL,
  `curso_alumnos_DNI` int NOT NULL,
  `curso_alumnos_padres_tutores_DNI` int NOT NULL,
  `curso_horarios_ID` int NOT NULL,
  `curso_horarios_materias_ID` int NOT NULL,
  `curso_horarios_materias_docentes_DNI` int NOT NULL,
  `curso_preceptores_DNI` int NOT NULL,
  `curso_preceptores_directivos_DNI` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `curso`
--

CREATE TABLE `curso` (
  `num_curso` int NOT NULL,
  `num_division` int DEFAULT NULL,
  `turno` varchar(45) DEFAULT NULL,
  `ciclo` varchar(45) DEFAULT NULL,
  `comunicados` text,
  `alumnos_DNI` int NOT NULL,
  `alumnos_padres_tutores_DNI` int NOT NULL,
  `horarios_ID` int NOT NULL,
  `horarios_materias_ID` int NOT NULL,
  `horarios_materias_docentes_DNI` int NOT NULL,
  `preceptores_DNI` int NOT NULL,
  `preceptores_directivos_DNI` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `directivos`
--

CREATE TABLE `directivos` (
  `DNI` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  `firma` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `docentes`
--

CREATE TABLE `docentes` (
  `DNI` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  `firma` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `horarios`
--

CREATE TABLE `horarios` (
  `ID` int NOT NULL,
  `dia` varchar(45) DEFAULT NULL,
  `hora_modulo` varchar(45) DEFAULT NULL,
  `turno` varchar(45) DEFAULT NULL,
  `materias_ID` int NOT NULL,
  `materias_docentes_DNI` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `materias`
--

CREATE TABLE `materias` (
  `ID` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `docentes_DNI` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mesa_examen`
--

CREATE TABLE `mesa_examen` (
  `permiso_mesa` int NOT NULL,
  `num_mesa` int DEFAULT NULL,
  `num_orden` int DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `nota` decimal(3,2) DEFAULT NULL,
  `materias_ID` int NOT NULL,
  `materias_docentes_DNI` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `notas`
--

CREATE TABLE `notas` (
  `ID` int NOT NULL,
  `fecha` date DEFAULT NULL,
  `tipo` varchar(45) DEFAULT NULL,
  `notas_timestre1` decimal(3,2) DEFAULT NULL,
  `promedio1` decimal(3,2) DEFAULT NULL,
  `notas_trimestre2` decimal(3,2) DEFAULT NULL,
  `promedio2` decimal(3,2) DEFAULT NULL,
  `notas_trimestre3` decimal(3,2) DEFAULT NULL,
  `promedio3` decimal(3,2) DEFAULT NULL,
  `notas_recuperacion` decimal(3,2) DEFAULT NULL,
  `promedio_total` decimal(3,2) DEFAULT NULL,
  `comentario` text,
  `curso_num_curso` int NOT NULL,
  `curso_alumnos_DNI` int NOT NULL,
  `curso_alumnos_padres_tutores_DNI` int NOT NULL,
  `curso_horarios_ID` int NOT NULL,
  `curso_horarios_materias_ID` int NOT NULL,
  `curso_horarios_materias_docentes_DNI` int NOT NULL,
  `curso_preceptores_DNI` int NOT NULL,
  `curso_preceptores_directivos_DNI` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `padres_tutores`
--

CREATE TABLE `padres_tutores` (
  `DNI` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono1` varchar(45) DEFAULT NULL,
  `telefono2` varchar(45) DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  `firma` blob
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `preceptores`
--

CREATE TABLE `preceptores` (
  `DNI` int NOT NULL,
  `nombre` varchar(45) DEFAULT NULL,
  `apellido` varchar(45) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `contraseña` varchar(45) DEFAULT NULL,
  `firma` blob,
  `directivos_DNI` int NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD PRIMARY KEY (`DNI`,`padres_tutores_DNI`),
  ADD KEY `fk_alumnos_padres_tutores1_idx` (`padres_tutores_DNI`);

--
-- Indices de la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD PRIMARY KEY (`ID`,`curso_num_curso`,`curso_alumnos_DNI`,`curso_alumnos_padres_tutores_DNI`,`curso_horarios_ID`,`curso_horarios_materias_ID`,`curso_horarios_materias_docentes_DNI`,`curso_preceptores_DNI`,`curso_preceptores_directivos_DNI`),
  ADD KEY `fk_asistencias_curso1_idx` (`curso_num_curso`,`curso_alumnos_DNI`,`curso_alumnos_padres_tutores_DNI`,`curso_horarios_ID`,`curso_horarios_materias_ID`,`curso_horarios_materias_docentes_DNI`,`curso_preceptores_DNI`,`curso_preceptores_directivos_DNI`);

--
-- Indices de la tabla `curso`
--
ALTER TABLE `curso`
  ADD PRIMARY KEY (`num_curso`,`alumnos_DNI`,`alumnos_padres_tutores_DNI`,`horarios_ID`,`horarios_materias_ID`,`horarios_materias_docentes_DNI`,`preceptores_DNI`,`preceptores_directivos_DNI`),
  ADD KEY `fk_curso_alumnos1_idx` (`alumnos_DNI`,`alumnos_padres_tutores_DNI`),
  ADD KEY `fk_curso_horarios1_idx` (`horarios_ID`,`horarios_materias_ID`,`horarios_materias_docentes_DNI`),
  ADD KEY `fk_curso_preceptores1_idx` (`preceptores_DNI`,`preceptores_directivos_DNI`);

--
-- Indices de la tabla `directivos`
--
ALTER TABLE `directivos`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `docentes`
--
ALTER TABLE `docentes`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD PRIMARY KEY (`ID`,`materias_ID`,`materias_docentes_DNI`),
  ADD KEY `fk_horarios_materias1_idx` (`materias_ID`,`materias_docentes_DNI`);

--
-- Indices de la tabla `materias`
--
ALTER TABLE `materias`
  ADD PRIMARY KEY (`ID`,`docentes_DNI`),
  ADD KEY `fk_materias_docentes_idx` (`docentes_DNI`);

--
-- Indices de la tabla `mesa_examen`
--
ALTER TABLE `mesa_examen`
  ADD PRIMARY KEY (`permiso_mesa`,`materias_ID`,`materias_docentes_DNI`),
  ADD UNIQUE KEY `permiso_mesa_UNIQUE` (`permiso_mesa`),
  ADD KEY `fk_mesa_examen_materias1_idx` (`materias_ID`,`materias_docentes_DNI`);

--
-- Indices de la tabla `notas`
--
ALTER TABLE `notas`
  ADD PRIMARY KEY (`ID`,`curso_num_curso`,`curso_alumnos_DNI`,`curso_alumnos_padres_tutores_DNI`,`curso_horarios_ID`,`curso_horarios_materias_ID`,`curso_horarios_materias_docentes_DNI`,`curso_preceptores_DNI`,`curso_preceptores_directivos_DNI`),
  ADD KEY `fk_notas_curso1_idx` (`curso_num_curso`,`curso_alumnos_DNI`,`curso_alumnos_padres_tutores_DNI`,`curso_horarios_ID`,`curso_horarios_materias_ID`,`curso_horarios_materias_docentes_DNI`,`curso_preceptores_DNI`,`curso_preceptores_directivos_DNI`);

--
-- Indices de la tabla `padres_tutores`
--
ALTER TABLE `padres_tutores`
  ADD PRIMARY KEY (`DNI`);

--
-- Indices de la tabla `preceptores`
--
ALTER TABLE `preceptores`
  ADD PRIMARY KEY (`DNI`,`directivos_DNI`),
  ADD KEY `fk_preceptores_directivos1_idx` (`directivos_DNI`);

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `alumnos`
--
ALTER TABLE `alumnos`
  ADD CONSTRAINT `fk_alumnos_padres_tutores1` FOREIGN KEY (`padres_tutores_DNI`) REFERENCES `padres_tutores` (`DNI`);

--
-- Filtros para la tabla `asistencias`
--
ALTER TABLE `asistencias`
  ADD CONSTRAINT `fk_asistencias_curso1` FOREIGN KEY (`curso_num_curso`,`curso_alumnos_DNI`,`curso_alumnos_padres_tutores_DNI`,`curso_horarios_ID`,`curso_horarios_materias_ID`,`curso_horarios_materias_docentes_DNI`,`curso_preceptores_DNI`,`curso_preceptores_directivos_DNI`) REFERENCES `curso` (`num_curso`, `alumnos_DNI`, `alumnos_padres_tutores_DNI`, `horarios_ID`, `horarios_materias_ID`, `horarios_materias_docentes_DNI`, `preceptores_DNI`, `preceptores_directivos_DNI`);

--
-- Filtros para la tabla `curso`
--
ALTER TABLE `curso`
  ADD CONSTRAINT `fk_curso_alumnos1` FOREIGN KEY (`alumnos_DNI`,`alumnos_padres_tutores_DNI`) REFERENCES `alumnos` (`DNI`, `padres_tutores_DNI`),
  ADD CONSTRAINT `fk_curso_horarios1` FOREIGN KEY (`horarios_ID`,`horarios_materias_ID`,`horarios_materias_docentes_DNI`) REFERENCES `horarios` (`ID`, `materias_ID`, `materias_docentes_DNI`),
  ADD CONSTRAINT `fk_curso_preceptores1` FOREIGN KEY (`preceptores_DNI`,`preceptores_directivos_DNI`) REFERENCES `preceptores` (`DNI`, `directivos_DNI`);

--
-- Filtros para la tabla `horarios`
--
ALTER TABLE `horarios`
  ADD CONSTRAINT `fk_horarios_materias1` FOREIGN KEY (`materias_ID`,`materias_docentes_DNI`) REFERENCES `materias` (`ID`, `docentes_DNI`);

--
-- Filtros para la tabla `materias`
--
ALTER TABLE `materias`
  ADD CONSTRAINT `fk_materias_docentes` FOREIGN KEY (`docentes_DNI`) REFERENCES `docentes` (`DNI`);

--
-- Filtros para la tabla `mesa_examen`
--
ALTER TABLE `mesa_examen`
  ADD CONSTRAINT `fk_mesa_examen_materias1` FOREIGN KEY (`materias_ID`,`materias_docentes_DNI`) REFERENCES `materias` (`ID`, `docentes_DNI`);

--
-- Filtros para la tabla `notas`
--
ALTER TABLE `notas`
  ADD CONSTRAINT `fk_notas_curso1` FOREIGN KEY (`curso_num_curso`,`curso_alumnos_DNI`,`curso_alumnos_padres_tutores_DNI`,`curso_horarios_ID`,`curso_horarios_materias_ID`,`curso_horarios_materias_docentes_DNI`,`curso_preceptores_DNI`,`curso_preceptores_directivos_DNI`) REFERENCES `curso` (`num_curso`, `alumnos_DNI`, `alumnos_padres_tutores_DNI`, `horarios_ID`, `horarios_materias_ID`, `horarios_materias_docentes_DNI`, `preceptores_DNI`, `preceptores_directivos_DNI`);

--
-- Filtros para la tabla `preceptores`
--
ALTER TABLE `preceptores`
  ADD CONSTRAINT `fk_preceptores_directivos1` FOREIGN KEY (`directivos_DNI`) REFERENCES `directivos` (`DNI`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
