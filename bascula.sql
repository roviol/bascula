-- phpMyAdmin SQL Dump
-- version 4.1.12
-- http://www.phpmyadmin.net
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-04-2015 a las 21:56:37
-- Versión del servidor: 5.6.16
-- Versión de PHP: 5.5.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de datos: `bascula`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `arrime_recepcion`
--

CREATE TABLE IF NOT EXISTS `arrime_recepcion` (
  `transaccion_ptr_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  PRIMARY KEY (`transaccion_ptr_id`),
  KEY `arrime_recepcion_1635d9bd` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `arrime_recepcion`
--

INSERT INTO `arrime_recepcion` (`transaccion_ptr_id`, `producto_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group`
--

CREATE TABLE IF NOT EXISTS `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(80) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `auth_group`
--

INSERT INTO `auth_group` (`id`, `name`) VALUES
(1, 'operador');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_group_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Volcado de datos para la tabla `auth_group_permissions`
--

INSERT INTO `auth_group_permissions` (`id`, `group_id`, `permission_id`) VALUES
(4, 1, 58),
(5, 1, 59),
(6, 1, 60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_permission`
--

CREATE TABLE IF NOT EXISTS `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=73 ;

--
-- Volcado de datos para la tabla `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can add permission', 2, 'add_permission'),
(5, 'Can change permission', 2, 'change_permission'),
(6, 'Can delete permission', 2, 'delete_permission'),
(7, 'Can add group', 3, 'add_group'),
(8, 'Can change group', 3, 'change_group'),
(9, 'Can delete group', 3, 'delete_group'),
(10, 'Can add user', 4, 'add_user'),
(11, 'Can change user', 4, 'change_user'),
(12, 'Can delete user', 4, 'delete_user'),
(13, 'Can add content type', 5, 'add_contenttype'),
(14, 'Can change content type', 5, 'change_contenttype'),
(15, 'Can delete content type', 5, 'delete_contenttype'),
(16, 'Can add session', 6, 'add_session'),
(17, 'Can change session', 6, 'change_session'),
(18, 'Can delete session', 6, 'delete_session'),
(19, 'Can add empresa', 7, 'add_empresa'),
(20, 'Can change empresa', 7, 'change_empresa'),
(21, 'Can delete empresa', 7, 'delete_empresa'),
(22, 'Can add proveedor', 8, 'add_proveedor'),
(23, 'Can change proveedor', 8, 'change_proveedor'),
(24, 'Can delete proveedor', 8, 'delete_proveedor'),
(25, 'Can add transportista', 9, 'add_transportista'),
(26, 'Can change transportista', 9, 'change_transportista'),
(27, 'Can delete transportista', 9, 'delete_transportista'),
(28, 'Can add cliente', 10, 'add_cliente'),
(29, 'Can change cliente', 10, 'change_cliente'),
(30, 'Can delete cliente', 10, 'delete_cliente'),
(31, 'Can add producto', 11, 'add_producto'),
(32, 'Can change producto', 11, 'change_producto'),
(33, 'Can delete producto', 11, 'delete_producto'),
(34, 'Can add bascula', 12, 'add_bascula'),
(35, 'Can change bascula', 12, 'change_bascula'),
(36, 'Can delete bascula', 12, 'delete_bascula'),
(37, 'Can add Producto Final', 13, 'add_productofinal'),
(38, 'Can change Producto Final', 13, 'change_productofinal'),
(39, 'Can delete Producto Final', 13, 'delete_productofinal'),
(40, 'Can add Materia Prima', 14, 'add_materiaprima'),
(41, 'Can change Materia Prima', 14, 'change_materiaprima'),
(42, 'Can delete Materia Prima', 14, 'delete_materiaprima'),
(43, 'Can add transaccion', 15, 'add_transaccion'),
(44, 'Can change transaccion', 15, 'change_transaccion'),
(45, 'Can delete transaccion', 15, 'delete_transaccion'),
(46, 'Can add proceso', 16, 'add_proceso'),
(47, 'Can change proceso', 16, 'change_proceso'),
(48, 'Can delete proceso', 16, 'delete_proceso'),
(49, 'Can add Proporcion de Entrada', 17, 'add_proporcionentrada'),
(50, 'Can change Proporcion de Entrada', 17, 'change_proporcionentrada'),
(51, 'Can delete Proporcion de Entrada', 17, 'delete_proporcionentrada'),
(52, 'Can add Proporcion de Salida', 18, 'add_proporcionsalida'),
(53, 'Can change Proporcion de Salida', 18, 'change_proporcionsalida'),
(54, 'Can delete Proporcion de Salida', 18, 'delete_proporcionsalida'),
(55, 'Can add unidad', 19, 'add_unidad'),
(56, 'Can change unidad', 19, 'change_unidad'),
(57, 'Can delete unidad', 19, 'delete_unidad'),
(58, 'Can add Recepcion', 20, 'add_recepcion'),
(59, 'Can change Recepcion', 20, 'change_recepcion'),
(60, 'Can delete Recepcion', 20, 'delete_recepcion'),
(61, 'Can add despacho', 21, 'add_despacho'),
(62, 'Can change despacho', 21, 'change_despacho'),
(63, 'Can delete despacho', 21, 'delete_despacho'),
(64, 'Can add produccion', 22, 'add_produccion'),
(65, 'Can change produccion', 22, 'change_produccion'),
(66, 'Can delete produccion', 22, 'delete_produccion'),
(67, 'Can add entrada', 23, 'add_entrada'),
(68, 'Can change entrada', 23, 'change_entrada'),
(69, 'Can delete entrada', 23, 'delete_entrada'),
(70, 'Can add salida', 24, 'add_salida'),
(71, 'Can change salida', 24, 'change_salida'),
(72, 'Can delete salida', 24, 'delete_salida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user`
--

CREATE TABLE IF NOT EXISTS `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$12000$DA1Q4e5KF7bx$+X7BP+nUbDh9xo7g+ZzyJXLrkbOL6WoQSeq8NG6Hfes=', '2014-12-01 10:25:31', 1, 'admin', '', '', '', 1, 1, '2014-06-10 11:01:53'),
(2, 'pbkdf2_sha256$12000$lwrFOFzdetVP$vMIFM70MtbBI4dTxrGvc2Fs9fl7zoVpZz9tfDA3W//Q=', '2014-07-02 01:17:06', 0, 'Operador1', 'Rigo', 'Urdaneta', '', 1, 1, '2014-07-02 01:11:12'),
(3, 'pbkdf2_sha256$12000$KBRJyhgf1B89$AScrhnzN/lf2M62JZr7VcFqdbM/NZZZ5NUnHkviNA4E=', '2014-09-22 04:29:18', 0, 'operador', '', '', '', 1, 1, '2014-09-22 02:57:43');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_groups`
--

CREATE TABLE IF NOT EXISTS `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `auth_user_groups_6340c63c` (`user_id`),
  KEY `auth_user_groups_5f412f9a` (`group_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Volcado de datos para la tabla `auth_user_groups`
--

INSERT INTO `auth_user_groups` (`id`, `user_id`, `group_id`) VALUES
(1, 3, 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `auth_user_user_permissions`
--

CREATE TABLE IF NOT EXISTS `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `auth_user_user_permissions_6340c63c` (`user_id`),
  KEY `auth_user_user_permissions_83d7f98b` (`permission_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `auth_user_user_permissions`
--

INSERT INTO `auth_user_user_permissions` (`id`, `user_id`, `permission_id`) VALUES
(4, 2, 52),
(3, 2, 58),
(5, 2, 61);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `despacho_despacho`
--

CREATE TABLE IF NOT EXISTS `despacho_despacho` (
  `transaccion_ptr_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  PRIMARY KEY (`transaccion_ptr_id`),
  KEY `despacho_despacho_1635d9bd` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_admin_log`
--

CREATE TABLE IF NOT EXISTS `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime NOT NULL,
  `user_id` int(11) NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_6340c63c` (`user_id`),
  KEY `django_admin_log_37ef4eb4` (`content_type_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=49 ;

--
-- Volcado de datos para la tabla `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `user_id`, `content_type_id`, `object_id`, `object_repr`, `action_flag`, `change_message`) VALUES
(1, '2014-06-10 11:47:24', 1, 8, '1', 'Proveedor 1', 1, ''),
(2, '2014-06-10 11:47:38', 1, 9, '2', 'Transportista 1', 1, ''),
(3, '2014-06-10 11:47:48', 1, 10, '3', 'Cliente 1', 1, ''),
(4, '2014-06-10 11:48:01', 1, 12, '1', 'Santa Barbara', 1, ''),
(5, '2014-06-10 11:48:15', 1, 19, '1', 'TON', 1, ''),
(6, '2014-06-10 11:48:26', 1, 19, '2', 'LTS', 1, ''),
(7, '2014-06-10 11:48:41', 1, 14, '1', 'Racimo de Fruta Fresca (TON)', 1, ''),
(8, '2014-06-10 11:48:50', 1, 14, '2', 'Aceite Rojo (LTS)', 1, ''),
(9, '2014-06-10 11:49:38', 1, 14, '2', 'Aceite Rojo (LTS)', 3, ''),
(10, '2014-06-10 11:49:52', 1, 13, '3', 'Aceite Rojo (LTS)', 1, ''),
(11, '2014-06-10 15:02:14', 1, 8, '4', 'Agrop. La Prueba', 1, ''),
(12, '2014-06-10 15:02:52', 1, 12, '2', 'Casigua', 1, ''),
(13, '2014-06-10 15:16:11', 1, 20, '1', 'Santa Barbara Agrop. La Prueba 2014-06-10 10', 1, ''),
(14, '2014-06-11 00:28:52', 1, 20, '2', 'Santa Barbara Proveedor 1 2014-06-11 None', 1, ''),
(15, '2014-06-11 01:01:56', 1, 13, '4', 'Aceite de Palmiste (TON)', 1, ''),
(16, '2014-06-11 01:24:36', 1, 10, '5', 'Polar Comercial', 1, ''),
(17, '2014-06-12 09:20:22', 1, 20, '2', 'Santa Barbara Agrop. La Prueba 2014-06-11 None', 2, 'Modificado/a proveedor.'),
(18, '2014-06-12 09:20:32', 1, 20, '2', 'Santa Barbara Proveedor 1 2014-06-11 None', 2, 'Modificado/a proveedor.'),
(19, '2014-06-14 01:24:21', 1, 9, '6', 'Transporte Monagillo', 1, ''),
(20, '2014-06-14 01:25:16', 1, 20, '3', 'Santa Barbara Agrop. La Prueba 2014-06-14 None', 1, ''),
(21, '2014-06-15 15:04:43', 1, 12, '3', 'Santa Cruz de Zulia', 1, ''),
(22, '2014-06-22 01:25:44', 1, 8, '7', 'Agrop. La Esperanza', 1, ''),
(23, '2014-06-22 01:26:55', 1, 9, '8', 'Luis Pulgar', 1, ''),
(24, '2014-06-22 01:27:35', 1, 20, '4', 'Santa Cruz de Zulia Agrop. La Esperanza 2014-06-22 None', 1, ''),
(25, '2014-06-22 02:10:52', 1, 20, '4', 'Santa Cruz de Zulia Agrop. La Esperanza 2014-06-22 None', 2, 'No ha cambiado ningún campo.'),
(26, '2014-06-22 17:49:24', 1, 20, '2', 'Santa Barbara Proveedor 1 2014-06-11 None', 2, 'Modificado/a tara.'),
(27, '2014-06-22 20:51:10', 1, 20, '4', 'Santa Cruz de Zulia Agrop. La Esperanza 2014-06-22 None', 2, 'No ha cambiado ningún campo.'),
(28, '2014-07-02 01:06:24', 1, 20, '4', 'Santa Cruz de Zulia Agrop. La Esperanza 2014-06-22 None', 2, 'Modificado/a tara.'),
(29, '2014-07-02 01:11:12', 1, 4, '2', 'Operador1', 1, ''),
(30, '2014-07-02 01:12:05', 1, 4, '2', 'Operador1', 2, 'Modificado/a user_permissions.'),
(31, '2014-07-02 01:13:45', 1, 4, '2', 'Operador1', 2, 'Modificado/a is_superuser.'),
(32, '2014-07-02 01:16:42', 1, 4, '2', 'Operador1', 2, 'Modificado/a first_name, last_name, is_staff, is_superuser y user_permissions.'),
(33, '2014-09-22 01:33:48', 1, 20, '4', 'Santa Cruz de Zulia Agrop. La Esperanza 2014-06-21 None', 2, 'No ha cambiado ningún campo.'),
(34, '2014-09-22 01:34:03', 1, 20, '4', 'Santa Cruz de Zulia Agrop. La Esperanza 2014-06-21 None', 2, 'Modificado/a tara.'),
(35, '2014-09-22 01:39:56', 1, 20, '1', 'Santa Barbara Agrop. La Prueba 2014-06-10 10.00', 2, 'Modificado/a tara.'),
(36, '2014-09-22 01:42:38', 1, 20, '4', 'Santa Cruz de Zulia Agrop. La Esperanza 2014-06-21 6784.00', 2, 'Modificado/a tara.'),
(37, '2014-09-22 01:43:20', 1, 20, '4', 'Santa Cruz de Zulia Agrop. La Esperanza 2014-06-21 6783.00', 2, 'Modificado/a tara.'),
(38, '2014-09-22 02:55:49', 1, 20, '2', 'Santa Barbara Proveedor 1 2014-06-11 6217.00', 2, 'Modificado/a tara.'),
(39, '2014-09-22 02:57:43', 1, 4, '3', 'operador', 1, ''),
(40, '2014-09-22 02:58:49', 1, 4, '3', 'operador', 2, 'Modificado/a is_staff.'),
(41, '2014-09-22 02:59:06', 1, 3, '1', 'operador', 1, ''),
(42, '2014-09-22 02:59:26', 1, 3, '1', 'operador', 2, 'Modificado/a permissions.'),
(43, '2014-09-22 03:01:03', 1, 3, '1', 'operador', 2, 'No ha cambiado ningún campo.'),
(44, '2014-09-22 03:02:16', 1, 4, '3', 'operador', 2, 'Modificado/a groups.'),
(45, '2014-09-22 03:09:08', 1, 20, '3', 'Santa Barbara Agrop. La Prueba 2014-06-13 34005.00', 2, 'Modificado/a tara.'),
(46, '2014-12-01 17:42:10', 1, 20, '5', 'Santa Barbara Agrop. La Prueba 2014-12-01 None', 1, ''),
(47, '2014-12-01 17:42:17', 1, 20, '5', 'Santa Barbara Agrop. La Prueba 2014-12-01 None', 2, 'No ha cambiado ningún campo.'),
(48, '2014-12-01 17:53:13', 1, 12, '1', 'Santa Barbara', 2, 'Modificado/a urlserial.');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_content_type`
--

CREATE TABLE IF NOT EXISTS `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Volcado de datos para la tabla `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `name`, `app_label`, `model`) VALUES
(1, 'log entry', 'admin', 'logentry'),
(2, 'permission', 'auth', 'permission'),
(3, 'group', 'auth', 'group'),
(4, 'user', 'auth', 'user'),
(5, 'content type', 'contenttypes', 'contenttype'),
(6, 'session', 'sessions', 'session'),
(7, 'empresa', 'general', 'empresa'),
(8, 'proveedor', 'general', 'proveedor'),
(9, 'transportista', 'general', 'transportista'),
(10, 'cliente', 'general', 'cliente'),
(11, 'producto', 'general', 'producto'),
(12, 'bascula', 'general', 'bascula'),
(13, 'Producto Final', 'general', 'productofinal'),
(14, 'Materia Prima', 'general', 'materiaprima'),
(15, 'transaccion', 'general', 'transaccion'),
(16, 'proceso', 'general', 'proceso'),
(17, 'Proporcion de Entrada', 'general', 'proporcionentrada'),
(18, 'Proporcion de Salida', 'general', 'proporcionsalida'),
(19, 'unidad', 'general', 'unidad'),
(20, 'Recepcion', 'arrime', 'recepcion'),
(21, 'despacho', 'despacho', 'despacho'),
(22, 'produccion', 'produccion', 'produccion'),
(23, 'entrada', 'produccion', 'entrada'),
(24, 'salida', 'produccion', 'salida');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `django_session`
--

CREATE TABLE IF NOT EXISTS `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('1u9rphtybnpj2cxk0fk9mdvyrmyobacq', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-10-06 00:01:07'),
('3ocjolh3jhawxk0qsjr93cx9jnq9hrgl', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-10-06 04:10:53'),
('4zwxa2hxj5snizzg947n6hciz2p05739', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-06-25 01:34:26'),
('56vpmbp2zs7dz2kkl62k4lhsr1rc61zi', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-10-06 04:50:12'),
('650g304t03lnchpwdn6kj0464bcwcy2y', 'NzY5MjcyNTQ0ZmQ0ZjhkZmM2NmExODQxOGU2YmZiM2I4YTk5MTEwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2014-07-10 15:12:30'),
('6mhhoagh5gtz3r32u3dnyb4sgyppi5bs', 'NzY5MjcyNTQ0ZmQ0ZjhkZmM2NmExODQxOGU2YmZiM2I4YTk5MTEwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2014-12-15 10:25:31'),
('80z074l541tdmelf81xv0uqp1vvq9yvx', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-06-24 12:36:08'),
('87yr9kcusd89iozmmkvih6wl5divympv', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-10-06 02:35:38'),
('8sfnzr0jfhhjfsp8sevd9hn3ry3tczs2', 'NzY5MjcyNTQ0ZmQ0ZjhkZmM2NmExODQxOGU2YmZiM2I4YTk5MTEwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2014-08-01 00:37:40'),
('9r7f1146j55u7sgtwinxk7jmv4m68ulf', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-10-06 00:29:28'),
('bjsalwm19wvh508uxb3hy6tcfflplebp', 'NzY5MjcyNTQ0ZmQ0ZjhkZmM2NmExODQxOGU2YmZiM2I4YTk5MTEwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2014-07-09 23:52:34'),
('c0firsj49ajh8yz8ofg5t8x7cmdo390k', 'NzY5MjcyNTQ0ZmQ0ZjhkZmM2NmExODQxOGU2YmZiM2I4YTk5MTEwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2014-07-16 01:19:19'),
('dg9hesfjq4697goodpyh97f7nu7js73i', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-10-06 00:40:24'),
('gcbtjhydiozkseuh2suugkgfncc4ja3j', 'NzY5MjcyNTQ0ZmQ0ZjhkZmM2NmExODQxOGU2YmZiM2I4YTk5MTEwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2014-06-25 00:26:57'),
('gjjafi7vudhckenmzl40781f81o90r4i', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-10-06 00:07:10'),
('hn8sqqxwrgvym7e2v2pkmc0t0mzkceut', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-10-06 04:10:51'),
('i02ga9kaekwecjs85ltf14nqby0bcfh7', 'NzY5MjcyNTQ0ZmQ0ZjhkZmM2NmExODQxOGU2YmZiM2I4YTk5MTEwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2014-09-01 03:41:38'),
('j9928ilcvq19jpfoe5omupzhl3fc687r', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-10-06 00:01:53'),
('jg2kc1krd6d6el1oea1v29bigmy8wnis', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-10-06 02:41:03'),
('m9es6u7kiab6x1snoymp9wfeivkbt4fz', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-07-08 10:39:16'),
('nsbelscbld927itr7lmmwz6q8hgu6r01', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-06-26 09:29:01'),
('ojt0hyhjef60z9yqmmtplxuuue8bhnfh', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-10-06 04:10:13'),
('qbo1zfo3klq7cev6w7bhb6h6liwlvmqz', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-07-06 19:29:51'),
('qjovzi8oylpv68cynlud5eyjf83h2b9p', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-10-06 04:10:45'),
('rjj8sfn5jmu5ww8e0x54c9ol8oi5h3o1', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-06-25 01:42:56'),
('rm5b870jxcd1wd3rb8rvo1zmp7t1m1bk', 'NzY5MjcyNTQ0ZmQ0ZjhkZmM2NmExODQxOGU2YmZiM2I4YTk5MTEwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2014-06-25 00:26:53'),
('to0jwq3i4ojz1ewgj63jx5uqnyrdxpwg', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-10-06 00:38:28'),
('ugz3q6mkqy0opw1ykclvpucckrmvqb47', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-06-25 01:23:02'),
('v1eebajvipnc7qjqe2dagbzv6vtvl061', 'NzY5MjcyNTQ0ZmQ0ZjhkZmM2NmExODQxOGU2YmZiM2I4YTk5MTEwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2014-06-24 14:47:14'),
('ze3xhsk2s2jddn30x40pbidv4ev3i8dl', 'NzY5MjcyNTQ0ZmQ0ZjhkZmM2NmExODQxOGU2YmZiM2I4YTk5MTEwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2014-09-15 04:48:29'),
('zsem335m6snma1r2m9pwl96h85v6gu8q', 'NzY5MjcyNTQ0ZmQ0ZjhkZmM2NmExODQxOGU2YmZiM2I4YTk5MTEwODp7Il9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIiwiX2F1dGhfdXNlcl9pZCI6MX0=', '2014-08-22 10:49:11'),
('ztora3ijxn4p6rchr0itbhvbk5xw9jdz', 'NTUzNTQxNDI4NmFiYjMxNjc0MmMzM2M1ZDRlNmI2YjlhMDFkM2E3NTp7fQ==', '2014-10-06 00:01:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `general_bascula`
--

CREATE TABLE IF NOT EXISTS `general_bascula` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `urlserial` varchar(500) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Volcado de datos para la tabla `general_bascula`
--

INSERT INTO `general_bascula` (`id`, `nombre`, `urlserial`) VALUES
(1, 'Santa Barbara', 'http://localhost:8001/?puerto=1&envio='),
(2, 'Casigua', ''),
(3, 'Santa Cruz de Zulia', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `general_cliente`
--

CREATE TABLE IF NOT EXISTS `general_cliente` (
  `empresa_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`empresa_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `general_cliente`
--

INSERT INTO `general_cliente` (`empresa_ptr_id`) VALUES
(3),
(5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `general_empresa`
--

CREATE TABLE IF NOT EXISTS `general_empresa` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `rif` varchar(20) NOT NULL,
  `telefono` varchar(50) NOT NULL,
  `direccion` varchar(200) NOT NULL,
  `email` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Volcado de datos para la tabla `general_empresa`
--

INSERT INTO `general_empresa` (`id`, `nombre`, `rif`, `telefono`, `direccion`, `email`) VALUES
(1, 'Proveedor 1', '', '', '', ''),
(2, 'Transportista 1', '', '', '', ''),
(3, 'Cliente 1', '', '', '', ''),
(4, 'Agrop. La Prueba', 'J-000000000-0', '0426 1310604', 'Casigua El Cubo, Carretera Machiques Colon', 'ejemplo@ejemplo.com'),
(5, 'Polar Comercial', 'J-000000-0', '123456789', 'Valecia', 'prueba@prueba.com'),
(6, 'Transporte Monagillo', 'J-1111111-1', '1234567890', 'Santa Cruz de Zulia', 'transporte@monaguillo.com'),
(7, 'Agrop. La Esperanza', 'J-1234567-0', '0271-3334567', 'Casigua El Cubo', 'agrop.laesperanza@esperanza.com'),
(8, 'Luis Pulgar', 'V-12345678-1', '', 'Maracaibo Edo. Zulia', '');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `general_materiaprima`
--

CREATE TABLE IF NOT EXISTS `general_materiaprima` (
  `producto_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`producto_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `general_materiaprima`
--

INSERT INTO `general_materiaprima` (`producto_ptr_id`) VALUES
(1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `general_proceso`
--

CREATE TABLE IF NOT EXISTS `general_proceso` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `general_producto`
--

CREATE TABLE IF NOT EXISTS `general_producto` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(150) NOT NULL,
  `unidad_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `general_producto_ee6a53a3` (`unidad_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Volcado de datos para la tabla `general_producto`
--

INSERT INTO `general_producto` (`id`, `nombre`, `unidad_id`) VALUES
(1, 'Racimo de Fruta Fresca', 1),
(3, 'Aceite Rojo', 2),
(4, 'Aceite de Palmiste', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `general_productofinal`
--

CREATE TABLE IF NOT EXISTS `general_productofinal` (
  `producto_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`producto_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `general_productofinal`
--

INSERT INTO `general_productofinal` (`producto_ptr_id`) VALUES
(3),
(4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `general_proporcionentrada`
--

CREATE TABLE IF NOT EXISTS `general_proporcionentrada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proceso_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `proporcion` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `general_proporcionentrada_1d9ac477` (`proceso_id`),
  KEY `general_proporcionentrada_1635d9bd` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `general_proporcionsalida`
--

CREATE TABLE IF NOT EXISTS `general_proporcionsalida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proceso_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `proporcion` decimal(8,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `general_proporcionsalida_1d9ac477` (`proceso_id`),
  KEY `general_proporcionsalida_1635d9bd` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `general_proveedor`
--

CREATE TABLE IF NOT EXISTS `general_proveedor` (
  `empresa_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`empresa_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `general_proveedor`
--

INSERT INTO `general_proveedor` (`empresa_ptr_id`) VALUES
(1),
(4),
(7);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `general_transaccion`
--

CREATE TABLE IF NOT EXISTS `general_transaccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ubicacion_id` int(11) NOT NULL,
  `proveedor_id` int(11) NOT NULL,
  `transportista_id` int(11) NOT NULL,
  `fecha` datetime DEFAULT NULL,
  `bruto` decimal(8,2) DEFAULT NULL,
  `tara` decimal(8,2) DEFAULT NULL,
  `neto` decimal(8,2) DEFAULT NULL,
  `placa` varchar(20) NOT NULL,
  `conductor` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `general_transaccion_9e257391` (`ubicacion_id`),
  KEY `general_transaccion_0e63be46` (`proveedor_id`),
  KEY `general_transaccion_033f0919` (`transportista_id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Volcado de datos para la tabla `general_transaccion`
--

INSERT INTO `general_transaccion` (`id`, `ubicacion_id`, `proveedor_id`, `transportista_id`, `fecha`, `bruto`, `tara`, `neto`, `placa`, `conductor`) VALUES
(1, 1, 4, 2, '2014-06-10 15:16:11', '20.00', '10.01', '10.00', 'ABC-123', 'Pedro Perozo'),
(2, 1, 1, 2, '2014-06-11 00:28:52', '10000.00', '3783.00', '6217.00', 'qwe-asd', 'Jose Pirela'),
(3, 1, 4, 6, '2014-06-14 01:22:35', '37560.00', '3555.00', '34005.00', 'qwe-987', 'Juan Fuenmayor'),
(4, 3, 7, 8, '2014-06-22 01:23:58', '10785.00', '4002.00', '6783.00', '123-SDF', 'Luis Pulgar'),
(5, 1, 4, 6, '2014-12-01 17:41:51', '3744.00', '2944.00', '800.00', 'asdf', 'asdf');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `general_transportista`
--

CREATE TABLE IF NOT EXISTS `general_transportista` (
  `empresa_ptr_id` int(11) NOT NULL,
  PRIMARY KEY (`empresa_ptr_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `general_transportista`
--

INSERT INTO `general_transportista` (`empresa_ptr_id`) VALUES
(2),
(6),
(8);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `general_unidad`
--

CREATE TABLE IF NOT EXISTS `general_unidad` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `abreviatura` varchar(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Volcado de datos para la tabla `general_unidad`
--

INSERT INTO `general_unidad` (`id`, `nombre`, `abreviatura`) VALUES
(1, 'Toneladas', 'TON'),
(2, 'Litros', 'LTS');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion_entrada`
--

CREATE TABLE IF NOT EXISTS `produccion_entrada` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produccion_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `produccion_entrada_ab8780e3` (`produccion_id`),
  KEY `produccion_entrada_1635d9bd` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion_produccion`
--

CREATE TABLE IF NOT EXISTS `produccion_produccion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `proceso_id` int(11) NOT NULL,
  `fecha` date NOT NULL,
  `observacion` varchar(2000) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `produccion_produccion_1d9ac477` (`proceso_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `produccion_salida`
--

CREATE TABLE IF NOT EXISTS `produccion_salida` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `produccion_id` int(11) NOT NULL,
  `producto_id` int(11) NOT NULL,
  `cantidad` decimal(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `produccion_salida_ab8780e3` (`produccion_id`),
  KEY `produccion_salida_1635d9bd` (`producto_id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `arrime_recepcion`
--
ALTER TABLE `arrime_recepcion`
  ADD CONSTRAINT `producto_id_refs_producto_ptr_id_caf6fa33` FOREIGN KEY (`producto_id`) REFERENCES `general_materiaprima` (`producto_ptr_id`),
  ADD CONSTRAINT `transaccion_ptr_id_refs_id_ab48aa42` FOREIGN KEY (`transaccion_ptr_id`) REFERENCES `general_transaccion` (`id`);

--
-- Filtros para la tabla `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`);

--
-- Filtros para la tabla `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Filtros para la tabla `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `group_id_refs_id_274b862c` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `user_id_refs_id_40c41112` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `permission_id_refs_id_35d9ac25` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `user_id_refs_id_4dc23c39` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `despacho_despacho`
--
ALTER TABLE `despacho_despacho`
  ADD CONSTRAINT `producto_id_refs_producto_ptr_id_76d959cb` FOREIGN KEY (`producto_id`) REFERENCES `general_productofinal` (`producto_ptr_id`),
  ADD CONSTRAINT `transaccion_ptr_id_refs_id_a99bbdf9` FOREIGN KEY (`transaccion_ptr_id`) REFERENCES `general_transaccion` (`id`);

--
-- Filtros para la tabla `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `content_type_id_refs_id_93d2d1f8` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `user_id_refs_id_c0d12874` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Filtros para la tabla `general_cliente`
--
ALTER TABLE `general_cliente`
  ADD CONSTRAINT `empresa_ptr_id_refs_id_8045ddb8` FOREIGN KEY (`empresa_ptr_id`) REFERENCES `general_empresa` (`id`);

--
-- Filtros para la tabla `general_materiaprima`
--
ALTER TABLE `general_materiaprima`
  ADD CONSTRAINT `producto_ptr_id_refs_id_8b6ee98e` FOREIGN KEY (`producto_ptr_id`) REFERENCES `general_producto` (`id`);

--
-- Filtros para la tabla `general_producto`
--
ALTER TABLE `general_producto`
  ADD CONSTRAINT `unidad_id_refs_id_8054c9d5` FOREIGN KEY (`unidad_id`) REFERENCES `general_unidad` (`id`);

--
-- Filtros para la tabla `general_productofinal`
--
ALTER TABLE `general_productofinal`
  ADD CONSTRAINT `producto_ptr_id_refs_id_8ca973c5` FOREIGN KEY (`producto_ptr_id`) REFERENCES `general_producto` (`id`);

--
-- Filtros para la tabla `general_proporcionentrada`
--
ALTER TABLE `general_proporcionentrada`
  ADD CONSTRAINT `proceso_id_refs_id_b2c0a8cd` FOREIGN KEY (`proceso_id`) REFERENCES `general_proceso` (`id`),
  ADD CONSTRAINT `producto_id_refs_id_40f4cf71` FOREIGN KEY (`producto_id`) REFERENCES `general_producto` (`id`);

--
-- Filtros para la tabla `general_proporcionsalida`
--
ALTER TABLE `general_proporcionsalida`
  ADD CONSTRAINT `proceso_id_refs_id_b1fe644b` FOREIGN KEY (`proceso_id`) REFERENCES `general_proceso` (`id`),
  ADD CONSTRAINT `producto_id_refs_id_514e87c6` FOREIGN KEY (`producto_id`) REFERENCES `general_producto` (`id`);

--
-- Filtros para la tabla `general_proveedor`
--
ALTER TABLE `general_proveedor`
  ADD CONSTRAINT `empresa_ptr_id_refs_id_98537bb1` FOREIGN KEY (`empresa_ptr_id`) REFERENCES `general_empresa` (`id`);

--
-- Filtros para la tabla `general_transaccion`
--
ALTER TABLE `general_transaccion`
  ADD CONSTRAINT `proveedor_id_refs_empresa_ptr_id_1982f4e2` FOREIGN KEY (`proveedor_id`) REFERENCES `general_proveedor` (`empresa_ptr_id`),
  ADD CONSTRAINT `transportista_id_refs_empresa_ptr_id_2d0f6fc0` FOREIGN KEY (`transportista_id`) REFERENCES `general_transportista` (`empresa_ptr_id`),
  ADD CONSTRAINT `ubicacion_id_refs_id_75475937` FOREIGN KEY (`ubicacion_id`) REFERENCES `general_bascula` (`id`);

--
-- Filtros para la tabla `general_transportista`
--
ALTER TABLE `general_transportista`
  ADD CONSTRAINT `empresa_ptr_id_refs_id_94c720e5` FOREIGN KEY (`empresa_ptr_id`) REFERENCES `general_empresa` (`id`);

--
-- Filtros para la tabla `produccion_entrada`
--
ALTER TABLE `produccion_entrada`
  ADD CONSTRAINT `produccion_id_refs_id_b6360197` FOREIGN KEY (`produccion_id`) REFERENCES `produccion_produccion` (`id`),
  ADD CONSTRAINT `producto_id_refs_id_7fc1c3ff` FOREIGN KEY (`producto_id`) REFERENCES `general_producto` (`id`);

--
-- Filtros para la tabla `produccion_produccion`
--
ALTER TABLE `produccion_produccion`
  ADD CONSTRAINT `proceso_id_refs_id_3c00d2a5` FOREIGN KEY (`proceso_id`) REFERENCES `general_proceso` (`id`);

--
-- Filtros para la tabla `produccion_salida`
--
ALTER TABLE `produccion_salida`
  ADD CONSTRAINT `produccion_id_refs_id_8c0c2aad` FOREIGN KEY (`produccion_id`) REFERENCES `produccion_produccion` (`id`),
  ADD CONSTRAINT `producto_id_refs_id_9d3ed02e` FOREIGN KEY (`producto_id`) REFERENCES `general_producto` (`id`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
