#!/bin/bash

echo "Ingrese la cantidad de imagenes que desea descargar: "
read -r IMAGENES

# Validamos si el valor ingresado por el usuario es un nùmero entero positivo

if echo "$IMAGENES" | grep -qP '^[1-9][0-9]*$'; then  #priemr digito rango del 1-9, luego cualquier numero entre 0 y 9
  echo "Número válido de imagenes"
else
  echo "Debe ingresar un nùmero entero positivo"
  exit 1
fi
#Solicitamos el ingreso del nombre de la carpeta destino

echo "Ingrese el nombre de la carpeta donde desea guardar las imágenes"
read -r DIRECTORIOSALIDA

#validamos el ingreso
if [[ -z  "$DIRECTORIOSALIDA" ]]; then
  echo "Error - Debe proporcionar un nombre"
  exit 1
fi

# Creamos el directorio salida , el -p nos crea los directorios padres si no existen
mkdir -p "$DIRECTORIOSALIDA"

NOMBRES_ALEATORIOS=($(curl -s https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv | grep -oE '[[:alpha:]]+')) #filtro de nombres 


# Bucle for para generar img
for ((i=0; i<IMAGENES; i++)) #este bucle for se ejecuta IMAGENES veces , lo arrancamos en 0 y aumenta 1 por cada iteracion hasta i-1
do
  INDICE_ALEATORIO=$((RANDOM % ${#NOMBRES_ALEATORIOS[@]}))

  NOMBRE_ARCHIVO="${NOMBRES_ALEATORIOS[$INDICE_ALEATORIO]}_$i.jpg"  

 # Descargar imagen desde el servicio web
  curl -o "$DIRECTORIOSALIDA/$NOMBRE_ARCHIVO" -L "https://source.unsplash.com/random/900%C3%97700/?person."  #el curl , por defecto descarga y guarda las img en "imagenes", con el -o podemos especificarle una ruta
  
  # Esperar 5 segundo entre descargas
  sleep 2
  #con awk elegimos la primer columna, si no nos muestra la ruta del archivo (puede estar o no)
  SUMA_VERIFICACION=$(md5sum "$DIRECTORIOSALIDA/$NOMBRE_ARCHIVO") # | awk '{ print $1 }')

  # SUMA de verificacion en un archivo de texto
  echo "$SUMA_VERIFICACION  $NOMBRE_ARCHIVO" >> "$DIRECTORIOSALIDA/sumas_verificacion.txt" 

done

#comprimir las imagenes
COMPRIMIR="$DIRECTORIOSALIDA"/imagenes.zip
zip  "$COMPRIMIR" "$DIRECTORIOSALIDA"/*.jpg

echo "Las imágenes fueron comprimidas con exito"

