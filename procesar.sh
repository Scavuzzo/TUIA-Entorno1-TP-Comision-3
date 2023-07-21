#!/bin/bash
# Scrip: Procesar.sh
# Funcion:
# Recorta imágenes a una resolución de 512*512. Solamente procesa aquellas imágenes
# que tengan nombres de personas válidos. Entiéndase por nombres de personas válidos a
# cualquier combinación de palabras que empiecen con un letra mayúscula y sigan por minúsculas.

# Creacion de las variables
RUTA_UBICACION=$(pwd)
DIRECT_DESCOMPRIMIDOS="${RUTA_UBICACION}/descomprimidos"
DIRECT_PROCESADOS="${RUTA_UBICACION}/procesados"
REGEXP="^[A-Z][a-z]+[ ]?[A-Z]?[a-z][ ]?[A-Z]?[a-z]"

source "$RUTA_UBICACION/utils.sh"

cargando

# Validacion de existencia de imagenes en la carpeta
cd $DIRECT_DESCOMPRIMIDOS
LISTA_ARCHIVOS=$(find . -name "*.jpg")
cd ..
[ -z "$LISTA_ARCHIVOS" ] && echo "No se encontraron fotos en el directorio" && exit 1

# Proceso de modificacion de las imagenes

mkdir -p $DIRECT_PROCESADOS

for IMAGEN in "$DIRECT_DESCOMPRIMIDOS"/*
do
	NOMBRE=$(basename "$IMAGEN")
        [[ $NOMBRE =~ $REGEXP ]] && convert "$IMAGEN" -resize 512x512 "$DIRECT_PROCESADOS/$NOMBRE" > /dev/null 2>&1
done

exit 0
