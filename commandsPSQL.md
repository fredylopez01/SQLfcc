
# [back](README.md)

# COMANDOS DE LA TERMINAL DE SQL
![Postgres SQL](https://img.shields.io/badge/postgresql-4169e1?style=for-the-badge&logo=postgresql&logoColor=white)

### log
```
psql --username:<user_name> --dbname:<database_name>
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
CREATE DATABASE database_name;
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