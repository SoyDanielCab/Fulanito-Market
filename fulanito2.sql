-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 20-12-2022 a las 20:08:06
-- Versión del servidor: 10.4.25-MariaDB
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `fulanito2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `almacen`
--

CREATE TABLE `almacen` (
  `ID_Almacen` int(11) NOT NULL,
  `Numero_Factura` int(50) DEFAULT NULL,
  `Fecha_Entrega` date DEFAULT NULL,
  `Fecha_caducidad` date DEFAULT NULL,
  `Fecha_de_Salidad` date DEFAULT NULL,
  `Fecha_de_Entrega_Cliente` date DEFAULT NULL,
  `Estatus_de_Envio` varchar(50) DEFAULT NULL,
  `Cantidad_en_Existencia` int(50) DEFAULT NULL,
  `ID_Compras` int(11) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `ID_Cliente` int(11) NOT NULL,
  `Razon_Social` varchar(50) DEFAULT NULL,
  `Correo_Electronico` varchar(50) DEFAULT NULL,
  `RFC_Cliente` varchar(50) DEFAULT NULL,
  `Telefono_1` varchar(50) DEFAULT NULL,
  `Telefono_2` varchar(50) DEFAULT NULL,
  `Direccion1_Entrega` varchar(50) DEFAULT NULL,
  `Direccion2_Entrega` varchar(50) DEFAULT NULL,
  `ID_Direccion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`ID_Cliente`, `Razon_Social`, `Correo_Electronico`, `RFC_Cliente`, `Telefono_1`, `Telefono_2`, `Direccion1_Entrega`, `Direccion2_Entrega`, `ID_Direccion`) VALUES
