-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 02, 2023 at 09:15 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `java_prueba1`
--
CREATE DATABASE IF NOT EXISTS `java_prueba1` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `java_prueba1`;

-- --------------------------------------------------------

--
-- Table structure for table `clientes`
--

CREATE TABLE `clientes` (
  `id` int(11) NOT NULL,
  `dni` varchar(15) NOT NULL,
  `nombre` varchar(180) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `cp` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `clientes`
--

INSERT INTO `clientes` (`id`, `dni`, `nombre`, `telefono`, `email`, `direccion`, `cp`) VALUES
(1, 'XAXX010101000', 'Venta en General', 'XXXXX', 'XXXXX', 'XXXXX', '0'),
(2, '223134', 'Daniel Caballero', '55161689625', 'danielcaballero95@outlook.com', 'San Buenaventura - Ixtapaluca', '0'),
(3, '14546431', 'Lupita', '44536796', 'lupis_upem@gmail.com', 'Ayotla - Ixtapaluca', '0'),
(5, 'Prueba', 'Prueba2', 'Prueba', 'Prueba', '1', '0'),
(6, 'Prueba', 'Prueba', 'Prueba', 'Prueba', 'Prueba', '0'),
(7, 'Prueba', 'Prueba', 'Prueba', 'Prueba', 'Prueba', 'Prueba'),
(8, 'Prueba', 'Prueba', 'Prueba', 'Prueba', 'Prueba', 'Prueba'),
(9, 'Prueba', 'Prueba', 'Prueba', 'Prueba', 'Prueba', 'Prueba');

-- --------------------------------------------------------

--
-- Table structure for table `config`
--

CREATE TABLE `config` (
  `id` int(11) NOT NULL,
  `ruc` varchar(15) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `direccion` text NOT NULL,
  `mensaje` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `config`
--

INSERT INTO `config` (`id`, `ruc`, `nombre`, `telefono`, `direccion`, `mensaje`) VALUES
(1, 'EFNT2209127ES', 'El Fulanito Super Market', '55-3496-6748', 'Ixtapaluca EDOMEX', 'Gracias por su compra \"El Fulanito\"');

-- --------------------------------------------------------

--
-- Table structure for table `detalle`
--

CREATE TABLE `detalle` (
  `id` int(11) NOT NULL,
  `id_pro` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL,
  `id_venta` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `detalle`
--

INSERT INTO `detalle` (`id`, `id_pro`, `cantidad`, `precio`, `id_venta`) VALUES
(4, 1, 5, '3000.00', 4),
(5, 1, 1, '3000.00', 5),
(6, 1, 1, '3000.00', 6),
(7, 1, 2, '3000.00', 7),
(8, 1, 1, '15.00', 8),
(9, 3, 2, '35.00', 9),
(10, 1, 1, '15.00', 9);

-- --------------------------------------------------------

--
-- Table structure for table `pedidos`
--

CREATE TABLE `pedidos` (
  `id` int(11) NOT NULL,
  `proveedor` int(11) NOT NULL,
  `descripcion` varchar(250) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `total` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `productos`
--

CREATE TABLE `productos` (
  `id` int(11) NOT NULL,
  `codigo` varchar(20) NOT NULL,
  `nombre` text NOT NULL,
  `proveedor` int(11) NOT NULL,
  `stock` int(11) NOT NULL,
  `precio` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `productos`
--

INSERT INTO `productos` (`id`, `codigo`, `nombre`, `proveedor`, `stock`, `precio`) VALUES
(1, '015256', 'Jalapeños en lata 340gr\r\n', 1, 18, '15.00'),
(3, '015257', 'Frijoles enteros en lata 200 gr ', 1, 58, '35.00');

-- --------------------------------------------------------

--
-- Table structure for table `proveedor`
--

CREATE TABLE `proveedor` (
  `id` int(11) NOT NULL,
  `ruc` varchar(15) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `telefono` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `cp` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `proveedor`
--

INSERT INTO `proveedor` (`id`, `ruc`, `nombre`, `telefono`, `email`, `direccion`, `cp`) VALUES
(1, 'hrdz8905237AZ', 'Herdez', '552216864979', 'grupoherdez@gmail.com', 'Sta. Fe - CDMX', '0'),
(2, 'Prueba2', 'Prueba2', 'Prueba', 'Prueba', 'Prueba', 'Prueba'),
(3, 'Prueba', 'Prueba', 'Prueba', 'Prueba', 'Prueba', 'Prueba');

-- --------------------------------------------------------

--
-- Table structure for table `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(200) NOT NULL,
  `correo` varchar(200) NOT NULL,
  `pass` varchar(50) NOT NULL,
  `rol` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `usuarios`
--

INSERT INTO `usuarios` (`id`, `nombre`, `correo`, `pass`, `rol`) VALUES
(1, 'Angel Sifuentes', 'angel@gmail.com', 'admin', 'Administrador'),
(2, 'Vida Informatico', 'admin@gmail.com', 'admin', 'Administrador'),
(3, 'Daniel Caballero', 'user1', '123', 'Administrador'),
(4, 'Guadalupe', 'User2', '123', 'Asistente');

-- --------------------------------------------------------

--
-- Table structure for table `ventas`
--

CREATE TABLE `ventas` (
  `id` int(11) NOT NULL,
  `cliente` int(11) NOT NULL,
  `vendedor` varchar(60) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_spanish_ci;

--
-- Dumping data for table `ventas`
--

INSERT INTO `ventas` (`id`, `cliente`, `vendedor`, `total`, `fecha`) VALUES
(4, 1, 'Angel Sifuentes', '15000.00', '25/07/2021'),
(5, 2, 'Angel Sifuentes', '3000.00', '20/11/2022'),
(6, 2, 'Angel Sifuentes', '3000.00', '23/11/2022'),
(7, 3, 'Angel Sifuentes', '6000.00', '23/11/2022'),
(8, 2, 'Daniel Caballero', '15.00', '25/12/2022'),
(9, 3, 'Daniel Caballero', '85.00', '26/12/2022');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `clientes`
--
ALTER TABLE `clientes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `config`
--
ALTER TABLE `config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `detalle`
--
ALTER TABLE `detalle`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_venta` (`id_venta`),
  ADD KEY `id_pro` (`id_pro`);

--
-- Indexes for table `pedidos`
--
ALTER TABLE `pedidos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `Proveedor` (`proveedor`);

--
-- Indexes for table `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proveedor` (`proveedor`);

--
-- Indexes for table `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ventas`
--
ALTER TABLE `ventas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `cliente` (`cliente`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `clientes`
--
ALTER TABLE `clientes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `config`
--
ALTER TABLE `config`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `detalle`
--
ALTER TABLE `detalle`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `pedidos`
--
ALTER TABLE `pedidos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `ventas`
--
ALTER TABLE `ventas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `detalle`
--
ALTER TABLE `detalle`
  ADD CONSTRAINT `detalle_ibfk_1` FOREIGN KEY (`id_pro`) REFERENCES `productos` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `detalle_ibfk_2` FOREIGN KEY (`id_venta`) REFERENCES `ventas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`proveedor`) REFERENCES `proveedor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `ventas`
--
ALTER TABLE `ventas`
  ADD CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`cliente`) REFERENCES `clientes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
