create database libreriaSedah;
use libreriaSedah;

CREATE TABLE `categoria` (
  `idCategoria` int NOT NULL AUTO_INCREMENT,
  `nombreCategoria` varchar(45) NOT NULL,
  PRIMARY KEY (`idCategoria`)
) ENGINE=InnoDB;

CREATE TABLE `imagen` (
  `idImagen` int NOT NULL AUTO_INCREMENT,
  `direccion` varchar(300) NOT NULL,
  PRIMARY KEY (`idImagen`)
) ENGINE=InnoDB;

CREATE TABLE `autor` (
  `idAutor` int NOT NULL AUTO_INCREMENT,
  `primerNombreAutor` varchar(45) NOT NULL,
  `segundoNombreAutor` varchar(45) DEFAULT NULL,
  `primerApellidoAutor` varchar(45) NOT NULL,
  `segundoApellidoAutor` varchar(45) DEFAULT NULL,
  `idImagen` int DEFAULT NULL,
  `fechaDeNacimiento` date DEFAULT NULL,
  PRIMARY KEY (`idAutor`),
  KEY `idImagen_idx` (`idImagen`),
  CONSTRAINT `idImagen` FOREIGN KEY (`idImagen`) REFERENCES `imagen` (`idImagen`)
) ENGINE=InnoDB;

 CREATE TABLE `editorial` (
  `idEditorial` int NOT NULL AUTO_INCREMENT,
  `nombreEditorial` varchar(45) NOT NULL,
  `direccion` varchar(250) NOT NULL,
  `telefono` varchar(13) NOT NULL,
  `email` varchar(70) NOT NULL,
  PRIMARY KEY (`idEditorial`)
) ENGINE=InnoDB;


CREATE TABLE `libro` (
  `idLibro` int NOT NULL AUTO_INCREMENT,
  `nombreLibro` varchar(45) NOT NULL,
  `descripcion` varchar(250) DEFAULT NULL,
  `edicion` varchar(20) DEFAULT NULL,
  `anio` int NOT NULL,
  `precio` float NOT NULL,
  `idEditorial` int NOT NULL,
  `idImagen` int DEFAULT NULL,
  `idAutor` int NOT NULL,
  `idCategoria` int NOT NULL,
  `existencia` int NOT NULL,  
  PRIMARY KEY (`idLibro`),
  KEY `idAutor_idx` (`idAutor`),
  KEY `idEditorial_idx` (`idEditorial`),
  KEY `idImagen_idx` (`idImagen`),
  KEY `idCategoria_idx` (`idCategoria`),
  CONSTRAINT `libro_ibfk_1` FOREIGN KEY (`idImagen`) REFERENCES `imagen` (`idImagen`),
  CONSTRAINT `libro_ibfk_2` FOREIGN KEY (`idEditorial`) REFERENCES `editorial` (`idEditorial`),
  CONSTRAINT `libro_ibfk_3` FOREIGN KEY (`idAutor`) REFERENCES `autor` (`idAutor`),
  CONSTRAINT `libro_ibfk_4` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`)
) ENGINE=InnoDB;

CREATE TABLE `funciones` (
  `fncod` varchar(255) NOT NULL,
  `fndsc` varchar(45) DEFAULT NULL,
  `fnest` char(3) DEFAULT NULL,
  `fntyp` char(3) DEFAULT NULL,
  PRIMARY KEY (`fncod`)
) ENGINE=InnoDB;

CREATE TABLE `roles` (
  `rolescod` varchar(15) NOT NULL,
  `rolesdsc` varchar(45) DEFAULT NULL,
  `rolesest` char(3) DEFAULT NULL,
  PRIMARY KEY (`rolescod`)
) ENGINE=InnoDB;

  CREATE TABLE `funciones_roles` (
  `rolescod` varchar(15) NOT NULL,
  `fncod` varchar(255) NOT NULL,
  `fnrolest` char(3) DEFAULT NULL,
  `fnexp` datetime DEFAULT NULL,
  PRIMARY KEY (`rolescod`,`fncod`),
  KEY `rol_funcion_key_idx` (`fncod`),
  CONSTRAINT `funcion_rol_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`),
  CONSTRAINT `rol_funcion_key` FOREIGN KEY (`fncod`) REFERENCES `funciones` (`fncod`)
) ENGINE=InnoDB;

CREATE TABLE `usuario` (
  `usercod` bigint NOT NULL AUTO_INCREMENT,
  `useremail` varchar(80) DEFAULT NULL,
  `username` varchar(80) DEFAULT NULL,
  `userpswd` varchar(128) DEFAULT NULL,
  `userfching` datetime DEFAULT NULL,
  `userpswdest` char(3) DEFAULT NULL,
  `userpswdexp` datetime DEFAULT NULL,
  `userest` char(3) DEFAULT NULL,
  `useractcod` varchar(128) DEFAULT NULL,
  `userpswdchg` varchar(128) DEFAULT NULL,
  `usertipo` char(3) DEFAULT NULL COMMENT 'Tipo de Usuario, Normal, Consultor o Cliente',
  `token` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usercod`),
  UNIQUE KEY `useremail_UNIQUE` (`useremail`),
  KEY `usertipo` (`usertipo`,`useremail`,`usercod`,`userest`)
) ENGINE=InnoDB AUTO_INCREMENT=2;

CREATE TABLE `roles_usuarios` (
  `usercod` bigint NOT NULL,
  `rolescod` varchar(15) NOT NULL,
  `roleuserest` char(3) DEFAULT NULL,
  `roleuserfch` datetime DEFAULT NULL,
  `roleuserexp` datetime DEFAULT NULL,
  PRIMARY KEY (`usercod`,`rolescod`),
  KEY `rol_usuario_key_idx` (`rolescod`),
  CONSTRAINT `rol_usuario_key` FOREIGN KEY (`rolescod`) REFERENCES `roles` (`rolescod`),
  CONSTRAINT `usuario_rol_key` FOREIGN KEY (`usercod`) REFERENCES `usuario` (`usercod`)
) ENGINE=InnoDB;

