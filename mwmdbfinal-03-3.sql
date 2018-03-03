/*
MySQL Backup
Database: mwmdbfinal
Backup Time: 2018-03-03 07:27:42
*/

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS `mwmdbfinal`.`desinstalaciones`;
DROP TABLE IF EXISTS `mwmdbfinal`.`r_pedido`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_asuntos`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_categoria`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_cliente_servicio`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_cliente_ticket`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_detalles`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_direccion`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_dispositivos`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_encargado_ticket`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_factura`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_persona`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_plan_internet`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_producto`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_proveedor`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_router_planes`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_routers`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_sectores`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_tickets`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_torres`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_users`;
DROP TABLE IF EXISTS `mwmdbfinal`.`t_venta`;
DROP TABLE IF EXISTS `mwmdbfinal`.`user_roles`;
CREATE TABLE `desinstalaciones` (
  `Id_Desinstalacion` int(11) NOT NULL AUTO_INCREMENT,
  `Cliente_Servicio` int(11) NOT NULL,
  `Cliente_Desinstalado` int(11) NOT NULL,
  `Fecha_Desinstalacion` date DEFAULT NULL,
  `Observaciones` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`Id_Desinstalacion`),
  KEY `fk_Desinstalaciones_T_Cliente_Servicio1_idx` (`Cliente_Servicio`),
  CONSTRAINT `fk_Desinstalaciones_T_Cliente_Servicio1` FOREIGN KEY (`Cliente_Servicio`) REFERENCES `t_cliente_servicio` (`Id_Cliente_Servicio`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `r_pedido` (
  `Id_Pedido` int(11) NOT NULL AUTO_INCREMENT,
  `Fk_Proveedor` int(11) NOT NULL,
  `Fk_Producto` int(11) NOT NULL,
  PRIMARY KEY (`Id_Pedido`),
  KEY `id_proveedorFK_idx` (`Fk_Proveedor`),
  KEY `id_productoFK_idx` (`Fk_Producto`),
  CONSTRAINT `id_productoFK` FOREIGN KEY (`Fk_Producto`) REFERENCES `t_producto` (`Id_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `id_proveedorFK` FOREIGN KEY (`Fk_Proveedor`) REFERENCES `t_proveedor` (`Id_Proveedor`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `t_asuntos` (
  `id_asunto` int(11) NOT NULL AUTO_INCREMENT,
  `ide` varchar(50) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id_asunto`),
  UNIQUE KEY `nombre` (`ide`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
CREATE TABLE `t_categoria` (
  `Id_Categoria` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Descripcion` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`Id_Categoria`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
CREATE TABLE `t_cliente_servicio` (
  `Id_Cliente_Servicio` int(11) NOT NULL AUTO_INCREMENT,
  `Cliente` int(11) NOT NULL,
  `id_Mk` varchar(6) DEFAULT NULL,
  `Sector` int(11) NOT NULL,
  `Ip` varchar(45) NOT NULL,
  `Fecha_Instalacion` date DEFAULT NULL,
  `Equipo_Instalado` int(11) DEFAULT NULL,
  `Primer_Pago` date DEFAULT NULL,
  `Plan` int(11) NOT NULL,
  `Dia_Cobro` varchar(10) DEFAULT NULL,
  `Ubicacion` varchar(45) DEFAULT NULL,
  `Router` int(11) NOT NULL,
  PRIMARY KEY (`Id_Cliente_Servicio`),
  KEY `fk_T_Cliente_Internet_T_Sectores1_idx` (`Sector`),
  KEY `fk_T_Cliente_Internet_T_Plan_Internet1_idx` (`Plan`),
  KEY `fk_T_Cliente_Internet_T_Routers1_idx` (`Router`),
  KEY `fk_T_Cliente_Internet_Dispositivos1_idx` (`Equipo_Instalado`),
  KEY `fk_T_Cliente_Servicio_T_Persona1_idx` (`Cliente`),
  CONSTRAINT `fk_T_Cliente_Internet_Dispositivos1` FOREIGN KEY (`Equipo_Instalado`) REFERENCES `t_dispositivos` (`Id_Dispositivos`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Cliente_Internet_T_Plan_Internet1` FOREIGN KEY (`Plan`) REFERENCES `t_plan_internet` (`Id_Plan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Cliente_Internet_T_Routers1` FOREIGN KEY (`Router`) REFERENCES `t_routers` (`Id_Router`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Cliente_Internet_T_Sectores1` FOREIGN KEY (`Sector`) REFERENCES `t_sectores` (`idT_Sectores`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Cliente_Servicio_T_Persona1` FOREIGN KEY (`Cliente`) REFERENCES `t_persona` (`Id_Persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
CREATE TABLE `t_cliente_ticket` (
  `id_cliente_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `cliente` int(11) NOT NULL,
  `ticket` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente_ticket`),
  KEY `fk_cliente` (`cliente`),
  KEY `fk_ticket_cliente` (`ticket`) USING BTREE,
  CONSTRAINT `fk_cliente` FOREIGN KEY (`cliente`) REFERENCES `t_persona` (`Id_Persona`),
  CONSTRAINT `fk_ticket` FOREIGN KEY (`ticket`) REFERENCES `t_tickets` (`id_ticket`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
CREATE TABLE `t_detalles` (
  `Id_Detalles` int(11) NOT NULL AUTO_INCREMENT,
  `Fk_Producto` int(11) NOT NULL,
  `Fk_Venta` int(11) NOT NULL,
  `Cantidad_Producto` int(11) NOT NULL,
  PRIMARY KEY (`Id_Detalles`),
  KEY `fk_T_Producto_has_T_Venta_T_Venta1_idx` (`Fk_Venta`),
  KEY `fk_T_Producto_has_T_Venta_T_Producto1_idx` (`Fk_Producto`),
  CONSTRAINT `fk_T_Producto_has_T_Venta_T_Producto1` FOREIGN KEY (`Fk_Producto`) REFERENCES `t_producto` (`Id_Producto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Producto_has_T_Venta_T_Venta1` FOREIGN KEY (`Fk_Venta`) REFERENCES `t_venta` (`Id_Venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `t_direccion` (
  `Id_Direccion` int(11) NOT NULL AUTO_INCREMENT,
  `Codigo_Postal` int(11) NOT NULL,
  `Calle` varchar(45) NOT NULL,
  `Numero_Exterior` varchar(10) NOT NULL,
  `Numero_Interior` varchar(10) DEFAULT NULL,
  `Estado` varchar(45) DEFAULT NULL,
  `Colonia` varchar(45) NOT NULL,
  `Municipio` varchar(45) DEFAULT NULL,
  `Fk_persona` int(11) NOT NULL,
  PRIMARY KEY (`Id_Direccion`),
  KEY `fk_t_direccion_t_persona1_idx` (`Fk_persona`),
  CONSTRAINT `fk_t_direccion_t_persona1` FOREIGN KEY (`Fk_persona`) REFERENCES `t_persona` (`Id_Persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
CREATE TABLE `t_dispositivos` (
  `Id_Dispositivos` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Modelo` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_Dispositivos`),
  UNIQUE KEY `Id_Dispositivos_UNIQUE` (`Id_Dispositivos`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
CREATE TABLE `t_encargado_ticket` (
  `id_encargado_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `encargado` int(11) NOT NULL,
  `ticket` int(11) NOT NULL,
  PRIMARY KEY (`id_encargado_ticket`),
  KEY `fk_encargado` (`encargado`),
  KEY `fk_ticket_encargado` (`ticket`),
  CONSTRAINT `fk_encargado` FOREIGN KEY (`encargado`) REFERENCES `t_persona` (`Id_Persona`),
  CONSTRAINT `fk_ticket_encargado` FOREIGN KEY (`ticket`) REFERENCES `t_tickets` (`id_ticket`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
CREATE TABLE `t_factura` (
  `Id_Factura` int(11) NOT NULL AUTO_INCREMENT,
  `Fecha_Factura` date NOT NULL,
  `Monto_Factura` float NOT NULL,
  `Rfc` varchar(45) NOT NULL,
  `Fk_Venta` int(11) NOT NULL,
  PRIMARY KEY (`Id_Factura`),
  KEY `fk_T_Factura_compra1_idx` (`Fk_Venta`),
  CONSTRAINT `fk_T_Factura_compra1` FOREIGN KEY (`Fk_Venta`) REFERENCES `t_venta` (`Id_Venta`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `t_persona` (
  `Id_Persona` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(40) NOT NULL,
  `Ap_Paterno` varchar(45) NOT NULL,
  `Ap_Materno` varchar(45) NOT NULL,
  `Telefono` varchar(12) NOT NULL,
  PRIMARY KEY (`Id_Persona`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
CREATE TABLE `t_plan_internet` (
  `Id_Plan` int(11) NOT NULL AUTO_INCREMENT,
  `NombrePlan` varchar(45) NOT NULL,
  `MBPS_Bajada` varchar(45) NOT NULL,
  `MBPS_Subida` varchar(45) NOT NULL,
  `Costo` float NOT NULL,
  `Fecha_Creacion` date DEFAULT NULL,
  PRIMARY KEY (`Id_Plan`),
  UNIQUE KEY `idT_Planes_UNIQUE` (`Id_Plan`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
CREATE TABLE `t_producto` (
  `Id_Producto` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(50) NOT NULL,
  `Precio` float NOT NULL,
  `Descripcion` varchar(70) NOT NULL,
  `Tiempo_Garantia` varchar(30) DEFAULT NULL,
  `Fk_Categoria` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Id_Producto`),
  KEY `fk_T_Producto_T_Categoria1_idx` (`Fk_Categoria`),
  CONSTRAINT `fk_T_Producto_T_Categoria1` FOREIGN KEY (`Fk_Categoria`) REFERENCES `t_categoria` (`Id_Categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;
CREATE TABLE `t_proveedor` (
  `Id_Proveedor` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Telefono` varchar(12) NOT NULL,
  `Rfc` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`Id_Proveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `t_router_planes` (
  `Plan` int(11) NOT NULL,
  `Router` int(11) NOT NULL,
  PRIMARY KEY (`Plan`,`Router`),
  KEY `fk_T_Plan_Internet_has_T_Routers_T_Routers1_idx` (`Router`),
  KEY `fk_T_Plan_Internet_has_T_Routers_T_Plan_Internet1_idx` (`Plan`),
  CONSTRAINT `fk_T_Plan_Internet_has_T_Routers_T_Plan_Internet1` FOREIGN KEY (`Plan`) REFERENCES `t_plan_internet` (`Id_Plan`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_T_Plan_Internet_has_T_Routers_T_Routers1` FOREIGN KEY (`Router`) REFERENCES `t_routers` (`Id_Router`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `t_routers` (
  `Id_Router` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Ip_Dns` varchar(60) NOT NULL,
  `Nombre_Usuario` varchar(45) NOT NULL,
  `Llave` varchar(45) DEFAULT NULL,
  `Ubicacion` varchar(70) DEFAULT NULL,
  PRIMARY KEY (`Id_Router`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
CREATE TABLE `t_sectores` (
  `idT_Sectores` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre` varchar(45) NOT NULL,
  `Torre` int(11) NOT NULL,
  PRIMARY KEY (`idT_Sectores`),
  KEY `fk_T_Sectores_T_Torres1_idx` (`Torre`),
  CONSTRAINT `fk_T_Sectores_T_Torres1` FOREIGN KEY (`Torre`) REFERENCES `t_torres` (`Id_Torre`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;
CREATE TABLE `t_tickets` (
  `id_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `asunto_ticket` int(11) NOT NULL,
  `descripcion_ticket` varchar(200) NOT NULL,
  `fecha_emision` varchar(20) NOT NULL,
  `fecha_validez` varchar(20) NOT NULL,
  `estado_ticket` varchar(20) DEFAULT NULL,
  `prioridad_ticket` varchar(20) DEFAULT NULL,
  `atencion_programada` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_ticket`),
  KEY `fk_asunto` (`asunto_ticket`),
  CONSTRAINT `fk_asunto` FOREIGN KEY (`asunto_ticket`) REFERENCES `t_asuntos` (`id_asunto`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
CREATE TABLE `t_torres` (
  `Id_Torre` int(11) NOT NULL AUTO_INCREMENT,
  `Nombre_Torre` varchar(45) NOT NULL,
  PRIMARY KEY (`Id_Torre`),
  UNIQUE KEY `idT_Zonas_UNIQUE` (`Id_Torre`),
  UNIQUE KEY `NombreZona_UNIQUE` (`Nombre_Torre`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
CREATE TABLE `t_users` (
  `Username` varchar(40) NOT NULL,
  `Password` varchar(70) NOT NULL,
  `E_Mail` varchar(40) NOT NULL,
  `Fk_persona` int(11) NOT NULL,
  PRIMARY KEY (`Username`),
  UNIQUE KEY `usuario_UNIQUE` (`Username`),
  UNIQUE KEY `E_Mail_UNIQUE` (`E_Mail`),
  KEY `fk_t_users_t_persona1_idx` (`Fk_persona`),
  CONSTRAINT `fk_t_users_t_persona1` FOREIGN KEY (`Fk_persona`) REFERENCES `t_persona` (`Id_Persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `t_venta` (
  `Id_Venta` int(11) NOT NULL AUTO_INCREMENT,
  `Monto_Venta` float NOT NULL,
  `Fecha_Venta` date NOT NULL,
  `Forma_Pago` varchar(45) NOT NULL,
  `Fk_Persona` int(11) NOT NULL,
  PRIMARY KEY (`Id_Venta`),
  KEY `id_personaFK_idx` (`Fk_Persona`),
  CONSTRAINT `id_personaFK` FOREIGN KEY (`Fk_Persona`) REFERENCES `t_persona` (`Id_Persona`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `user_roles` (
  `Id_Rol` int(11) NOT NULL AUTO_INCREMENT,
  `Rol` varchar(30) NOT NULL,
  `Username` varchar(40) NOT NULL,
  PRIMARY KEY (`Id_Rol`),
  UNIQUE KEY `idTipo_De_Persona_UNIQUE` (`Id_Rol`),
  KEY `fk_T_Rol_T_Users1_idx` (`Username`),
  CONSTRAINT `fk_T_Rol_T_Users1` FOREIGN KEY (`Username`) REFERENCES `t_users` (`Username`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
BEGIN;
LOCK TABLES `mwmdbfinal`.`desinstalaciones` WRITE;
DELETE FROM `mwmdbfinal`.`desinstalaciones`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`r_pedido` WRITE;
DELETE FROM `mwmdbfinal`.`r_pedido`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_asuntos` WRITE;
DELETE FROM `mwmdbfinal`.`t_asuntos`;
INSERT INTO `mwmdbfinal`.`t_asuntos` (`id_asunto`,`ide`,`nombre`,`descripcion`) VALUES (1, 'PR', 'Problemas de red', NULL),(2, 'Equipo', 'Problemas con equipos', 'aplica cuando un equipo salio defectoo'),(4, 'PCE', 'Problemas con equipos', 'Cuando un equipo resulta defectuoso'),(5, 'ej', 'Ejemplo', 'esto es un ejemplo');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_categoria` WRITE;
DELETE FROM `mwmdbfinal`.`t_categoria`;
INSERT INTO `mwmdbfinal`.`t_categoria` (`Id_Categoria`,`Nombre`,`Descripcion`) VALUES (1, 'router', 'routers');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_cliente_servicio` WRITE;
DELETE FROM `mwmdbfinal`.`t_cliente_servicio`;
INSERT INTO `mwmdbfinal`.`t_cliente_servicio` (`Id_Cliente_Servicio`,`Cliente`,`id_Mk`,`Sector`,`Ip`,`Fecha_Instalacion`,`Equipo_Instalado`,`Primer_Pago`,`Plan`,`Dia_Cobro`,`Ubicacion`,`Router`) VALUES (2, 2, '*5', 5, '172.2.3.2', '2017-12-26', 1, '2018-01-30', 2, '3', 'Teotitlan', 16),(3, 1, '*3', 7, '172.23.2.1', '2018-01-01', 8, '2018-02-01', 1, '2', 'huatulco', 14),(4, 6, NULL, 5, '192.168.3.4', '2018-01-10', 2, '2018-01-02', 2, '2', 'alla', 16),(5, 12, '*7', 11, '192.167.12.5', '2018-01-11', 4, '2018-01-24', 2, '5', '15.772210, -96.138446', 16),(6, 13, '*8', 7, '192.168.1.2', '2018-01-10', 4, '2018-01-24', 2, '5', 'alla', 16),(7, 14, '*9', 2, '172.12.2.3', '2018-01-12', 3, '2018-01-24', 2, '5', '90.3333 57.234', 14),(8, 15, '*2', 16, '172.12.3.2', '2018-01-21', 6, '2018-02-21', 1, '5', '90.3333 56.232', 17);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_cliente_ticket` WRITE;
DELETE FROM `mwmdbfinal`.`t_cliente_ticket`;
INSERT INTO `mwmdbfinal`.`t_cliente_ticket` (`id_cliente_ticket`,`cliente`,`ticket`) VALUES (1, 14, 1),(2, 15, 2);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_detalles` WRITE;
DELETE FROM `mwmdbfinal`.`t_detalles`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_direccion` WRITE;
DELETE FROM `mwmdbfinal`.`t_direccion`;
INSERT INTO `mwmdbfinal`.`t_direccion` (`Id_Direccion`,`Codigo_Postal`,`Calle`,`Numero_Exterior`,`Numero_Interior`,`Estado`,`Colonia`,`Municipio`,`Fk_persona`) VALUES (1, 70980, 'Tlaxiaco', '90', 'N/A', 'Oaxaca', 'Fracc. El Crucero', 'Sta. Ma. Huatulco', 1),(2, 56754, 'Pino Suarez', '2', '3', 'Oaxaca', 'Teotitlan del Valle', 'Tlacolula', 2),(3, 70980, 'tlaxiaco', '12', NULL, 'Oaxaca', 'fraccionamiento el crucero', 'Sta. MarÃ­a Huatulco', 1),(4, 70980, 'tamiahua', '3', NULL, 'Oaxaca', 'Sectort U2', 'Sta. Ma. Huatulco', 12),(5, 7090, 'jwrjweoi', '12', NULL, 'Oaxaca', 'djkldjal', 'santa maria', 13),(6, 70980, 'tlaxiaco', '2', NULL, 'Oaxaca', 'Sector T', 'Santa maria Huatulco', 14),(7, 70985, 'Tamiahua', '1', NULL, 'Oaxaca', 'Sector  U2', 'Santa maria Huatulco', 15);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_dispositivos` WRITE;
DELETE FROM `mwmdbfinal`.`t_dispositivos`;
INSERT INTO `mwmdbfinal`.`t_dispositivos` (`Id_Dispositivos`,`Nombre`,`Modelo`) VALUES (1, 'PBEM5300', 'HG532C'),(2, 'NBEM516', 'VRV8019AN22'),(3, 'PBEMM5300', 'TG788VN'),(4, 'NBEN516', 'TG788VN'),(5, 'PBEM5300', 'HG8245H'),(6, 'NBEM516', 'HG845H'),(7, 'NBEM519', 'VRV7006AW22'),(8, 'NBEM519', 'HG8245H'),(9, 'NBEM519', 'VRV7019AW22');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_encargado_ticket` WRITE;
DELETE FROM `mwmdbfinal`.`t_encargado_ticket`;
INSERT INTO `mwmdbfinal`.`t_encargado_ticket` (`id_encargado_ticket`,`encargado`,`ticket`) VALUES (1, 17, 1),(2, 17, 2);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_factura` WRITE;
DELETE FROM `mwmdbfinal`.`t_factura`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_persona` WRITE;
DELETE FROM `mwmdbfinal`.`t_persona`;
INSERT INTO `mwmdbfinal`.`t_persona` (`Id_Persona`,`Nombre`,`Ap_Paterno`,`Ap_Materno`,`Telefono`) VALUES (1, 'jose', 'aquino', 'lopez', '9581288031'),(2, 'rosalba', 'lazo', 'sosa', '9512172175'),(4, 'vanessa joselin', 'martinez', 'aquino', '9581117823'),(5, 'Jeff', 'Hardy', 'Aquino', '9581288031'),(6, 'Bizzmark', 'Pantaleon', 'askls', '103913'),(7, 'Albitha', 'Lazo', 'Sosa', '9512172175'),(8, 'Juan', 'pErez', 'de la o', '958742421'),(12, 'jesus', 'ortiz', 'lopez', '9581288031'),(13, 'jose', 'alfredo', 'aquino', '12345346'),(14, 'usuariox', 'martines', 'lopez', '9521288031'),(15, 'usuarioY', 'sosa', 'Ramirez', '9521288033'),(16, 'admin1', 'prueba', 'prueba', '9581105432'),(17, 'tecnico1', 'prueba', 'prueba', '9581043456');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_plan_internet` WRITE;
DELETE FROM `mwmdbfinal`.`t_plan_internet`;
INSERT INTO `mwmdbfinal`.`t_plan_internet` (`Id_Plan`,`NombrePlan`,`MBPS_Bajada`,`MBPS_Subida`,`Costo`,`Fecha_Creacion`) VALUES (1, 'RES-5MBPS', '5MB', '2MB', 200, '2017-12-30'),(2, 'RES-10MBPS', '10MB', '5MB', 400, '2017-12-30');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_producto` WRITE;
DELETE FROM `mwmdbfinal`.`t_producto`;
INSERT INTO `mwmdbfinal`.`t_producto` (`Id_Producto`,`Nombre`,`Precio`,`Descripcion`,`Tiempo_Garantia`,`Fk_Categoria`) VALUES (6, 'HapLiteMini', 800, 'Router mini', '1 año', 1),(7, 'NAno Station', 950, 'Antena', '8 meses', 1);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_proveedor` WRITE;
DELETE FROM `mwmdbfinal`.`t_proveedor`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_router_planes` WRITE;
DELETE FROM `mwmdbfinal`.`t_router_planes`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_routers` WRITE;
DELETE FROM `mwmdbfinal`.`t_routers`;
INSERT INTO `mwmdbfinal`.`t_routers` (`Id_Router`,`Nombre`,`Ip_Dns`,`Nombre_Usuario`,`Llave`,`Ubicacion`) VALUES (14, 'RB-ADMIN1', '10.1.1.1', 'admin', '', 'Huatulco'),(15, 'MWM', 'mercadowispmexico.dyndns.org', 'sistema', 'isc2017', 'los mochis'),(16, 'RB-ADMIN2', '10.1.3.1', 'admin', '', 'Santa Ma.Huatulco'),(17, 'RB-Admin3', '10.1.2.4', 'admin', '', 'lat 11.232 long 34.121');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_sectores` WRITE;
DELETE FROM `mwmdbfinal`.`t_sectores`;
INSERT INTO `mwmdbfinal`.`t_sectores` (`idT_Sectores`,`Nombre`,`Torre`) VALUES (1, 'URBIVILLA', 1),(2, 'PRESIDIO', 1),(3, 'POSEIDON', 1),(4, '5 DE MAYO', 1),(5, 'FERRUSQUILLA', 1),(6, '10 DE MAYO', 2),(7, 'ROSALES', 2),(8, 'AGRARIO', 2),(9, 'PASADENA', 3),(10, 'TOPOLOBAMPO', 3),(11, 'CENTENARIO', 3),(12, 'VIÑEDOS SIMETRICO', 4),(13, 'VIÑEDOS', 4),(14, 'VIÑEDOS AC', 4),(15, 'BELISARIO 1', 4),(16, 'BELIZARIO 2', 4),(17, 'BELIZARIO 3', 4),(18, 'ALAMOS COUNTRY', 4),(19, 'CEDROS', 4),(20, 'SENDERO', 4),(21, 'SEMINA', 4),(22, 'BIODIFUSION', 4),(23, 'FIERRO Y LAMINILLA', 4),(24, 'LAS PANGUITAS', 4),(25, 'INDUSTRIAL', 4),(26, '5 DE MAYO', 4),(27, 'prueba1', 2),(28, 'prueba2', 3),(29, 'Prueba3', 3),(30, 'prueba4', 3),(31, 'prueba6', 4),(32, 'prueba7', 2),(33, 'prueba8', 1),(34, 'HUATuLCO', 4),(35, 'Pochutla', 2),(36, 'pueba2', 1),(37, 'Huatulco', 4);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_tickets` WRITE;
DELETE FROM `mwmdbfinal`.`t_tickets`;
INSERT INTO `mwmdbfinal`.`t_tickets` (`id_ticket`,`asunto_ticket`,`descripcion_ticket`,`fecha_emision`,`fecha_validez`,`estado_ticket`,`prioridad_ticket`,`atencion_programada`) VALUES (1, 1, 'No identifica la red', '27/02/2018', '27/03/2018', 'nuevo', 'baja', 'SIN FECHA'),(2, 2, 'El router no enciende', '27/02/2018', '27/03/2018', 'abierto', 'alta', 'SIN FECHA');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_torres` WRITE;
DELETE FROM `mwmdbfinal`.`t_torres`;
INSERT INTO `mwmdbfinal`.`t_torres` (`Id_Torre`,`Nombre_Torre`) VALUES (3, 'CANTERAS'),(2, 'MACAPULE'),(4, 'MEMORIA'),(1, 'OFICINA');
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_users` WRITE;
DELETE FROM `mwmdbfinal`.`t_users`;
INSERT INTO `mwmdbfinal`.`t_users` (`Username`,`Password`,`E_Mail`,`Fk_persona`) VALUES ('admin1', '123', 'admin1@gmail.com', 16),('cliente14', '123', 'cliente14@gmail.com', 14),('tecnico1', '123', 'tecnico1@gmail.com', 17);
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`t_venta` WRITE;
DELETE FROM `mwmdbfinal`.`t_venta`;
UNLOCK TABLES;
COMMIT;
BEGIN;
LOCK TABLES `mwmdbfinal`.`user_roles` WRITE;
DELETE FROM `mwmdbfinal`.`user_roles`;
INSERT INTO `mwmdbfinal`.`user_roles` (`Id_Rol`,`Rol`,`Username`) VALUES (1, 'cliente', 'cliente14'),(2, 'administrador', 'admin1'),(3, 'Tecnico', 'tecnico1');
UNLOCK TABLES;
COMMIT;
