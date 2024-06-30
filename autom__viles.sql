-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 30-06-2024 a las 05:11:13
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
-- Base de datos: `trabajo_practico_n4`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `automóviles`
--

CREATE TABLE `automóviles` (
  `id_auto` int(10) NOT NULL,
  `Marca` text NOT NULL,
  `Modelo` text NOT NULL,
  `Año` varchar(10) NOT NULL,
  `Kilometraje` varchar(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `automóviles`
--

INSERT INTO `automóviles` (`id_auto`, `Marca`, `Modelo`, `Año`, `Kilometraje`) VALUES
(2, 'Citroën', 'Xsara', '2005', '564.567');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `automóviles`
--
ALTER TABLE `automóviles`
  ADD PRIMARY KEY (`id_auto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `automóviles`
--
ALTER TABLE `automóviles`
  MODIFY `id_auto` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
