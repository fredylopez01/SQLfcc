# COMANDOS DE CONSOLA

|COMAND|ACTION|
|------|------|
|``bash sh nameFile.sh``| Ejecutar un scrip en un archivo .sh|
|``which bash``| Para saber cual|
|``#!/bin/bash``| Configurar bash para correr el scrip|
|``ls -l``| Listar con formato largo|
|``chmod +x questionnaire.sh``| Dar permiso a cualquiera para ejecutar ese archivo|
|``VARIABLE="varia ble"``| Declarar variable|
|``read VARIABLE``| Leer variable desde la consola|
|``echo $VARIABLE``| Imprimir valor de la variable|
|``echo -e "\nMESSAGE\n"``| Imprimir con linea en blanco arriba y abajo|

### IF ELSE
```
if [[ CONDITION ]]
then
  STATEMENTS
else
  STATEMENTS
fi
```

### FOR
```
for (( i = 10; i > 0; i-- ))
do
  echo $i
done
```

### WHILE
```
while [[ CONDITION ]]
do
  STATEMENTS
done
```
### DO WHILE
```
until [[ CONDITION ]]
do
  STATEMENTS
done
```

#### Puede usar para comparar
|N|Condición|Equivalencia|
|-|-------|-------|
|1|``-eq`` | equal|
|2|``-ne``| not equal|
|3|``-lt``| less than|
|4|``-le``| less than or equal|
|5|``-gt``| greater than|
|6|``-ge``| greater than or equal|
|7|``!``| Diferente|
|8|``&&``| Y |
