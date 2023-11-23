USE `supermercado` ;

# Insertar registros en la tabla "direcciones"
INSERT INTO direcciones (idDireccion, calle, altura, barrio, piso, departamento, codigoPostal, provincia, ciudad)
VALUES
	(1,'Catamarca',1230,'Balvanera','1','B','1203','Buenos Aires','CABA'),
	(2,'Catamarca',1232,'Balvanera','2','B','1203','Buenos Aires','CABA'),
	(3,'Catamarca',1234,'Balvanera','3','B','1203','Buenos Aires','CABA'),
	(4,'Venezuela',1124,'Balvanera','2','1','1223','Buenos Aires','CABA'),
	(5,'Venezuela',1133,'Balvanera','3','5','1223','Buenos Aires','CABA'),
	(6,'Venezuela',1135,'Balvanera','2','4','1223','Buenos Aires','CABA'),
	(7,'Av. Jujuy',130,'Balvanera','PB','A','1123','Buenos Aires','CABA'),
	(8,'Av. Jujuy',132,'Balvanera','PB','C','1123','Buenos Aires','CABA'),
	(10,'Av. Jujuy',210,'Balvanera','1','A','1123','Buenos Aires','CABA'),
	(11,'Av. Belgrano',2910,'Balvanera','4','D','1293','Buenos Aires','CABA'),
	(12,'Av. Rivadavia', 3010,'Balvanera','5','C','1203','Buenos Aires','CABA'),
	(13,'Av. Rivadavia', 6010,'Flores',NULL,NULL,'1203','Buenos Aires','CABA'),
	(14,'Av. Rivadavia', 6110,'Flores',NULL,NULL,'1203','Buenos Aires','CABA'),
	(15,'Alberti',230,'Balvanera','1', NULL, '1223','Buenos Aires','CABA'),
	(16,'Hipolito Yrigoyen',2530,'Balvanera','3','B','1223','Buenos Aires','CABA'),
	(17,'Paso',430,'Balvanera','2','D','1283','Buenos Aires','CABA'),
	(18,'Larrea',1330,'Recoleta','10','C','1403','Buenos Aires','CABA'),
	(19,'Av. Santa Fe',3230,'Recoleta','3','B','1413','Buenos Aires','CABA'),
	(20,'Av. Pueyrredon',1230,'Recoleta','5','A','1433','Buenos Aires','CABA'),
	(21,'Av. Santa Fe',3130,'Recoleta',NULL,NULL,'1413','Buenos Aires','CABA'),
	(22,'Av. Pueyrredon',1030,'Recoleta',NULL,NULL,'1433','Buenos Aires','CABA');
	
	
# Insertar registros en la tabla "categorias"
INSERT INTO categorias (idCategoria, nombre)
VALUES
	(1, 'Gaseosas'),
	(2, 'Almacen'),
	(3, 'Carnes'),
	(4, 'Limpieza'),
	(5, 'Congelados');

# Insertar registros en la tabla "formasDePago"
INSERT INTO formasdepago (idFormaDePago, nombre)
VALUES 
	(1,'DEBITO'),
	(2,'CREDITO'),
	(3,'EFECTIVO');

# Insertar registros en la tabla "sucursales"
INSERT INTO sucursales (idSucursal, nombre, idDireccion)
VALUES 
	(1,'SUCURSAL 012 Pueyrredon',22),
	(2,'SUCURSAL 020 Rivadavia',13);

# Insertar registros en la tabla "proveedores"
INSERT INTO proveedores (idProveedor, razonSocial, telefono, idDireccion)
VALUES 
	(1, 'Distribuidora Laos S.A','1131022233', 21),
	(2, 'Distribuidora Patos', '1122002341', 14);

# Insertar registros en la tabla "personas"
INSERT INTO personas (idPersona, dni , nombre, apellido, telefono, email, fecNacimiento, idDireccion)
VALUES 
	(1, 30128823, 'Emmye', 'Ziemecki', '6406598880', 'eziemecki0@networkadvertising.org', '1992-02-01', 1),
	(2, 89221122, 'Dorothee', 'Biss', '4871968192', 'dbiss1@va.gov', '1989-08-23', 2),
	(3, 65321123, 'Michele', 'Tribe', '3104491924', 'mtribe2@quantcast.com', '1987-02-29', 3),
	(4, 34133121, 'Faun', 'Gatus', '5062992677', 'fgatus3@purevolume.com', '1992-03-04', 4),
	(5, 76232123, 'Cassi', 'Cosford', '5449335417', 'ccosford4@berkeley.edu', '1990-10-23', 5),
	(6, 88734124, 'Aylmar', 'Luckham', '5036653480', 'aluckham5@who.int', '1982-11-23', 6),
	(7, 90731314, 'Colleen', 'Baily', '9977946959', 'cbaily6@rediff.com', '1983-04-30', 7),
	(8, 91831223, 'Marlie', 'Cullon', '6856227951', 'mcullon7@moonfruit.com', '1995-10-23', 8),
	(9, 92012334, 'Willi', 'Junes', '8283211897', 'wjunes8@wufoo.com', '1971-03-31', 9),
	(10, 31002322, 'Naoma', 'Meachen', '5511378620', 'nmeachen9@liveinternet.ru', '1971-03-31', 10),
	(11, 32442311, 'Mia', 'Scarborough', '2963738851', 'mscarborougha@studiopress.com', '1974-03-31', 11),
	(12, 43002122,'Christopher', 'Olivo', '7898942711', 'colivob@indiegogo.com','1971-01-11', 12),
	(13, 44991234, 'Davin', 'Zecchinii', '3232784498', 'dzecchiniic@about.com','1971-02-12', 15),
	(14, 12322555, 'Andros', 'Foyston', '1878039818', 'afoystond@spotify.com','1971-09-23', 16),
	(15, 45231122, 'Yardley', 'Dargue', '4431498750', 'ydarguee@vimeo.com','1971-12-31', 17);

# Insertar registros en la tabla "clientes"
INSERT INTO clientes (idCliente, fecAlta, fecUltimaCompra, idPersona)
VALUES 
	(1, '2023-01-23','2023-06-12', 1),
	(2, '2023-04-15','2023-10-22',2);

# Insertar registros en la tabla "empleados"
INSERT INTO empleados (idEmpleado, cargo, salario, idPersona, idSucursal)
VALUES 
	(1, 'Cajero', 165000.00, 3, 1),
	(2, 'Repositor', 155000.00, 4, 1),
	(3, 'Cajero', 165000.00, 5, 2),
	(4, 'Repositor', 155000.00, 6, 2);
	
# Insertar registros en la tabla "productos"
INSERT INTO productos(idProducto, nombre, fecVencimiento, precioUnitario, idProveedor, idCategoria)
VALUES
	(1, 'Coca Cola 2.25 lts', '2024-02-02', 2300.00, 1, 1),
	(2, 'Galletas Oreo Pack x3', '2024-03-12', 1392.95, 2, 2);

# Insertar registros en la tabla "facturas"
INSERT INTO facturas(idFactura, fecFacturacion, precioTotal, idCliente, idEmpleado, idFormaDePago)
VALUES
	(1, '2023-11-23', 8778.85, 2, 1, 1);

# Insertar registros en la tabla "detallesFactura"direcciones
INSERT INTO detallesfactura(idDetalleFactura, cantidad, precioSubtotal, idProducto, idFactura)
VALUES 
	(1, 2, 4600.00, 1, 1),
	(2, 3, 4178.85, 2, 1);