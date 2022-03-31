-- Creacion y puesta en uso de la DB
CREATE SCHEMA IF NOT EXISTS LIBRERIA;
USE LIBRERIA;

/*
Las tablas a usar son las definidas en el documento principal, estas son
- Tabla cliente
- Tabla libro
- Tabla vendedor
- Tabla prestamo
- Tabla venta

*/

CREATE TABLE IF NOT EXISTS cliente(
	cliente_id INT  NOT NULL,
	cliente_nombre VARCHAR(50)  NOT NULL,
	cliente_apellido VARCHAR(50)  NOT NULL,
	cliente_direccion VARCHAR(20)  NOT NULL,
	PRIMARY KEY(cliente_id)
);

CREATE TABLE IF NOT EXISTS vendedor(
	vendedor_id INT  NOT NULL,
	vendedor_nombre VARCHAR(50)  NOT NULL,
	vendedor_apellido VARCHAR(50)  NOT NULL,
	vendedor_ci INT  NOT NULL,
	PRIMARY KEY(vendedor_id)
);

CREATE TABLE IF NOT EXISTS libro(
	libro_id INT  NOT NULL,
	libro_titulo VARCHAR(50)  NOT NULL,
	libro_autor VARCHAR(50)  NOT NULL,
	libro_cantidad INT  NOT NULL,
    libro_precio INT  NOT NULL,
	PRIMARY KEY(libro_id)
);

CREATE TABLE IF NOT EXISTS prestamo(
	prestamo_id INT  NOT NULL,
    prestamo_fecha DATE NOT NULL,
    prestamo_fecha_devolucion DATE NOT NULL,
    prestamo_fecha_maxima DATE NOT NULL,
    libro_id INT  NOT NULL,
    cliente_id INT  NOT NULL,
	-- KEY `fk_prestamo_id_libro` (`libro_id`),
    constraint `fk_prestamo_libro_id` FOREIGN KEY (`libro_id`) REFERENCES `libro`(`libro_id`),
     constraint `fk_prestamo_cliente_id` FOREIGN KEY (`cliente_id`) REFERENCES `cliente`(`cliente_id`),
	PRIMARY KEY(prestamo_id)
);

CREATE TABLE IF NOT EXISTS venta(
	venta_id INT  NOT NULL,
    venta_fecha DATE NOT NULL,
    venta_monto INT  NOT NULL,
    vendedor_id INT  NOT NULL,
    libro_id INT  NOT NULL,
    constraint `fk_venta_libro_id` FOREIGN KEY (`libro_id`) REFERENCES `libro`(`libro_id`),
	constraint `fk_venta_vendedor_id` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedor`(`vendedor_id`),
	PRIMARY KEY(venta_id)
);
