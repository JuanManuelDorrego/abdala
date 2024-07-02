-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-07-2024 a las 22:32:45
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
-- Base de datos: `nautico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amarre`
--

CREATE TABLE `amarre` (
  `amarre_id` int(11) NOT NULL,
  `num_amarre` int(11) NOT NULL,
  `cuota` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `barcos`
--

CREATE TABLE `barcos` (
  `barcos_id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `num_matricula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `duenio_barco`
--

CREATE TABLE `duenio_barco` (
  `socios_id` int(11) NOT NULL,
  `barcos_id` int(11) NOT NULL,
  `patron_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `patron`
--

CREATE TABLE `patron` (
  `patron_id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `apellido` text NOT NULL,
  `telefono` int(11) NOT NULL,
  `email` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidas`
--

CREATE TABLE `salidas` (
  `id_salida` int(11) NOT NULL,
  `fecha_salida` date DEFAULT NULL,
  `hora_salida` time DEFAULT NULL,
  `id_destino` int(11) DEFAULT NULL,
  `id_barco` int(11) DEFAULT NULL,
  `patron_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `socios_id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `apellido` text NOT NULL,
  `email` varchar(30) NOT NULL,
  `direccion` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amarre`
--
ALTER TABLE `amarre`
  ADD PRIMARY KEY (`amarre_id`);

--
-- Indices de la tabla `barcos`
--
ALTER TABLE `barcos`
  ADD PRIMARY KEY (`barcos_id`);

--
-- Indices de la tabla `duenio_barco`
--
ALTER TABLE `duenio_barco`
  ADD KEY `socios_id` (`socios_id`),
  ADD KEY `foreign_key01` (`barcos_id`),
  ADD KEY `foreign_key02` (`patron_id`);

--
-- Indices de la tabla `patron`
--
ALTER TABLE `patron`
  ADD PRIMARY KEY (`patron_id`);

--
-- Indices de la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD PRIMARY KEY (`id_salida`),
  ADD KEY `foreign_key01` (`id_barco`),
  ADD KEY `patron_id` (`patron_id`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`socios_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `amarre`
--
ALTER TABLE `amarre`
  MODIFY `amarre_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `barcos`
--
ALTER TABLE `barcos`
  MODIFY `barcos_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `patron`
--
ALTER TABLE `patron`
  MODIFY `patron_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `socios`
--
ALTER TABLE `socios`
  MODIFY `socios_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `amarre`
--
ALTER TABLE `amarre`
  ADD CONSTRAINT `barcos_id` FOREIGN KEY (`amarre_id`) REFERENCES `barcos` (`barcos_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `duenio_barco`
--
ALTER TABLE `duenio_barco`
  ADD CONSTRAINT `duenio_barco_ibfk_1` FOREIGN KEY (`barcos_id`) REFERENCES `barcos` (`barcos_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `duenio_barco_ibfk_2` FOREIGN KEY (`patron_id`) REFERENCES `patron` (`patron_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `socios_id` FOREIGN KEY (`socios_id`) REFERENCES `socios` (`socios_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `salidas`
--
ALTER TABLE `salidas`
  ADD CONSTRAINT `patron_id` FOREIGN KEY (`patron_id`) REFERENCES `patron` (`patron_id`),
  ADD CONSTRAINT `salidas_ibfk_1` FOREIGN KEY (`id_barco`) REFERENCES `barcos` (`barcos_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
