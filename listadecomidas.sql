-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 28-05-2024 a las 00:59:41
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
-- Base de datos: `restaurante`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `listadecomidas`
--

CREATE TABLE `listadecomidas` (
  `numero` int(11) NOT NULL,
  `plato` text NOT NULL,
  `preciodeporcion` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `listadecomidas`
--

INSERT INTO `listadecomidas` (`numero`, `plato`, `preciodeporcion`) VALUES
(1, 'costillita de cerdo', 10000),
(2, 'milanesa', 5000),
(3, 'cono de papas ', 2500),
(4, 'tarta de J,M', 3000),
(5, 'pizza', 5500),
(6, 'bife', 2800),
(7, 'mondongo', 3000),
(8, 'cerveza', 3000),
(9, 'sanguche de mila', 14000),
(10, 'amburgueza', 8000),
(11, 'bonba de papa', 3000),
(12, 'papa a la frnaceza', 3000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `listadecomidas`
--
ALTER TABLE `listadecomidas`
  ADD PRIMARY KEY (`numero`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `listadecomidas`
--
ALTER TABLE `listadecomidas`
  MODIFY `numero` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
