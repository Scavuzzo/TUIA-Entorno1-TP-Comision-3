#!/bin/bash
# Scrip: Procesar.sh
# Funcion:
# Recorta imágenes a una resolución de 512*512. Solamente procesa aquellas imágenes
# que tengan nombres de personas válidos. Entiéndase por nombres de personas válidos a
# cualquier combinación de palabras que empiecen con un letra mayúscula y sigan por minúsculas.

# Creacion de las variables
CARPETA_ORIGEN="/home/alsop-agustin/Desktop/descomprimidos"
CARPETA_DESTINO="/home/alsop-agustin/Desktop/procesados"
EXPRESION="^[A-Z][a-z]+[ ][A-Z][a-z]+"

# Validacion de existencia de imagenes en la carpeta
cd $CARPETA_ORIGEN
LISTA_ARCHIVOS=$(find . -name "*.jpeg")
cd ..

[ -z "$LISTA_ARCHIVOS" ] && echo "No se encontraron fotos en el directorio" && exit 1

# Proceso de modificacion de las imagenes
for IMAGEN in "$CARPETA_ORIGEN"/*
do
        if [[ $IMAGEN == *.jpg || $IMAGEN == *.png || $IMAGEN == *.jpeg ]]
        then
                NOMBRE=$(basename "$IMAGEN")
                [[ $NOMBRE =~ $EXPRESION ]] && convert "$IMAGEN" -resize 512x512 "$CARPETA_DESTINO/$NOMBRE"
        fi
done

exit 0
