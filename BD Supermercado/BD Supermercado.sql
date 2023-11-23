CREATE SCHEMA IF NOT EXISTS `supermercado` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `supermercado` ;
SET FOREIGN_KEY_CHECKS=0;

-- -----------------------------------------------------
-- Table `supermercado`.`direcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`direcciones` (
  `idDireccion` INT(10) NOT NULL AUTO_INCREMENT,
  `calle` VARCHAR(20) NOT NULL,
  `altura` INT(6) NOT NULL,
  `barrio` VARCHAR(20) NOT NULL,
  `piso` VARCHAR(2) NULL,
  `departamento` VARCHAR(2) NULL,
  `codigoPostal` VARCHAR(8) NOT NULL,
  `provincia` VARCHAR(20) NOT NULL,
  `ciudad` VARCHAR(20) NOT NULL, 
  PRIMARY KEY (`idDireccion`))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `supermercado`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`categorias` (
  `idCategoria` INT(8) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL, 
  PRIMARY KEY (`idCategoria`))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `supermercado`.`formas_de_pago`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`formasDePago` (
  `idFormaDePago` INT(2) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(10) NOT NULL, 
  PRIMARY KEY (`idFormaDePago`))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `supermercado`.`sucursales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`sucursales` (
  `idSucursal` INT(3) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(20) NOT NULL, 
  `idDireccion` INT(10) NOT NULL UNIQUE,
  PRIMARY KEY (`idSucursal`),
  CONSTRAINT `fk_direccionSucursal` FOREIGN KEY (idDireccion)
  REFERENCES `supermercado`.`direcciones` (`idDireccion`))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `supermercado`.`proveedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`proveedores` (
  `idProveedor` INT(3) NOT NULL AUTO_INCREMENT,
  `razonSocial` VARCHAR(20) NOT NULL, 
  `telefono` VARCHAR(10) NULL,
  `idDireccion` INT(10) NOT NULL UNIQUE,
  PRIMARY KEY (`idProveedor`),
  CONSTRAINT `fk_direccionProveedor` FOREIGN KEY (idDireccion)
  REFERENCES `supermercado`.`direcciones` (`idDireccion`))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `supermercado`.`personas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`personas` (
  `idPersona` INT(10) NOT NULL AUTO_INCREMENT,
  `dni` INT(8) NOT NULL,
  `nombre` VARCHAR(20) NOT NULL, 
  `apellido` VARCHAR(20) NOT NULL,
  `telefono` VARCHAR(10) NULL,
  `email` VARCHAR(40) NULL,
  `fecNacimiento` DATE NOT NULL,
  `idDireccion` INT(10) NOT NULL UNIQUE,
  PRIMARY KEY (`idPersona`),
  CONSTRAINT `fk_direccionPersona` FOREIGN KEY (idDireccion)
  REFERENCES `supermercado`.`direcciones` (`idDireccion`))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `supermercado`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`clientes` (
  `idCliente` INT(8) NOT NULL AUTO_INCREMENT,
  `fecAlta` DATE NOT NULL, 
  `fecUltimaCompra` DATE NOT NULL,
  `idPersona` INT(10) NOT NULL UNIQUE,
  PRIMARY KEY (`idCliente`),
  CONSTRAINT `fk_personaCliente` FOREIGN KEY (idPersona)
  REFERENCES `supermercado`.`personas` (`idPersona`))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `supermercado`.`empleados`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`empleados` (
  `idEmpleado` INT(8) NOT NULL AUTO_INCREMENT,
  `cargo` VARCHAR(15) NOT NULL, 
  `salario` DECIMAL(10,2) NOT NULL,
  `idPersona` INT(10) NOT NULL UNIQUE,
  `idSucursal` INT(3) NOT NULL, 
  PRIMARY KEY (`idEmpleado`),
  CONSTRAINT `fk_personaEmpleado` FOREIGN KEY (idPersona)
  REFERENCES `supermercado`.`personas` (`idPersona`),
  CONSTRAINT `fk_sucursaEmpleado` FOREIGN KEY (idSucursal)
  REFERENCES `supermercado`.`sucursales` (`idSucursal`))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `supermercado`.`facturas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`facturas` (
  `idFactura` INT(8) NOT NULL AUTO_INCREMENT,
  `fecFacturacion` DATE NOT NULL, 
  `precioTotal` DECIMAL(10,2) NOT NULL,
  `idCliente` INT(8) NOT NULL,
  `idEmpleado` INT(8) NOT NULL,
  `idFormaDePago` INT(2) NOT NULL, 
  PRIMARY KEY (`idFactura`),
  CONSTRAINT `fk_clienteFactura` FOREIGN KEY (idCliente)
  REFERENCES `supermercado`.`clientes` (`idCliente`),
  CONSTRAINT `fk_empleadoFactura` FOREIGN KEY (idEmpleado)
  REFERENCES `supermercado`.`empleados` (`idEmpleado`),
  CONSTRAINT `fk_fdpagoFactura` FOREIGN KEY (idFormaDePago)
  REFERENCES `supermercado`.`formasDePago` (`idFormaDePago`))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `supermercado`.`productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`productos` (
  `idProducto` INT(8) NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(40) NOT NULL,
  `fecVencimiento` DATE NOT NULL, 
  `precioUnitario` DECIMAL(10,2) NOT NULL,
  `stock` INT(10) NOT NULL,
  `idProveedor` INT(8) NOT NULL,
  `idCategoria` INT(4) NOT NULL, 
  PRIMARY KEY (`idProducto`),
  CONSTRAINT `fk_proveedorProducto` FOREIGN KEY (idProveedor)
  REFERENCES `supermercado`.`proveedores` (`idProveedor`),
  CONSTRAINT `fk_categoriaProducto` FOREIGN KEY (idCategoria)
  REFERENCES `supermercado`.`categorias` (`idCategoria`))
ENGINE = INNODB;


-- -----------------------------------------------------
-- Table `supermercado`.`detallesFactura`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `supermercado`.`detallesFactura` (
  `idDetalleFactura` INT(8) NOT NULL AUTO_INCREMENT,
  `cantidad` INT(4) NOT NULL,
  `precioSubtotal` DECIMAL(10,2) NOT NULL, 
  `idFactura` INT(8) NOT NULL,
  `idProducto` INT(4) NOT NULL, 
  PRIMARY KEY (`idDetalleFactura`),
  CONSTRAINT `fk_facturaDetalle` FOREIGN KEY (idFactura)
  REFERENCES `supermercado`.`facturas` (`idFactura`),
  CONSTRAINT `fk_productoDetalle` FOREIGN KEY (idProducto)
  REFERENCES `supermercado`.`productos` (`idProducto`))
ENGINE = INNODB;

