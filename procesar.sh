#!/bin/bash
# Scrip: Procesar.sh
# Funcion:
# Recorta imágenes a una resolución de 512*512. Solamente procesa aquellas imágenes
# que tengan nombres de personas válidos. Entiéndase por nombres de personas válidos a
# cualquier combinación de palabras que empiecen con un letra mayúscula y sigan por minúsculas.

imagen=$1
nombre_salida=$2

convert $imagen -crop 512x512+100+100 "$nombre_salida"

exit 0
