-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3316
-- Tiempo de generación: 08-09-2023 a las 22:26:35
-- Versión del servidor: 10.4.28-MariaDB
-- Versión de PHP: 8.0.28

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `nowtify`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoriaproducto`
--

CREATE TABLE `categoriaproducto` (
  `idCatProducto` int(10) UNSIGNED NOT NULL,
  `nombreCatProducto` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoriaproducto`
--

INSERT INTO `categoriaproducto` (`idCatProducto`, `nombreCatProducto`) VALUES
(1, 'Parches para llantas'),
(2, 'Accesorios de interior para carros'),
(3, 'Accesorios de exterior para carros'),
(4, 'Productos de limpieza para carros'),
(5, 'Herramientas para carros'),
(6, 'Equipamiento para carros'),
(7, 'Luces y faros para carros'),
(8, 'Productos de seguridad para carros'),
(9, 'Tapetes y alfombras para carros'),
(10, 'Componentes eléctricos para carros');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `idCliente` int(10) UNSIGNED NOT NULL,
  `idtipoCliente` int(10) UNSIGNED NOT NULL,
  `idUsuario` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `idCompra` int(10) UNSIGNED NOT NULL,
  `fechaCompra` date NOT NULL,
  `valorCompra` decimal(18,2) NOT NULL,
  `descripcionCompra` varchar(200) DEFAULT NULL,
  `idEstadoCompra` int(10) UNSIGNED NOT NULL,
  `idEmpleado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compraproducto`
--

