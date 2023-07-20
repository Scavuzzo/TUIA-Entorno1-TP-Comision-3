#!/bin/bash

#Rutas, archivos y directorios
RUTA_UBICACION=$(pwd)
DIRECT_SALIDA="$RUTA_UBICACION/imagenes_generadas"
NOMBRES_TXT="nombres.txt"

#Expresiones regulares
REGEXP_NOMBRE="^[A-Za-z ]+"
REGEXP_NUMERO="^[1-9][0-9]*$"

echo "Ingrese la cantidad de imagenes que desea descargar: "
read -r CANTIDAD_IMAGENES

# Validamos si el valor ingresado por el usuario es un nùmero entero positivo
if [[ "$CANTIDAD_IMAGENES" =~ $REGEXP_NUMERO ]]
then
	echo "Número válido de imagenes"
else
	echo "Debe ingresar un nùmero entero positivo"
	exit 1
fi

# Creamos el directorio salida
mkdir -p $DIRECT_SALIDA   #-p , si ya existe, no lo crea
echo "Ingrese el nombre del archivo comprimido"
read -r ARCHIVO_COMPRIMIDO

NOMBRES_TOTALES=$(curl -s https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv | grep -oE "$REGEXP_NOMBRE")

echo "$NOMBRES_TOTALES" > $NOMBRES_TXT

# Generamos las imágenes según la cantidad ingresada por el usuario
for ((i=0; i < CANTIDAD_IMAGENES; i++))
do
 	NOMBRE_ALEATORIO=$(shuf -n 1 $NOMBRES_TXT)
 	NOMBRE_ARCHIVO="${NOMBRE_ALEATORIO}.jpg"

	# Descargar imagen desde el servicio web
  	curl -o "$DIRECT_SALIDA/$NOMBRE_ARCHIVO" -L "https://source.unsplash.com/random/900%C3%97700/?person."  #el curl , por defecto descarga y guarda las img en "imagenes", con el -o podemos especificar>

 	 # Esperar 2 segundos entre descargas
  	sleep 2

  	# suma de verificación
#  	SUMA_VERIFICACION=$(md5sum "$DIRECT_SALIDA/$NOMBRE_ARCHIVO")

  	# SUMA de verificacion en un archivo de texto
#  	echo "$SUMA_VERIFICACION" >> "${DIRECT_SALIDA}/${ARCHIVO_COMPRIMIDO}.txt"
done

rm $NOMBRES_TXT

#comprimir las imagenes
COMPRIMIR="${DIRECT_SALIDA}/${ARCHIVO_COMPRIMIDO}.zip"
echo $COMPRIMIR

cd $DIRECT_SALIDA
zip "${ARCHIVO_COMPRIMIDO}.zip" ./*.jpg
cd ..

rm "$DIRECT_SALIDA"/*.jpg

# suma de verificación
SUMA_VERIFICACION=$(md5sum $COMPRIMIR)

# SUMA de verificacion en un archivo de texto
echo "$SUMA_VERIFICACION" >> "${DIRECT_SALIDA}/${ARCHIVO_COMPRIMIDO}.txt"


echo "Las imágenes fueron comprimidas con exito"
echo $COMPRIMIR