(1, 'Casa Vargas S.A de C.V', 'casavargas@gmail.com', 'MAM847328HSA', '5528492637', '5534422962', 'Tormenta ', 'Lluvia', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compras`
--

CREATE TABLE `compras` (
  `ID_Compras` int(11) NOT NULL,
  `Numero_Factura` int(50) DEFAULT NULL,
  `precio_Sugerido_al_Publico` double DEFAULT NULL,
  `Precio_por_unidad` double DEFAULT NULL,
  `Precio_proveedor` double DEFAULT NULL,
  `Precio_Total` double DEFAULT NULL,
  `SubTotal` double DEFAULT NULL,
  `Descuento` int(50) DEFAULT NULL,
  `SubTotal_Descuento` double DEFAULT NULL,
  `Iva` int(50) DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `ID_Proveedor` int(11) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `Cantidad` int(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `direccion`
--

CREATE TABLE `direccion` (
  `ID_Direccion` int(11) NOT NULL,
  `Estado` varchar(50) DEFAULT NULL,
  `Calle` varchar(50) DEFAULT NULL,
  `Numero_Interior` varchar(50) DEFAULT NULL,
  `Numero_Exterior` varchar(50) DEFAULT NULL,
  `Colonia` varchar(50) DEFAULT NULL,
  `Codigo_Postal` int(50) DEFAULT NULL,
  `Municipio` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `direccion`
--

INSERT INTO `direccion` (`ID_Direccion`, `Estado`, `Calle`, `Numero_Interior`, `Numero_Exterior`, `Colonia`, `Codigo_Postal`, `Municipio`) VALUES
(1, 'Estado de México', 'Blvard del viento', '63', '128', 'Noche Buena', 56589, 'Ixtapaluca ');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `ID_factura` int(11) NOT NULL,
  `RFC_Cliente` varchar(50) DEFAULT NULL,
  `Razon_Social` varchar(50) DEFAULT NULL,
  `Fecha_emision` date DEFAULT NULL,
  `RFC_Emisor` varchar(50) DEFAULT NULL,
  `Descripcion_Producto` varchar(50) DEFAULT NULL,
  `Unidad` varchar(50) DEFAULT NULL,
  `Cantidad` int(50) DEFAULT NULL,
  `Precio_por_unidad` double DEFAULT NULL,
  `SubTotal` double DEFAULT NULL,
  `Iva` int(50) DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `ID_Producto` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID_Producto` int(11) NOT NULL,
  `Descripcion_Producto` varchar(50) DEFAULT NULL,
  `Unidad` varchar(50) DEFAULT NULL,
  `Fecha_Caducidad` date DEFAULT NULL,
  `Cantidad_Compradas` double DEFAULT NULL,
  `Precio_compra_por_mayoreo` int(50) DEFAULT NULL,
  `Precio_suegrido_cliente` int(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID_Producto`, `Descripcion_Producto`, `Unidad`, `Fecha_Caducidad`, `Cantidad_Compradas`, `Precio_compra_por_mayoreo`, `Precio_suegrido_cliente`) VALUES
(1, 'jalapeños en lata 340', 'gr', '2025-12-12', 1000, 6, 6);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `ID_Proveedor` int(11) NOT NULL,
  `Razon_Social` varchar(50) DEFAULT NULL,
  `Codigo_Postal` int(50) DEFAULT NULL,
  `Numero_Telefono1` varchar(50) DEFAULT NULL,
  `Numero_telefono2` varchar(50) DEFAULT NULL,
  `Correo_electronico` varchar(50) DEFAULT NULL,
  `RFC` varchar(50) DEFAULT NULL,
  `Numero_de_pedido` varchar(50) DEFAULT NULL,
  `ID_Direccion` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventas`
--

CREATE TABLE `ventas` (
  `ID_ventas` int(11) NOT NULL,
  `Fecha_de_Venta` date DEFAULT NULL,
  `RFC_Cliente` varchar(50) DEFAULT NULL,
  `Cantidad` int(50) DEFAULT NULL,
  `SubTotal` double DEFAULT NULL,
  `Iva` int(50) DEFAULT NULL,
  `Total` double DEFAULT NULL,
  `Nombre_de_Quien_Recibe` varchar(50) DEFAULT NULL,
  `Fecha_de_Entrega` date DEFAULT NULL,
  `Numero_venta` int(11) DEFAULT NULL,
  `ID_factura` int(11) DEFAULT NULL,
  `ID_Producto` int(11) DEFAULT NULL,
  `ID_Cliente` int(11) DEFAULT NULL,
  `ID_ALMACEN` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD PRIMARY KEY (`ID_Almacen`),
  ADD KEY `ID_Compras` (`ID_Compras`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`ID_Cliente`),
  ADD KEY `ID_Direccion` (`ID_Direccion`);

--
-- Indices de la tabla `compras`
--
ALTER TABLE `compras`
  ADD PRIMARY KEY (`ID_Compras`),
  ADD KEY `ID_Proveedor` (`ID_Proveedor`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `direccion`
--
ALTER TABLE `direccion`
  ADD PRIMARY KEY (`ID_Direccion`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`ID_factura`),
  ADD KEY `ID_Producto` (`ID_Producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID_Producto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`ID_Proveedor`),
  ADD KEY `ID_Direccion` (`ID_Direccion`);

--
-- Indices de la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`ID_ventas`),
  ADD KEY `ID_factura` (`ID_factura`),
  ADD KEY `ID_Producto` (`ID_Producto`),
  ADD KEY `ID_Cliente` (`ID_Cliente`),
  ADD KEY `ID_ALMACEN` (`ID_ALMACEN`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `almacen`
--
ALTER TABLE `almacen`
  MODIFY `ID_Almacen` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `ID_Cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `compras`
--
ALTER TABLE `compras`
  MODIFY `ID_Compras` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `direccion`
--
ALTER TABLE `direccion`
  MODIFY `ID_Direccion` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `ID_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `ID_Producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `ID_Proveedor` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `ventas`
--
ALTER TABLE `ventas`
  MODIFY `ID_ventas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `almacen`
--
ALTER TABLE `almacen`
  ADD CONSTRAINT `ID_Compras` FOREIGN KEY (`ID_Compras`) REFERENCES `compras` (`ID_Compras`),
  ADD CONSTRAINT `almacen_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`);

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`ID_Direccion`) REFERENCES `direccion` (`ID_Direccion`);

--
-- Filtros para la tabla `compras`
--
ALTER TABLE `compras`
  ADD CONSTRAINT `ID_Producto` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`),
  ADD CONSTRAINT `ID_Proveedor` FOREIGN KEY (`ID_Proveedor`) REFERENCES `proveedor` (`ID_Proveedor`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`);

--
-- Filtros para la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD CONSTRAINT `ID_Direccion` FOREIGN KEY (`ID_Direccion`) REFERENCES `direccion` (`ID_Direccion`);

--
-- Filtros para la tabla `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`ID_factura`) REFERENCES `factura` (`ID_factura`),
  ADD CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`ID_Producto`) REFERENCES `producto` (`ID_Producto`),
  ADD CONSTRAINT `ventas_ibfk_3` FOREIGN KEY (`ID_Cliente`) REFERENCES `cliente` (`ID_Cliente`),
  ADD CONSTRAINT `ventas_ibfk_4` FOREIGN KEY (`ID_ALMACEN`) REFERENCES `almacen` (`ID_Almacen`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
