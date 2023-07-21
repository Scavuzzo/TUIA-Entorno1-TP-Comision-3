#!/bin/bash

#Rutas, archivos y directorios
RUTA_UBICACION=$(pwd)
DIRECT_GENERADOS="$RUTA_UBICACION/generados"
NOMBRES_TXT="nombres.txt"

#Expresiones regulares
REGEXP_NOMBRE="^[A-Za-z ]+"
REGEXP_NUMERO="^[1-9][0-9]*$"

# Validamos si el valor ingresado por el usuario es un número entero positivo
while [[ ! "$CANTIDAD_IMAGENES" =~ $REGEXP_NUMERO ]] || (( CANTIDAD_IMAGENES > 50 ))
do
    echo "Ingrese la cantidad de imágenes que desea descargar: "
    read -r CANTIDAD_IMAGENES

    # Validamos si el valor ingresado por el usuario es un número entero positivo
    if [[ ! "$CANTIDAD_IMAGENES" =~ $REGEXP_NUMERO ]] || (( CANTIDAD_IMAGENES > 50 ))
    then
        echo -e "\n --- \nError: El numero debe estar entre 1 y 51.\n --- \n"
    fi
done

# Creamos el directorio salida
mkdir -p $DIRECT_GENERADOS   #-p , si ya existe, no lo crea

# Preguntamos por el nombre del archivo y validamos que no exista
while true; do
    echo -e "\nIngrese el nombre del archivo final comprimido (sin la extensión .zip):"
    read -r ARCHIVO_COMPRIMIDO

    if [ ! -e "$DIRECT_GENERADOS/$ARCHIVO_COMPRIMIDO.zip" ]; then
        echo -e "\nEl nombre del archivo comprimido es válido: $ARCHIVO_COMPRIMIDO.zip"
        break
    else
        echo -e "\n --- \nError: El nombre del archivo comprimido ya existe en el directorio. Por favor, ingrese un nombre diferente.\n --- \n"
    fi
done

echo -e "\nGenerando imágenes...\n"

NOMBRES_TOTALES=$(curl -s https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv | grep -oE "$REGEXP_NOMBRE")

echo "$NOMBRES_TOTALES" > $NOMBRES_TXT


# Generamos las imágenes según la cantidad ingresada por el usuario
for ((i=0; i < CANTIDAD_IMAGENES; i++))
do
 	NOMBRE_ALEATORIO=$(shuf -n 1 $NOMBRES_TXT)
 	NOMBRE_ARCHIVO="${NOMBRE_ALEATORIO}.jpg"

	# Descargar imagen desde el servicio web
  	curl -o "$DIRECT_GENERADOS/$NOMBRE_ARCHIVO" -L "https://source.unsplash.com/random/900%C3%97700/?person."  #el curl , por defecto descarga y guarda las img en "imagenes", con el -o podemos especificar>

 	 # Esperar 2 segundos entre descargas
  	sleep 2

done

rm $NOMBRES_TXT

#comprimir las imagenes
COMPRIMIR="${DIRECT_GENERADOS}/${ARCHIVO_COMPRIMIDO}.zip"

echo -e "\nComprimiendo Imágenes... \n" && sleep 1
cd $DIRECT_GENERADOS
zip "${ARCHIVO_COMPRIMIDO}.zip" ./*.jpg > /dev/null 2>&1
cd ..

rm "$DIRECT_GENERADOS"/*.jpg

# suma de verificación
SUMA_VERIFICACION=$(md5sum $COMPRIMIR)

# SUMA de verificacion en un archivo de texto
echo "$SUMA_VERIFICACION" >> "${DIRECT_GENERADOS}/${ARCHIVO_COMPRIMIDO}.txt"


echo -e "\nLas imágenes fueron comprimidas con éxito."

exit 0