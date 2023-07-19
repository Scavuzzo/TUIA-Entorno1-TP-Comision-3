#!/bin/bash

directorio=$1 

#echo $directorio

[ -d "$directorio" ] || (echo "Error: No se encuentra el directorio" && exit 1)
# [ -s "$directorio" ] || (echo "el directorio está vacío" && exit 1)

cd $directorio

LISTA_ARCHIVOS=$(find . -name "*.jpeg")
echo $LISTA_ARCHIVOS
cd ..

CANTIDAD_ARCHIVOS=$(echo "$LISTA_ARCHIVOS" | wc -l)

[ -z "$LISTA_ARCHIVOS" ] && echo "No se encontraron fotos en el directorio" && exit 1

NOMBRES_COMPLETOS=()

for FOTO in $LISTA_ARCHIVOS
do
	NOMBRE=$(basename "$FOTO")
	NOMBRES_COMPLETOS+=" $NOMBRE"
done

mkdir descomprimidos

echo "$NOMBRES_COMPLETOS"
echo "$NOMBRES_COMPLETOS" > descomprimidos/nombres-imagenes.txt 


exit 0
