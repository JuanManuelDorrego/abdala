-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 18-06-2024 a las 23:36:18
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `gym`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `aparatos`
--

CREATE TABLE `aparatos` (
  `codigoAparatos` int(12) NOT NULL,
  `descripcion` text NOT NULL,
  `estadoConservacion` text NOT NULL,
  `numSala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clase`
--

CREATE TABLE `clase` (
  `codigoClase` int(11) NOT NULL,
  `descripion` text NOT NULL,
  `diahora` int(25) NOT NULL,
  `numSala` int(11) NOT NULL,
  `dniMentor` int(8) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `clasessocios`
--

CREATE TABLE `clasessocios` (
  `numSocios` int(11) NOT NULL,
  `codigoClase` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `mentor`
--

CREATE TABLE `mentor` (
  `dniMentor` int(8) NOT NULL,
  `nombre` text NOT NULL,
  `telefono` int(12) NOT NULL,
  `titulo` text NOT NULL,
  `expProfesional` text NOT NULL,
  `especialidades` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pistassquash`
--

CREATE TABLE `pistassquash` (
  `numPista` int(11) NOT NULL,
  `ubi` varchar(20) NOT NULL,
  `estado` text NOT NULL,
  `m2` int(11) NOT NULL,
  `numSala` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservarpistas`
--

CREATE TABLE `reservarpistas` (
  `idReserva` int(11) NOT NULL,
  `numSocios` int(11) NOT NULL,
  `numPista` int(11) NOT NULL,
  `fechahora` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sala`
--

CREATE TABLE `sala` (
  `numSala` int(11) NOT NULL,
  `m2` int(11) NOT NULL,
  `ubicacion` text NOT NULL,
  `tipoSala` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `numSocios` int(11) NOT NULL,
  `nombre` int(15) NOT NULL,
  `direccion` varchar(25) NOT NULL,
  `telefono` int(12) NOT NULL,
  `profesion` text NOT NULL,
  `datosBancarios` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `aparatos`
--
ALTER TABLE `aparatos`
  ADD PRIMARY KEY (`codigoAparatos`),
  ADD KEY `sala_numSala_aparatos` (`numSala`);

--
-- Indices de la tabla `clase`
--
ALTER TABLE `clase`
  ADD KEY `sala_numSala_clase` (`numSala`),
  ADD KEY `mentor_dniMentor_clase` (`dniMentor`);

--
-- Indices de la tabla `clasessocios`
--
ALTER TABLE `clasessocios`
  ADD KEY `socios_numSocios_clasessocios` (`numSocios`);

--
-- Indices de la tabla `mentor`
--
ALTER TABLE `mentor`
  ADD PRIMARY KEY (`dniMentor`);

--
-- Indices de la tabla `pistassquash`
--
ALTER TABLE `pistassquash`
  ADD KEY `sala_numSala_pistassquash` (`numSala`);

--
-- Indices de la tabla `sala`
--
ALTER TABLE `sala`
  ADD PRIMARY KEY (`numSala`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`numSocios`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `aparatos`
--
ALTER TABLE `aparatos`
  MODIFY `codigoAparatos` int(12) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `mentor`
--
ALTER TABLE `mentor`
  MODIFY `dniMentor` int(8) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `sala`
--
ALTER TABLE `sala`
  MODIFY `numSala` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `socios`
--
ALTER TABLE `socios`
  MODIFY `numSocios` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `aparatos`
--
ALTER TABLE `aparatos`
  ADD CONSTRAINT `sala_numSala_aparatos` FOREIGN KEY (`numSala`) REFERENCES `sala` (`numSala`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `clase`
--
ALTER TABLE `clase`
  ADD CONSTRAINT `mentor_dniMentor_clase` FOREIGN KEY (`dniMentor`) REFERENCES `mentor` (`dniMentor`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sala_numSala_clase` FOREIGN KEY (`numSala`) REFERENCES `sala` (`numSala`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `clasessocios`
--
ALTER TABLE `clasessocios`
  ADD CONSTRAINT `socios_numSocios_clasessocios` FOREIGN KEY (`numSocios`) REFERENCES `socios` (`numSocios`);

--
-- Filtros para la tabla `pistassquash`
--
ALTER TABLE `pistassquash`
  ADD CONSTRAINT `sala_numSala_pistassquash` FOREIGN KEY (`numSala`) REFERENCES `sala` (`numSala`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
