-- Crear tablas

CREATE TABLE IF NOT EXISTS employees(
	id_employee INT,
	name VARCHAR(30),
	lastname VARCHAR(30),
	married BOOLEAN
);

-- Insertar datos, filas o registros

INSERT INTO employees(id_employee, name, lastname, married) 
	VALUES (1, 'Arturo', 'Prinston', FALSE);
INSERT INTO employees(id_employee, name, lastname, married) 
	VALUES (2, 'Clara', 'Rogers', TRUE);

-- Visualizar los datos de la tabla
SELECT * FROM employees;

-- Eliminar Tablas

DROP TABLE IF EXISTS employees;