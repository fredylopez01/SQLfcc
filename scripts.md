# COMANDOS DE CONSOLA

|COMAND|ACTION|Ejemplo
|------|------|-|
|``bash sh nameFile.sh``| Ejecutar un scrip en un archivo .sh|
|``which bash``| Para saber cual|
|``#!/bin/bash``| Configurar bash para correr el scrip|
|``ls -l``| Listar con formato largo|
|``chmod +x questionnaire.sh``| Dar permiso a cualquiera para ejecutar ese archivo|
|``VARIABLE="varia ble"``| Declarar variable|
|``read VARIABLE``| Leer variable desde la consola|
|``echo $VARIABLE``| Imprimir valor de la variable|
|``echo -e "\nMESSAGE\n"``| Imprimir con linea en blanco arriba y abajo|
|`man`|Utilizado para ver funciones e información de un comando| `man <command>` |
|`wc`|Contar lineas (`-l`), palabras (`-w`) o caracteres (`-m`)| `wc -l <filename>` |
|`grep`|Utilizado para buscar patrones en texto |`grep <pattern> <filename>` `grep --color -n <pattern> <filename>`|
|`sed`|Usado para remplazar partes de un texto|```sed 's/<pattern>/<new_text>/' <filename>```|
|`dif`|Comando para ver la diferencia entre dos archivos|`diff <file_1> <file_2>`|

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
