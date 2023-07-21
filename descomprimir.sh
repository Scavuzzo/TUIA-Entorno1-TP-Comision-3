#!/bin/bash

# Rutas, archivos y directorios
RUTA_UBICACION=$(pwd)
DIRECT_IMAGENES="${RUTA_UBICACION}/imagenes_generadas"
RUTA_DESCOMPRIMIDOS="${RUTA_UBICACION}/descomprimidos"

echo "Ingrese el nombre del comprimido: "
read -r ARCHIVO_COMPRIMIDO

[ ! -e "${DIRECT_IMAGENES}/${ARCHIVO_COMPRIMIDO}.zip" ] && echo "El archivo no se ha encontrado" && exit 1
RUTA_COMPRIMIDO="${DIRECT_IMAGENES}/${ARCHIVO_COMPRIMIDO}.zip"

echo "Ingrese la suma de verificacion: "
read -r SUMA_VERIFICACION

[ ! -e "${DIRECT_IMAGENES}/${SUMA_VERIFICACION}.txt" ] && echo "El archivo de suma de verificiación no se ha encontrado" && exit 1
RUTA_SUMA="${DIRECT_IMAGENES}/${SUMA_VERIFICACION}.txt"

SUMA_COMPRIMIDO=$(md5sum $RUTA_COMPRIMIDO)
SUMA_CHECK=$(head -n 1 $RUTA_SUMA)

[ "$SUMA_COMPRIMIDO" != "$SUMA_CHECK" ] && echo "Error: El archivo $ARCHIVO_COMPRIMIDO ha sido modificado o la suma de verificación es erronea" && exit 1

cd $DIRECT_IMAGENES
unzip -d $RUTA_DESCOMPRIMIDOS "${ARCHIVO_COMPRIMIDO}.zip"
cd ..