CREATE TABLE `direccionentrega` (
  `iddireccionEntrega` INT NOT NULL AUTO_INCREMENT,
  `direccion` VARCHAR(450) NOT NULL,
  `departamento` VARCHAR(45) NOT NULL,
  `codigoPostal` VARCHAR(45) NOT NULL,
  `ciudad` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`iddireccionEntrega`));

CREATE TABLE `venta` (
  `idventa` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `usercod` BIGINT NOT NULL,
  `idDireccionEntrega` INT NOT NULL,
  `Total` FLOAT NOT NULL,
  PRIMARY KEY (`idventa`),
  INDEX `fk_idUsuario_idx` (`usercod` ASC) VISIBLE,
  INDEX `fk_direccionEntrega_idx` (`idDireccionEntrega` ASC) VISIBLE,
  CONSTRAINT `fk_UserCod`
    FOREIGN KEY (`usercod`)
    REFERENCES `libreriasedah`.`usuario` (`usercod`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_direccionEntrega`
    FOREIGN KEY (`idDireccionEntrega`)
    REFERENCES `libreriasedah`.`direccionentrega` (`iddireccionEntrega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
    
CREATE TABLE `detalle_venta` (
  `iddetalle_venta` INT NOT NULL AUTO_INCREMENT,
  `idVenta` INT NOT NULL,
  `idLibro` INT NOT NULL,
  `Cant` INT NOT NULL,
  `Precio` FLOAT NOT NULL,
  `SubTotal` FLOAT NOT NULL,
  PRIMARY KEY (`iddetalle_venta`),
  INDEX `fk_idVenta_idx` (`idVenta` ASC) VISIBLE,
  INDEX `fk_idLibro_idx` (`idLibro` ASC) VISIBLE,
  CONSTRAINT `fk_idVenta`
    FOREIGN KEY (`idVenta`)
    REFERENCES `libreriasedah`.`venta` (`idventa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idLibro`
    FOREIGN KEY (`idLibro`)
    REFERENCES `libreriasedah`.`libro` (`idLibro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);


CREATE TABLE `carrito_usuarios` (
  `id_sesion` VARCHAR(255) NOT NULL,
  `id_libro` INT NOT NULL,
  `cantidad` INT NOT NULL,
  PRIMARY KEY (`id_sesion`,`id_libro`),
  INDEX `fkId_libro_idx` (`id_libro` ASC) VISIBLE,
  CONSTRAINT `fkId_libro`
    FOREIGN KEY (`id_libro`)
    REFERENCES `libreriasedah`.`libro` (`idLibro`)
    ON DELETE CASCADE
    ON UPDATE CASCADE);

INSERT INTO `libreriaSedah`.`imagen` (`direccion`) VALUES ('https://images.unsplash.com/photo-1532032877540-0793b44545a2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80');
INSERT INTO `libreriaSedah`.`imagen` (`direccion`) VALUES ('https://images.unsplash.com/photo-1586945758247-8db5a6afee29?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=687&q=80');
INSERT INTO `libreriaSedah`.`imagen` (`direccion`) VALUES ('https://d2sofvawe08yqg.cloudfront.net/divingforhiddentreasures-spanish/s_hero?1658873224');
INSERT INTO `libreriaSedah`.`imagen` (`direccion`) VALUES ('https://d2sofvawe08yqg.cloudfront.net/howtodothingswithdata/s_hero?1635583722');
INSERT INTO `libreriaSedah`.`imagen` (`direccion`) VALUES ('https://d2sofvawe08yqg.cloudfront.net/d3-start-to-finish/s_hero?1656016213');

INSERT INTO `libreriaSedah`.`editorial` (`nombreEditorial`,`direccion`,`telefono`,`email`) VALUES ('Jonhana','EEUU','+5121532467','jonhana@gmail.com');

INSERT INTO `libreriaSedah`.`autor` (`primerNombreAutor`,`segundoNombreAutor`,`primerApellidoAutor`,`segundoApellidoAutor`,`idImagen`,`fechaDeNacimiento`) VALUES ('Samuel','Isaac','Oviedo','Sanchez',1,'2001-12-21');

INSERT INTO `libreriaSedah`.`categoria` (`nombreCategoria`) VALUES ('Ciencia ficción');
INSERT INTO `libreriaSedah`.`categoria` (`nombreCategoria`) VALUES ('Ciencias de la computación');

INSERT INTO `libreriaSedah`.`libro` (`nombreLibro`,`descripcion`,`edicion`,`anio`,`precio`,`idEditorial`,`idImagen`,`idAutor`,`idCategoria`, `existencia`) VALUES ('En busca de tesoros ocultos','Descubriendo el coste del retraso en el porfolio de proyectos','Primera',2020,20,1,3,1,1,10);
INSERT INTO `libreriaSedah`.`libro` (`nombreLibro`,`descripcion`,`edicion`,`anio`,`precio`,`idEditorial`,`idImagen`,`idAutor`,`idCategoria`, `existencia`) VALUES ('How to do things with data','Setting off towards the data-driven business','Primera',2021,50,1,4,1,1,10);
INSERT INTO `libreriaSedah`.`libro` (`nombreLibro`,`descripcion`,`edicion`,`anio`,`precio`,`idEditorial`,`idImagen`,`idAutor`,`idCategoria`, `existencia`) VALUES ('D3 Start to Finish','Learn how to make a custom data visualisation using D3.js.','Segunda',2019,35,1,5,1,2,10);


