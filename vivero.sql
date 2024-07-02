-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 01-07-2024 a las 22:57:00
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
-- Base de datos: `vivero`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asingnacion_empleado`
--

CREATE TABLE `asingnacion_empleado` (
  `asignacion_id` int(11) NOT NULL,
  `empleado_dni` int(11) NOT NULL,
  `zona_id` int(11) NOT NULL,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente_vip`
--

CREATE TABLE `cliente_vip` (
  `cliente_vip_dni` int(11) NOT NULL,
  `nombre_completo` text NOT NULL,
  `telefono` int(11) NOT NULL,
  `facha_incorporacion` int(11) NOT NULL,
  `direccion` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalles_pedidos`
--

CREATE TABLE `detalles_pedidos` (
  `detalles_id` int(11) NOT NULL,
  `num_pedidio` int(11) NOT NULL,
  `codigo_producto` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `descuento` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `telefono` int(11) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `nombre` int(11) NOT NULL,
  `apellido` text NOT NULL,
  `empleado_dni` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pedidos`
--

CREATE TABLE `pedidos` (
  `num_pedido` int(11) NOT NULL,
  `cliente_vip_dni` int(11) NOT NULL,
  `fecha_pedido` date NOT NULL,
  `vivero_id` int(11) NOT NULL,
  `empelado_dni` int(11) NOT NULL,
  `precio_portes` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `producto_id` int(11) NOT NULL,
  `nombre` text NOT NULL,
  `descrip_ciudado` text NOT NULL,
  `tipo` enum('planta','accesorio','decoracion') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `responsable`
--

CREATE TABLE `responsable` (
  `responsable_id` int(11) NOT NULL,
  `viviero_id` int(11) NOT NULL,
  `empleado_dni` int(11) NOT NULL,
  `fecha_inicio` int(11) NOT NULL,
  `fecha_fin` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `stock_zona`
--

CREATE TABLE `stock_zona` (
  `stock_zona_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `zona_id` int(11) NOT NULL,
  `en_stock` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `vivero`
--

CREATE TABLE `vivero` (
  `codigo_vivero` int(11) NOT NULL,
  `telefono` int(15) NOT NULL,
  `direccion` varchar(20) NOT NULL,
  `responsable` int(11) NOT NULL,
  `inicio_periodo` date NOT NULL,
  `fin_periodo` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas`
--

CREATE TABLE `zonas` (
  `zona_id` int(11) NOT NULL,
  `vivero_id` int(11) NOT NULL,
  `nombre` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asingnacion_empleado`
--
ALTER TABLE `asingnacion_empleado`
  ADD PRIMARY KEY (`asignacion_id`),
  ADD KEY `zona` (`zona_id`),
  ADD KEY `emepleado` (`empleado_dni`);

--
-- Indices de la tabla `cliente_vip`
--
ALTER TABLE `cliente_vip`
  ADD PRIMARY KEY (`cliente_vip_dni`);

--
-- Indices de la tabla `detalles_pedidos`
--
ALTER TABLE `detalles_pedidos`
  ADD PRIMARY KEY (`detalles_id`),
  ADD KEY `num_pedido` (`num_pedidio`),
  ADD KEY `producto` (`codigo_producto`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`empleado_dni`);

--
-- Indices de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`num_pedido`),
  ADD KEY `cliente_vip_dni` (`cliente_vip_dni`),
  ADD KEY `vivero` (`vivero_id`),
  ADD KEY `empeleado_dni` (`empelado_dni`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`producto_id`);

--
-- Indices de la tabla `responsable`
--
ALTER TABLE `responsable`
  ADD PRIMARY KEY (`responsable_id`),
  ADD KEY `mepleado_dni` (`empleado_dni`);

--
-- Indices de la tabla `stock_zona`
--
ALTER TABLE `stock_zona`
  ADD PRIMARY KEY (`stock_zona_id`),
  ADD KEY `foreign_key01` (`producto_id`),
  ADD KEY `foreign_key02` (`zona_id`);

--
-- Indices de la tabla `vivero`
--
ALTER TABLE `vivero`
  ADD PRIMARY KEY (`codigo_vivero`),
  ADD KEY `foreign_key01` (`responsable`);

--
-- Indices de la tabla `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`zona_id`),
  ADD KEY `foreign_key01` (`vivero_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asingnacion_empleado`
--
ALTER TABLE `asingnacion_empleado`
  MODIFY `asignacion_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente_vip`
--
ALTER TABLE `cliente_vip`
  MODIFY `cliente_vip_dni` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `detalles_pedidos`
--
ALTER TABLE `detalles_pedidos`
  MODIFY `detalles_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `empleado_dni` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `num_pedido` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `producto_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `responsable`
--
ALTER TABLE `responsable`
  MODIFY `responsable_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `stock_zona`
--
ALTER TABLE `stock_zona`
  MODIFY `stock_zona_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `vivero`
--
ALTER TABLE `vivero`
  MODIFY `codigo_vivero` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `zonas`
--
ALTER TABLE `zonas`
  MODIFY `zona_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asingnacion_empleado`
--
ALTER TABLE `asingnacion_empleado`
  ADD CONSTRAINT `emepleado` FOREIGN KEY (`empleado_dni`) REFERENCES `empleado` (`empleado_dni`),
  ADD CONSTRAINT `empleados` FOREIGN KEY (`empleado_dni`) REFERENCES `empleado` (`empleado_dni`),
  ADD CONSTRAINT `zona` FOREIGN KEY (`zona_id`) REFERENCES `zonas` (`zona_id`);

--
-- Filtros para la tabla `detalles_pedidos`
--
ALTER TABLE `detalles_pedidos`
  ADD CONSTRAINT `codigo_producto` FOREIGN KEY (`codigo_producto`) REFERENCES `producto` (`producto_id`),
  ADD CONSTRAINT `num_pedido` FOREIGN KEY (`num_pedidio`) REFERENCES `pedidos` (`num_pedido`),
  ADD CONSTRAINT `numero_pediddo` FOREIGN KEY (`num_pedidio`) REFERENCES `pedidos` (`num_pedido`),
  ADD CONSTRAINT `producto` FOREIGN KEY (`codigo_producto`) REFERENCES `producto` (`producto_id`);

--
-- Filtros para la tabla `pedidos`
--
ALTER TABLE `pedidos`
  ADD CONSTRAINT `cliente_vip_dni` FOREIGN KEY (`cliente_vip_dni`) REFERENCES `cliente_vip` (`cliente_vip_dni`),
  ADD CONSTRAINT `empeleado_dni` FOREIGN KEY (`empelado_dni`) REFERENCES `empleado` (`empleado_dni`),
  ADD CONSTRAINT `vivero` FOREIGN KEY (`vivero_id`) REFERENCES `vivero` (`codigo_vivero`);

--
-- Filtros para la tabla `responsable`
--
ALTER TABLE `responsable`
  ADD CONSTRAINT `mepleado_dni` FOREIGN KEY (`empleado_dni`) REFERENCES `empleado` (`empleado_dni`);

--
-- Filtros para la tabla `stock_zona`
--
ALTER TABLE `stock_zona`
  ADD CONSTRAINT `stock_zona_ibfk_1` FOREIGN KEY (`producto_id`) REFERENCES `producto` (`producto_id`),
  ADD CONSTRAINT `stock_zona_ibfk_2` FOREIGN KEY (`zona_id`) REFERENCES `zonas` (`zona_id`);

--
-- Filtros para la tabla `zonas`
--
ALTER TABLE `zonas`
  ADD CONSTRAINT `zonas_ibfk_1` FOREIGN KEY (`vivero_id`) REFERENCES `vivero` (`codigo_vivero`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
