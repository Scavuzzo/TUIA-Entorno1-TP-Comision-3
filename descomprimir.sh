#!/bin/bash

# Rutas, archivos y directorios
RUTA_UBICACION=$(pwd)
DIRECT_GENERADOS="${RUTA_UBICACION}/generados"
DIRECT_DESCOMPRIMIDOS="${RUTA_UBICACION}/descomprimidos"

source "$RUTA_UBICACION/utils.sh"

echo "Ingrese el nombre del a descomprimir: "
read -r ARCHIVO_COMPRIMIDO
while [ ! -e "${DIRECT_GENERADOS}/${ARCHIVO_COMPRIMIDO}.zip" ]
do
    echo -e "\n --- \nError: El archivo no se ha encontrado.\n --- \n"
    echo "Ingrese el nombre del a descomprimir: "
    read -r ARCHIVO_COMPRIMIDO
done
RUTA_COMPRIMIDO="${DIRECT_GENERADOS}/${ARCHIVO_COMPRIMIDO}.zip"

echo "Ingrese la suma de verificacion: "
read -r SUMA_VERIFICACION

while [ ! -e "$DIRECT_GENERADOS/$SUMA_VERIFICACION.txt" ]
do
    echo -e "\n --- \nError: El archivo no se ha encontrado.\n --- \n"
    echo "Ingrese la suma de verificacion: "
    read -r SUMA_VERIFICACION
done

RUTA_SUMA="${DIRECT_GENERADOS}/${SUMA_VERIFICACION}.txt"

SUMA_COMPRIMIDO=$(md5sum $RUTA_COMPRIMIDO)
SUMA_CHECK=$(head -n 1 $RUTA_SUMA)

echo -e "\nComprobando errores..."
cargando

[ "$SUMA_COMPRIMIDO" != "$SUMA_CHECK" ] && echo "Error: El archivo $ARCHIVO_COMPRIMIDO ha sido modificado o la suma de verificación es erronea" && ./menu.sh

cd $DIRECT_GENERADOS
unzip -d $DIRECT_DESCOMPRIMIDOS "${ARCHIVO_COMPRIMIDO}.zip" > /dev/null 2>&1
cd ..

echo "Imagenes descomprimidas correctamente" && sleep 1

exit 0