CREATE TABLE `compraproducto` (
  `cantidadProducto` int(11) NOT NULL,
  `idCompra` int(10) UNSIGNED NOT NULL,
  `idProducto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compraproveedor`
--

CREATE TABLE `compraproveedor` (
  `idCompra` int(10) UNSIGNED NOT NULL,
  `idProveedor` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `domicilio`
--

CREATE TABLE `domicilio` (
  `idDomicilio` int(10) UNSIGNED NOT NULL,
  `nombreDomiciliario` varchar(50) NOT NULL,
  `direccionDomicilio` varchar(50) NOT NULL,
  `telefonoDomiciliario` int(11) NOT NULL,
  `placaVehiculo` varchar(6) DEFAULT NULL,
  `idVenta` int(10) UNSIGNED NOT NULL,
  `idEstadoDomicilio` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `idEmpleado` int(10) UNSIGNED NOT NULL,
  `fechaNacEmpleado` date NOT NULL,
  `idEps` int(10) UNSIGNED NOT NULL,
  `idEstrato` int(10) UNSIGNED NOT NULL,
  `idCargo` int(10) UNSIGNED NOT NULL,
  `idEstadoEmpleado` int(10) UNSIGNED NOT NULL,
  `idUsuario` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `entradainventarios`
--

CREATE TABLE `entradainventarios` (
  `idEntrada` int(10) UNSIGNED NOT NULL,
  `fechaSalida` date NOT NULL,
  `totalProductosEntrada` int(11) NOT NULL,
  `idProducto` int(10) UNSIGNED NOT NULL,
  `idInventario` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `eps`
--

CREATE TABLE `eps` (
  `idEps` int(10) UNSIGNED NOT NULL,
  `nombreEps` varchar(30) NOT NULL,
  `telefonoEps` int(20) NOT NULL,
  `tipoEps` varchar(20) NOT NULL,
  `correoEPS` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `eps`
--

INSERT INTO `eps` (`idEps`, `nombreEps`, `telefonoEps`, `tipoEps`, `correoEPS`) VALUES
(1, 'EPS Sura', 2147483647, 'Privado', 'asousuarios@epssura.com.co'),
(2, 'EPS Sanitas', 2147483647, 'Privado', NULL),
(3, 'EPS Compensar', 2147483647, 'Privado', 'compensarepsjuridica@compensarsalud.com'),
(4, 'EPS Cafesalud', 916510777, 'Privado', 'coordinacionsalud@cafesalud.com.co.'),
(5, 'EPS SaludTotal', 2147483647, 'Privado', 'autorizacionespos@saludtotal.com.co');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadocompra`
--

CREATE TABLE `estadocompra` (
  `idEstadoCompra` int(10) UNSIGNED NOT NULL,
  `nombreEstadoCompra` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadocompra`
--

INSERT INTO `estadocompra` (`idEstadoCompra`, `nombreEstadoCompra`) VALUES
(1, 'En proceso'),
(2, 'Aprobada'),
(3, 'En tránsito'),
(4, 'Entregada'),
(5, 'Cancelada'),
(6, 'Rechazada'),
(7, 'Pendiente de pago'),
(8, 'Pagada'),
(9, 'En revisión'),
(10, 'Devuelta'),
(11, 'En espera'),
(12, 'En producción'),
(13, 'En empaque'),
(14, 'En despacho'),
(15, 'En ruta'),
(16, 'En camino'),
(17, 'Suspendida'),
(18, 'Completada'),
(19, 'En espera de confirmación'),
(20, 'En espera de autorización');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadodomicilio`
--

CREATE TABLE `estadodomicilio` (
  `idEstadoDomicilio` int(10) UNSIGNED NOT NULL,
  `nombreEstadoDomicilio` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadodomicilio`
--

INSERT INTO `estadodomicilio` (`idEstadoDomicilio`, `nombreEstadoDomicilio`) VALUES
(1, 'Pendiente'),
(2, 'En tránsito'),
(3, 'Entregado'),
(4, 'Devuelto'),
(5, 'Reprogramado'),
(6, 'En proceso de envío'),
(7, 'En espera de recolección'),
(8, 'En espera de despacho'),
(9, 'En espera de confirmación'),
(10, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadoempleado`
--

CREATE TABLE `estadoempleado` (
  `idEstadoEmpleado` int(10) UNSIGNED NOT NULL,
  `nombreEstadoEmpleado` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadoempleado`
--

INSERT INTO `estadoempleado` (`idEstadoEmpleado`, `nombreEstadoEmpleado`) VALUES
(1, 'Activo'),
(2, 'Inactivo'),
(3, 'Vacaciones');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadonovedades`
--

CREATE TABLE `estadonovedades` (
  `idEstadoNovedades` int(10) UNSIGNED NOT NULL,
  `nombreNovedad` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadonovedades`
--

INSERT INTO `estadonovedades` (`idEstadoNovedades`, `nombreNovedad`) VALUES
(1, 'Pendiente'),
(2, 'En progreso'),
(3, 'Resuelta'),
(4, 'Cerrada'),
(5, 'Rechazada'),
(6, 'En revisión'),
(7, 'Asignada'),
(8, 'Cancelada'),
(9, 'Finalizada'),
(10, 'Suspendida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estadosolicitudg`
--

CREATE TABLE `estadosolicitudg` (
  `idEstadoSolicitudG` int(10) UNSIGNED NOT NULL,
  `nombreEstadoSolicitudG` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estadosolicitudg`
--

INSERT INTO `estadosolicitudg` (`idEstadoSolicitudG`, `nombreEstadoSolicitudG`) VALUES
(1, 'Aprobado'),
(2, 'Rechazado'),
(3, 'En proceso'),
(4, 'Cancelado');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estrato`
--

CREATE TABLE `estrato` (
  `idEstrato` int(10) UNSIGNED NOT NULL,
  `nombreEstrato` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estrato`
--

INSERT INTO `estrato` (`idEstrato`, `nombreEstrato`) VALUES
(1, 'Estrato 1'),
(2, 'Estrato 2'),
(3, 'Estrato 3'),
(4, 'Estrato 4'),
(5, 'Estrato 5'),
(6, 'Estrato 6');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `formadepago`
--

CREATE TABLE `formadepago` (
  `idFormadePago` int(10) UNSIGNED NOT NULL,
  `nombreFormadePago` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `inventario`
--

CREATE TABLE `inventario` (
  `idInventario` int(10) UNSIGNED NOT NULL,
  `fechaRegistro` date DEFAULT NULL,
  `totalProducto` int(11) NOT NULL,
  `idEmpleado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `novedades`
--

CREATE TABLE `novedades` (
  `idNovedades` int(10) UNSIGNED NOT NULL,
  `observacionProducto` varchar(50) NOT NULL,
  `descripcionNovedad` varchar(80) NOT NULL,
  `fechaNovedad` date NOT NULL,
  `idEstadoNovedades` int(10) UNSIGNED NOT NULL,
  `idEmpleado` int(10) UNSIGNED NOT NULL,
  `idSalida` int(10) UNSIGNED DEFAULT NULL,
  `idEntrada` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pqrs`
--

CREATE TABLE `pqrs` (
  `idPqrs` int(10) UNSIGNED NOT NULL,
  `categoriaPqrs` varchar(10) NOT NULL,
  `tituloPqrs` varchar(40) NOT NULL,
  `fechaPqrs` date NOT NULL,
  `descripcion` text NOT NULL,
  `estadoPqrs` varchar(25) NOT NULL,
  `idCliente` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `idProducto` int(10) UNSIGNED NOT NULL,
  `nomProducto` varchar(45) NOT NULL,
  `precioProducto` decimal(18,2) NOT NULL,
  `garantiaProducto` varchar(2) NOT NULL,
  `idCatProducto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`idProducto`, `nomProducto`, `precioProducto`, `garantiaProducto`, `idCatProducto`) VALUES
(1, 'Parche para llanta', 20000.00, 'si', 1),
(2, 'Kit de herramientas para cambio de llantas', 60000.00, 'si', 1),
(3, 'Inflador de llantas portátil', 35000.00, 'no', 1),
(4, 'Tapacubos para llantas', 25000.00, 'no', 1),
(5, 'Candado de seguridad para llantas', 30000.00, 'si', 1),
(6, 'Llave de cruz para tuercas', 20000.00, 'si', 1),
(7, 'Bomba de aire eléctrica', 40000.00, 'si', 1),
(8, 'Gato hidráulico de carrito', 60000.00, 'si', 1),
(9, 'Cables de arranque para batería', 50000.00, 'si', 1),
(10, 'Llave de tuercas ajustable', 25000.00, 'si', 1),
(11, 'Llave inglesa', 20000.00, 'si', 1),
(12, 'Guantes de trabajo', 15000.00, 'no', 1),
(13, 'Desengrasante para llantas', 30000.00, 'no', 1),
(14, 'Llave de torque', 35000.00, 'si', 1),
(15, 'Adhesivo para parches', 10000.00, 'si', 1),
(16, 'Cepillo para limpieza de llantas', 15000.00, 'no', 1),
(17, 'Llave de rueda telescópica', 25000.00, 'si', 1),
(18, 'Kit de reparación de neumáticos', 40000.00, 'si', 1),
(19, 'Pulidora de llantas', 50000.00, 'no', 1),
(20, 'Espuma selladora para llantas', 30000.00, 'no', 1),
(21, 'Escobilla limpiaparabrisas', 15000.00, 'si', 1),
(22, 'Tapetes para carro', 20000.00, 'si', 1),
(23, 'Aromatizante para carro', 10000.00, 'no', 1),
(24, 'Limpia vidrios para carro', 15000.00, 'no', 1),
(25, 'Organizador de maletero', 30000.00, 'si', 1),
(26, 'Cámara de reversa', 50000.00, 'si', 1),
(27, 'Cargador USB para carro', 20000.00, 'si', 1),
(28, 'Almohadilla lumbar para asiento', 25000.00, 'no', 1),
(29, 'Porta vasos para carro', 15000.00, 'si', 1),
(30, 'Cubierta para volante', 20000.00, 'si', 1),
(31, 'Alfombra antideslizante para tablero', 30000.00, 'no', 1),
(32, 'Extintor de incendios', 35000.00, 'si', 1),
(33, 'Espejo retrovisor panorámico', 40000.00, 'si', 1),
(34, 'Antena decorativa para carro', 20000.00, 'no', 1),
(35, 'Cubre asientos para carro', 25000.00, 'no', 1),
(36, 'Candado de seguridad para volante', 30000.00, 'si', 1),
(37, 'Cubierta para espejos retrovisores', 20000.00, 'si', 1),
(38, 'Kit de luces LED para carro', 40000.00, 'si', 1),
(39, 'Escobilla limpiaparabrisas trasera', 15000.00, 'si', 1),
(40, 'Bolsa de basura para carro', 10000.00, 'no', 1),
(41, 'Organizador de asiento trasero', 20000.00, 'no', 1),
(42, 'Caja organizadora para maletero', 30000.00, 'si', 1),
(43, 'Porta celular para carro', 25000.00, 'si', 1),
(44, 'Cubre ruedas de repuesto', 20000.00, 'si', 1),
(45, 'Sensor de estacionamiento', 40000.00, 'no', 1),
(46, 'Kit de emergencia para carro', 35000.00, 'no', 1),
(47, 'Limpiador de tapicería para carro', 30000.00, 'si', 1),
(48, 'Gafas de sol para conducción', 20000.00, 'si', 1),
(49, 'Cargador de batería para carro', 50000.00, 'si', 1),
(50, 'Limpiaparabrisas de repuesto', 15000.00, 'no', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productoproveedor`
--

CREATE TABLE `productoproveedor` (
  `idProveedor` int(10) UNSIGNED NOT NULL,
  `idProducto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productoproveedor`
--

INSERT INTO `productoproveedor` (`idProveedor`, `idProducto`) VALUES
(1, 27),
(3, 10),
(2, 38),
(5, 6),
(1, 19),
(4, 42),
(6, 17),
(7, 8),
(3, 28),
(1, 46),
(7, 16),
(5, 14),
(2, 21),
(4, 31),
(1, 11),
(6, 37),
(3, 3),
(7, 23),
(2, 2),
(4, 41),
(5, 25),
(1, 47),
(3, 39),
(7, 5),
(6, 9),
(2, 18),
(4, 33),
(5, 12),
(1, 48),
(3, 43),
(7, 20);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedor`
--

CREATE TABLE `proveedor` (
  `idProveedor` int(10) UNSIGNED NOT NULL,
  `nomProveedor` varchar(50) NOT NULL,
  `telefonoProveedor` int(11) NOT NULL,
  `direccionProveedor` varchar(50) NOT NULL,
  `emailProveedor` varchar(45) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedor`
--

INSERT INTO `proveedor` (`idProveedor`, `nomProveedor`, `telefonoProveedor`, `direccionProveedor`, `emailProveedor`) VALUES
(1, 'CarroPatch', 987654321, 'Calle 123', 'carropatch@gmail.com'),
(2, 'AccesoriosAutoShop', 123456789, 'Avenida Central', 'accesoriosautoshop@hotmail.com'),
(3, 'ParchesExpress', 456789123, 'Calle Principal', 'parchesexpress@gmail.com'),
(4, 'CarAccessoriesCo', 789123456, 'Avenida del Automóvil', 'caraccessoriesco@hotmail.com'),
(5, 'ParchesRápidos', 321654987, 'Calle Secundaria', 'parchesrapidos@gmail.com'),
(6, 'AutoPartsShop', 654987321, 'Avenida de los Accesorios', 'autopartsshop@hotmail.com'),
(7, 'ParchesYa', 918273645, 'Calle de Reparaciones', 'parchesya@gmail.com'),
(8, 'CarroAccesorios', 537289146, 'Avenida de los Carros', 'carroaccesorios@hotmail.com'),
(9, 'ParcheFácil', 193827465, 'Calle de los Parches', 'parchefacil@gmail.com'),
(10, 'AutoSupplies', 462837291, 'Avenida de los Suministros', 'autosupplies@hotmail.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `respuestapqrs`
--

CREATE TABLE `respuestapqrs` (
  `idRespuestaPqrs` int(10) UNSIGNED NOT NULL,
  `respuestaPqrs` text NOT NULL,
  `fechaRespuesta` date NOT NULL,
  `idPqrs` int(10) UNSIGNED NOT NULL,
  `idEmpleado` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `roles`
--

CREATE TABLE `roles` (
  `idRol` int(10) UNSIGNED NOT NULL,
  `nombreRol` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `roles`
--

INSERT INTO `roles` (`idRol`, `nombreRol`) VALUES
(1, 'Administrador'),
(2, 'Empleado Calidad'),
(3, 'Empleado Compras'),
(4, 'Empleado Ventas'),
(5, 'Administrador Inventario');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `salidainventarios`
--

CREATE TABLE `salidainventarios` (
  `idSalida` int(10) UNSIGNED NOT NULL,
  `fechaSalida` date NOT NULL,
  `totalProductosSalida` int(11) NOT NULL,
  `motivoSalida` varchar(45) NOT NULL,
  `idProducto` int(10) UNSIGNED NOT NULL,
  `idInventario` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `solicitudgarantia`
--

CREATE TABLE `solicitudgarantia` (
  `idSolicitud` int(10) UNSIGNED NOT NULL,
  `fechaSolicitud` date NOT NULL,
  `tituloSolicitud` varchar(40) NOT NULL,
  `observacionSolicitud` text NOT NULL,
  `linkEvidenciaGarantia` varchar(255) DEFAULT NULL,
  `idEstadoSolicitudG` int(10) UNSIGNED NOT NULL,
  `idventa` int(10) UNSIGNED NOT NULL,
  `idCliente` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tipocliente`
--

CREATE TABLE `tipocliente` (
  `idTipoCliente` int(10) UNSIGNED NOT NULL,
  `nombreTipoCliente` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tipocliente`
--

INSERT INTO `tipocliente` (`idTipoCliente`, `nombreTipoCliente`) VALUES
(1, 'Cliente Regular'),
(2, 'Cliente Corporativo');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `idUsuario` int(10) UNSIGNED NOT NULL,
  `cedula` int(11) NOT NULL,
  `nombre1` varchar(15) NOT NULL,
  `nombre2` varchar(15) DEFAULT NULL,
  `apellido1` varchar(20) NOT NULL,
  `apellido2` varchar(20) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `telefono` int(11) NOT NULL,
  `emailCliente` varchar(45) NOT NULL,
  `contrasenia` varchar(20) NOT NULL,
  `idRol` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `venta`
--

CREATE TABLE `venta` (
  `idVenta` int(10) UNSIGNED NOT NULL,
  `fechaVenta` date NOT NULL,
  `descuentoVenta` decimal(18,2) DEFAULT NULL,
  `subtotalVenta` decimal(18,2) NOT NULL,
  `ivaVenta` decimal(18,2) NOT NULL,
  `totalVenta` decimal(18,2) NOT NULL,
  `mensajeEntrega` varchar(250) DEFAULT NULL,
  `idCliente` int(10) UNSIGNED NOT NULL,
  `idEmpleado` int(10) UNSIGNED NOT NULL,
  `idFormadePago` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ventaproducto`
--

CREATE TABLE `ventaproducto` (
  `cantidadProducto` int(11) NOT NULL,
  `idVenta` int(10) UNSIGNED NOT NULL,
  `idProducto` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoriaproducto`
--
ALTER TABLE `categoriaproducto`
  ADD PRIMARY KEY (`idCatProducto`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`idCliente`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idtipoCliente` (`idtipoCliente`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`idCompra`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idEstadoCompra` (`idEstadoCompra`);

--
-- Indices de la tabla `compraproducto`
--
ALTER TABLE `compraproducto`
  ADD KEY `idCompra` (`idCompra`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `compraproveedor`
--
ALTER TABLE `compraproveedor`
  ADD KEY `idCompra` (`idCompra`),
  ADD KEY `idProveedor` (`idProveedor`);

--
-- Indices de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD PRIMARY KEY (`idDomicilio`),
  ADD KEY `idVenta` (`idVenta`),
  ADD KEY `idEstadoDomicilio` (`idEstadoDomicilio`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`idEmpleado`),
  ADD KEY `idUsuario` (`idUsuario`),
  ADD KEY `idEstadoEmpleado` (`idEstadoEmpleado`),
  ADD KEY `idEps` (`idEps`),
  ADD KEY `idEstrato` (`idEstrato`),
  ADD KEY `idCargo` (`idCargo`);

--
-- Indices de la tabla `entradainventarios`
--
ALTER TABLE `entradainventarios`
  ADD PRIMARY KEY (`idEntrada`),
  ADD KEY `idInventario` (`idInventario`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `eps`
--
ALTER TABLE `eps`
  ADD PRIMARY KEY (`idEps`);

--
-- Indices de la tabla `estadocompra`
--
ALTER TABLE `estadocompra`
  ADD PRIMARY KEY (`idEstadoCompra`);

--
-- Indices de la tabla `estadodomicilio`
--
ALTER TABLE `estadodomicilio`
  ADD PRIMARY KEY (`idEstadoDomicilio`);

--
-- Indices de la tabla `estadoempleado`
--
ALTER TABLE `estadoempleado`
  ADD PRIMARY KEY (`idEstadoEmpleado`);

--
-- Indices de la tabla `estadonovedades`
--
ALTER TABLE `estadonovedades`
  ADD PRIMARY KEY (`idEstadoNovedades`);

--
-- Indices de la tabla `estadosolicitudg`
--
ALTER TABLE `estadosolicitudg`
  ADD PRIMARY KEY (`idEstadoSolicitudG`);

--
-- Indices de la tabla `estrato`
--
ALTER TABLE `estrato`
  ADD PRIMARY KEY (`idEstrato`);

--
-- Indices de la tabla `formadepago`
--
ALTER TABLE `formadepago`
  ADD PRIMARY KEY (`idFormadePago`);

--
-- Indices de la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD PRIMARY KEY (`idInventario`),
  ADD KEY `idEmpleado` (`idEmpleado`);

--
-- Indices de la tabla `novedades`
--
ALTER TABLE `novedades`
  ADD PRIMARY KEY (`idNovedades`),
  ADD KEY `idEstadoNovedades` (`idEstadoNovedades`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idSalida` (`idSalida`),
  ADD KEY `idEntrada` (`idEntrada`);

--
-- Indices de la tabla `pqrs`
--
ALTER TABLE `pqrs`
  ADD PRIMARY KEY (`idPqrs`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`idProducto`),
  ADD KEY `idCatProducto` (`idCatProducto`);

--
-- Indices de la tabla `productoproveedor`
--
ALTER TABLE `productoproveedor`
  ADD KEY `idProveedor` (`idProveedor`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  ADD PRIMARY KEY (`idProveedor`);

--
-- Indices de la tabla `respuestapqrs`
--
ALTER TABLE `respuestapqrs`
  ADD PRIMARY KEY (`idRespuestaPqrs`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idPqrs` (`idPqrs`);

--
-- Indices de la tabla `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`idRol`);

--
-- Indices de la tabla `salidainventarios`
--
ALTER TABLE `salidainventarios`
  ADD PRIMARY KEY (`idSalida`),
  ADD KEY `idInventario` (`idInventario`),
  ADD KEY `idProducto` (`idProducto`);

--
-- Indices de la tabla `solicitudgarantia`
--
ALTER TABLE `solicitudgarantia`
  ADD PRIMARY KEY (`idSolicitud`),
  ADD KEY `idEstadoSolicitudG` (`idEstadoSolicitudG`),
  ADD KEY `idCliente` (`idCliente`),
  ADD KEY `idventa` (`idventa`);

--
-- Indices de la tabla `tipocliente`
--
ALTER TABLE `tipocliente`
  ADD PRIMARY KEY (`idTipoCliente`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`idUsuario`),
  ADD KEY `idRol` (`idRol`);

--
-- Indices de la tabla `venta`
--
ALTER TABLE `venta`
  ADD PRIMARY KEY (`idVenta`),
  ADD KEY `idFormadePago` (`idFormadePago`),
  ADD KEY `idEmpleado` (`idEmpleado`),
  ADD KEY `idCliente` (`idCliente`);

--
-- Indices de la tabla `ventaproducto`
--
ALTER TABLE `ventaproducto`
  ADD KEY `idVenta` (`idVenta`),
  ADD KEY `idProducto` (`idProducto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoriaproducto`
--
ALTER TABLE `categoriaproducto`
  MODIFY `idCatProducto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `idCliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `idCompra` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `domicilio`
--
ALTER TABLE `domicilio`
  MODIFY `idDomicilio` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `empleado`
--
ALTER TABLE `empleado`
  MODIFY `idEmpleado` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `entradainventarios`
--
ALTER TABLE `entradainventarios`
  MODIFY `idEntrada` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `eps`
--
ALTER TABLE `eps`
  MODIFY `idEps` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `estadocompra`
--
ALTER TABLE `estadocompra`
  MODIFY `idEstadoCompra` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT de la tabla `estadodomicilio`
--
ALTER TABLE `estadodomicilio`
  MODIFY `idEstadoDomicilio` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `estadoempleado`
--
ALTER TABLE `estadoempleado`
  MODIFY `idEstadoEmpleado` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `estadonovedades`
--
ALTER TABLE `estadonovedades`
  MODIFY `idEstadoNovedades` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `estadosolicitudg`
--
ALTER TABLE `estadosolicitudg`
  MODIFY `idEstadoSolicitudG` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `estrato`
--
ALTER TABLE `estrato`
  MODIFY `idEstrato` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `formadepago`
--
ALTER TABLE `formadepago`
  MODIFY `idFormadePago` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `inventario`
--
ALTER TABLE `inventario`
  MODIFY `idInventario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `novedades`
--
ALTER TABLE `novedades`
  MODIFY `idNovedades` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pqrs`
--
ALTER TABLE `pqrs`
  MODIFY `idPqrs` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `idProducto` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT de la tabla `proveedor`
--
ALTER TABLE `proveedor`
  MODIFY `idProveedor` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `respuestapqrs`
--
ALTER TABLE `respuestapqrs`
  MODIFY `idRespuestaPqrs` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `roles`
--
ALTER TABLE `roles`
  MODIFY `idRol` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `salidainventarios`
--
ALTER TABLE `salidainventarios`
  MODIFY `idSalida` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `solicitudgarantia`
--
ALTER TABLE `solicitudgarantia`
  MODIFY `idSolicitud` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tipocliente`
--
ALTER TABLE `tipocliente`
  MODIFY `idTipoCliente` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `idUsuario` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `venta`
--
ALTER TABLE `venta`
  MODIFY `idVenta` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD CONSTRAINT `cliente_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `cliente_ibfk_2` FOREIGN KEY (`idtipoCliente`) REFERENCES `tipocliente` (`idTipoCliente`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`idEstadoCompra`) REFERENCES `estadocompra` (`idEstadoCompra`);

--
-- Filtros para la tabla `compraproducto`
--
ALTER TABLE `compraproducto`
  ADD CONSTRAINT `compraproducto_ibfk_1` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idCompra`),
  ADD CONSTRAINT `compraproducto_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `compraproveedor`
--
ALTER TABLE `compraproveedor`
  ADD CONSTRAINT `compraproveedor_ibfk_1` FOREIGN KEY (`idCompra`) REFERENCES `compra` (`idCompra`),
  ADD CONSTRAINT `compraproveedor_ibfk_2` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`);

--
-- Filtros para la tabla `domicilio`
--
ALTER TABLE `domicilio`
  ADD CONSTRAINT `domicilio_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`),
  ADD CONSTRAINT `domicilio_ibfk_2` FOREIGN KEY (`idEstadoDomicilio`) REFERENCES `estadodomicilio` (`idEstadoDomicilio`);

--
-- Filtros para la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD CONSTRAINT `empleado_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuarios` (`idUsuario`),
  ADD CONSTRAINT `empleado_ibfk_2` FOREIGN KEY (`idEps`) REFERENCES `eps` (`idEps`),
  ADD CONSTRAINT `empleado_ibfk_3` FOREIGN KEY (`idEstrato`) REFERENCES `estrato` (`idEstrato`),
  ADD CONSTRAINT `empleado_ibfk_4` FOREIGN KEY (`idEstadoEmpleado`) REFERENCES `estadoempleado` (`idEstadoEmpleado`);

--
-- Filtros para la tabla `entradainventarios`
--
ALTER TABLE `entradainventarios`
  ADD CONSTRAINT `entradainventarios_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
  ADD CONSTRAINT `entradainventarios_ibfk_2` FOREIGN KEY (`idInventario`) REFERENCES `inventario` (`idInventario`);

--
-- Filtros para la tabla `inventario`
--
ALTER TABLE `inventario`
  ADD CONSTRAINT `inventario_ibfk_1` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`);

--
-- Filtros para la tabla `novedades`
--
ALTER TABLE `novedades`
  ADD CONSTRAINT `novedades_ibfk_1` FOREIGN KEY (`idEstadoNovedades`) REFERENCES `estadonovedades` (`idEstadoNovedades`),
  ADD CONSTRAINT `novedades_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  ADD CONSTRAINT `novedades_ibfk_3` FOREIGN KEY (`idEntrada`) REFERENCES `entradainventarios` (`idEntrada`),
  ADD CONSTRAINT `novedades_ibfk_4` FOREIGN KEY (`idSalida`) REFERENCES `salidainventarios` (`idSalida`);

--
-- Filtros para la tabla `pqrs`
--
ALTER TABLE `pqrs`
  ADD CONSTRAINT `pqrs_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`idCatProducto`) REFERENCES `categoriaproducto` (`idCatProducto`);

--
-- Filtros para la tabla `productoproveedor`
--
ALTER TABLE `productoproveedor`
  ADD CONSTRAINT `productoproveedor_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`),
  ADD CONSTRAINT `productoproveedor_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);

--
-- Filtros para la tabla `respuestapqrs`
--
ALTER TABLE `respuestapqrs`
  ADD CONSTRAINT `respuestapqrs_ibfk_1` FOREIGN KEY (`idPqrs`) REFERENCES `pqrs` (`idPqrs`),
  ADD CONSTRAINT `respuestapqrs_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`);

--
-- Filtros para la tabla `salidainventarios`
--
ALTER TABLE `salidainventarios`
  ADD CONSTRAINT `salidainventarios_ibfk_1` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`),
  ADD CONSTRAINT `salidainventarios_ibfk_2` FOREIGN KEY (`idInventario`) REFERENCES `inventario` (`idInventario`);

--
-- Filtros para la tabla `solicitudgarantia`
--
ALTER TABLE `solicitudgarantia`
  ADD CONSTRAINT `solicitudgarantia_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `solicitudgarantia_ibfk_2` FOREIGN KEY (`idEstadoSolicitudG`) REFERENCES `estadosolicitudg` (`idEstadoSolicitudG`),
  ADD CONSTRAINT `solicitudgarantia_ibfk_3` FOREIGN KEY (`idventa`) REFERENCES `venta` (`idVenta`);

--
-- Filtros para la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`idRol`) REFERENCES `roles` (`idRol`);

--
-- Filtros para la tabla `venta`
--
ALTER TABLE `venta`
  ADD CONSTRAINT `venta_ibfk_1` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  ADD CONSTRAINT `venta_ibfk_2` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  ADD CONSTRAINT `venta_ibfk_3` FOREIGN KEY (`idFormadePago`) REFERENCES `formadepago` (`idFormadePago`);

--
-- Filtros para la tabla `ventaproducto`
--
ALTER TABLE `ventaproducto`
  ADD CONSTRAINT `ventaproducto_ibfk_1` FOREIGN KEY (`idVenta`) REFERENCES `venta` (`idVenta`),
  ADD CONSTRAINT `ventaproducto_ibfk_2` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
