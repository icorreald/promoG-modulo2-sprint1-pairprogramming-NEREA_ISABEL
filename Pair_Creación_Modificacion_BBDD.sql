 CREATE SCHEMA `tienda_zapatillas`;
 USE `tienda_zapatillas`;
 
 CREATE TABLE zapatillas (
	id_zapatillas INT AUTO_INCREMENT NOT NULL,
    modelo VARCHAR(45) NOT NULL,
    color VARCHAR(45) not null,
    PRIMARY KEY (id_zapatillas)
    );
    
CREATE TABLE clientes(
	id_clientes INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(45) NOT NULL,
    numero_telefono INT NOT NULL,
    direccion VARCHAR(45) NOT NULL,
    ciudad VARCHAR(45) NOT NULL,
    provincia VARCHAR(45) NOT NULL,
    pais VARCHAR(45) NOT NULL,
    codigo_postal VARCHAR(45) NOT NULL,
    PRIMARY KEY (id_clientes)
    );
    
CREATE TABLE empleados(
	id_empleados INT AUTO_INCREMENT NOT NULL,
    nombre VARCHAR(45) NOT NULL,
    tienda VARCHAR(45) NOT NULL,
    salario INT,
    fecha_incorporacion DATE NOT NULL,
    PRIMARY KEY (id_empleados)
    );
    
CREATE TABLE facturas(
	id_facturas INT AUTO_INCREMENT NOT NULL,
    numero_factura VARCHAR(45) NOT NULL,
    fecha DATE NOT NULL,
    id_zapatillas INT NOT NULL,
    id_empleados INT NOT NULL,
    id_clientes INT NOT NULL,
    
		PRIMARY KEY (id_facturas),
		CONSTRAINT fk_id_zapatillas
		FOREIGN KEY (id_zapatillas) 
		REFERENCES zapatillas(id_zapatillas),
        
        
        CONSTRAINT fk_id_clientes
		FOREIGN KEY (id_clientes) 
		REFERENCES clientes(id_clientes),
     
        
        CONSTRAINT fk_id_empleados
		FOREIGN KEY (id_empleados) 
		REFERENCES empleados(id_empleados)
        );
        
        USE tienda_zapatillas;
        
ALTER TABLE zapatillas
ADD COLUMN marca VARCHAR(45) NOT NULL, 
ADD COLUMN talla INT NOT NULL;

ALTER TABLE empleados
MODIFY COLUMN salario FLOAT; 

ALTER TABLE clientes
DROP COLUMN pais;

ALTER TABLE facturas
ADD COLUMN total FLOAT;

INSERT INTO zapatillas (modelo, color, marca, talla)
VALUES ("XQYUN", "negro", "nike", 42), 
("UOPMN", "rosa", "nike", 39), 
("OPNYT","verdes", "adidas", 35);

INSERT INTO empleados (nombre, tienda, salario, fecha_incorporacion)
VALUES ("Laura", "Alcobendas", 25987, '2010-09-03'), 
("Maria", "Sevilla", NULL, '2001-04-11'),
("Ester", "Oviedo", 30165.98, '2000-11-29');

-- En la tabla clientes no había definida una columna con los datos de los emails. La creamos ahora
ALTER TABLE clientes
ADD COLUMN email VARCHAR(255) NOT NULL;


INSERT INTO clientes (nombre, numero_telefono, email, direccion, ciudad, provincia, codigo_postal)
VALUES ("Monica", 1234567289, "monica@email.com", "Calle Felicidad", "Móstoles", "Madrid", 28176),
("Lorena", 289345678, "lorena@email.com", "Calle Alegria", "Barcelona", "Barcelona","12346"), 
("Carmen", 298463759, "carmen@email.com", "Calle del Color", "Vigo", "Pontevedra", 23456);

INSERT INTO facturas (numero_factura, fecha, id_zapatillas, id_empleados, id_clientes, total)
VALUES (123, '2001-12-11',	1,	2,	1,	54.98), 
(1234, '2005-05-23', 1, 1, 3, 89.91),
(12345, '2015-09-18', 2, 3, 3,	76.23);
 
UPDATE zapatillas
SET color = "amarillas"
WHERE color = "rosa";

UPDATE empleados
SET tienda = "A Coruña"
WHERE tienda = "Alcobendas";

UPDATE clientes
SET numero_telefono = 123456728
WHERE numero_telefono = 1234567289;

UPDATE facturas
SET total = 89.91
WHERE total = 76.23;
			
     

	