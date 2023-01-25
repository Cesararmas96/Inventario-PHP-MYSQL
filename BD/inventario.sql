-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 25-01-2023 a las 16:43:55
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `inventario`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_categoria`
--

CREATE TABLE `t_categoria` (
  `idtcategoria` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_categoria`
--

INSERT INTO `t_categoria` (`idtcategoria`, `nombre`, `estado`) VALUES
(1, 'empaquetados', 1),
(2, 'Envases', 1),
(3, 'carnes', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_marca`
--

CREATE TABLE `t_marca` (
  `idtmarca` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `estado` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_marca`
--

INSERT INTO `t_marca` (`idtmarca`, `nombre`, `estado`) VALUES
(1, 'kaly', 1),
(2, 'mavesa', 1),
(3, 'ormary', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_persona`
--

CREATE TABLE `t_persona` (
  `cedula` int(11) NOT NULL,
  `nombre` varchar(64) NOT NULL,
  `apellido` varchar(64) NOT NULL,
  `edad` varchar(3) NOT NULL,
  `sexo` varchar(10) NOT NULL,
  `estado` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `t_persona`
--

INSERT INTO `t_persona` (`cedula`, `nombre`, `apellido`, `edad`, `sexo`, `estado`) VALUES
(26035677, 'Raul ', 'Torres', '25', 'masculino', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_producto`
--

CREATE TABLE `t_producto` (
  `idtproducto` int(11) NOT NULL,
  `nombre` varchar(255) NOT NULL,
  `peso` float NOT NULL,
  `estado` int(11) NOT NULL,
  `idtmarca` int(11) NOT NULL,
  `idtcategoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_producto`
--

INSERT INTO `t_producto` (`idtproducto`, `nombre`, `peso`, `estado`, `idtmarca`, `idtcategoria`) VALUES
(1, 'harina', 20, 1, 1, 1),
(2, 'molida', 12.5, 1, 3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `t_usuario`
--

CREATE TABLE `t_usuario` (
  `idt_usuario` int(11) NOT NULL,
  `clave` varchar(255) NOT NULL,
  `pregunta` varchar(255) NOT NULL,
  `respuesta` varchar(255) NOT NULL,
  `estado` int(11) NOT NULL,
  `cedula` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `t_usuario`
--

INSERT INTO `t_usuario` (`idt_usuario`, `clave`, `pregunta`, `respuesta`, `estado`, `cedula`) VALUES
(26035677, 'e10adc3949ba59abbe56e057f20f883e', 'quien soy', 'tu papi', 1, 26035677);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `t_categoria`
--
ALTER TABLE `t_categoria`
  ADD PRIMARY KEY (`idtcategoria`);

--
-- Indices de la tabla `t_marca`
--
ALTER TABLE `t_marca`
  ADD PRIMARY KEY (`idtmarca`);

--
-- Indices de la tabla `t_persona`
--
ALTER TABLE `t_persona`
  ADD PRIMARY KEY (`cedula`);

--
-- Indices de la tabla `t_producto`
--
ALTER TABLE `t_producto`
  ADD PRIMARY KEY (`idtproducto`),
  ADD KEY `fk_producto_categoria` (`idtcategoria`),
  ADD KEY `fk_producto_marca` (`idtmarca`);

--
-- Indices de la tabla `t_usuario`
--
ALTER TABLE `t_usuario`
  ADD PRIMARY KEY (`idt_usuario`),
  ADD KEY `fk_usuario_persona` (`cedula`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `t_categoria`
--
ALTER TABLE `t_categoria`
  MODIFY `idtcategoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `t_marca`
--
ALTER TABLE `t_marca`
  MODIFY `idtmarca` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `t_producto`
--
ALTER TABLE `t_producto`
  MODIFY `idtproducto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `t_producto`
--
ALTER TABLE `t_producto`
  ADD CONSTRAINT `fk_producto_categoria` FOREIGN KEY (`idtcategoria`) REFERENCES `t_categoria` (`idtcategoria`),
  ADD CONSTRAINT `fk_producto_marca` FOREIGN KEY (`idtmarca`) REFERENCES `t_marca` (`idtmarca`);

--
-- Filtros para la tabla `t_usuario`
--
ALTER TABLE `t_usuario`
  ADD CONSTRAINT `fk_usuario_persona` FOREIGN KEY (`cedula`) REFERENCES `t_persona` (`cedula`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
