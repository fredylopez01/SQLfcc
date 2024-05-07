
# [back](README.md)

# COMANDOS DE LA TERMINAL DE SQL
![Postgres SQL](https://img.shields.io/badge/postgresql-4169e1?style=for-the-badge&logo=postgresql&logoColor=white)

### log
```
psql --username=<user_name> --dbname=<database_name>
```

### Listar bases de datos
```
\l
```

### CREAR BASE DE DATOS
```
CREATE DATABASE database_name;
```

### Conectar una base de datos
```
\c database_name;
```

### Ver el contenido de la base
```
\d
```

### CREAR TABLA
```
CREATE TABLE table_name();
```

### Ver el contenido de una tabla
```
\d table_name;
```

### Crar una columna en una tabla
```
ALTER TABLE table_name ADD COLUMN column_name DATATYPE;
```

### Eliminar UNA COLUMNA EN UNA TABLA
```
ALTER TABLE table_name DROP COLUMN column_name;
```

### Cambiar el nombre de una columna
```
ALTER TABLE table_name RENAME COLUMN column_name TO new_name;
```

### Insertar una fila
```
INSERT INTO table_name(column_1, column_2) VALUES(value1, value2);
```

### Ver la información de una tabla
```
SELECT columns FROM table_name;
```

### Eliminar una columna
```
DELETE FROM table_name WHERE condition;
```

#### Ejemplo: **`DELETE FROM second_table WHERE username='Luigi';`**

### Eliminar una tabla
```
DROP TABLE table_name;
```

### Cambiar nombre a una base de datos
```
ALTER DATABASE database_name RENAME TO new_database_name;
```

### INSERTAR VARIAS FILAS AL TIEMPO
```
INSERT INTO characters(name, homeland, favorite_color)
VALUES('Mario', 'Mushroom Kingdom', 'Red'),
('Luigi', 'Mushroom Kingdom', 'Green'),
('Peach', 'Mushroom Kingdom', 'Pink');
```

### CAMBIAR EL VALOR DE UNA FILA

```
UPDATE table_name SET column_name=new_value WHERE condition;
```

### ORDENAR LAS FILAS
```
SELECT columns FROM table_name ORDER BY column_name;
```

### CREAR LLAVE PRIMARIA
```
ALTER TABLE table_name ADD PRIMARY KEY(column_name);
```

### ELIMINAR UNA RESTRICCION
```
ALTER TABLE table_name DROP CONSTRAINT constraint_name;
```