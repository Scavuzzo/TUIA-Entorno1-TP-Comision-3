#!/bin/bash
# Scrip: Procesar.sh
# Funcion:
# Recorta imágenes a una resolución de 512*512. Solamente procesa aquellas imágenes
# que tengan nombres de personas válidos. Entiéndase por nombres de personas válidos a
# cualquier combinación de palabras que empiecen con un letra mayúscula y sigan por minúsculas.

# Creacion de las variables
RUTA_UBICACION=$(pwd)
CARPETA_ORIGEN="${RUTA_UBICACION}/descomprimidos"
CARPETA_DESTINO="${RUTA_UBICACION}/procesados"
REGEXP="^[A-Z][a-z]+[ ]?[A-Z]?[a-z][ ]?[A-Z]?[a-z]"
#REGEXP="^[A-Z][a-z]+[ ][A-Z][a-z]+"

# Validacion de existencia de imagenes en la carpeta

cd $CARPETA_ORIGEN
LISTA_ARCHIVOS=$(find . -name "*.jpg")
cd ..
[ -z "$LISTA_ARCHIVOS" ] && echo "No se encontraron fotos en el directorio" && exit 1

# Proceso de modificacion de las imagenes

for IMAGEN in "$CARPETA_ORIGEN"/*
do
	NOMBRE=$(basename "$IMAGEN")
        [[ $NOMBRE =~ $REGEXP ]] && convert "$IMAGEN" -resize 512x512 "$CARPETA_DESTINO/$NOMBRE"
done

exit 0
