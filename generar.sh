#!/bin/bash

# Nombres. Podria extenderse indefinidamente

NOMBRE=("Lorenzo" "Lautaro" "Alejandro" "Juan" "Facundo" "Jorge" "Juliana" "Maria" "Lucia" "Ana")

#Este es el primer argumento que le tenemos que dar al tp.sh y determina el numero de imagenes que queremos generar. Ej:tp.sh 10 (va a generar 10 img) 
IMAGENES=$1

# Directorio de salida. Aqui tengo mi segundo argumento, es basicamente el nombre de la carpeta en donde quiero que se almecenen las imagenes
DIRECTORIOSALIDA=$2

# Verificar si el número de imágenes se ha proporcionado
if [ -z "$IMAGENES" ] || [ -z "$DIRECTORIOSALIDA" ]; then #con -z verificamos si la variable esta vacia o no. Si se cumple que la variable esta vacia , es decir, es True. Se sigue ejecutando el codigo
  echo "Debe proporcionar la cantidad de imágenes a generar." #Mensaje de error. RECORDAR: || es el operador or. Se cumple esto o esto 
  exit 1 #indico el error
fi

# Creamos el directorio salida , el -p nos crea los directorios padres si no existen
mkdir -p "$DIRECTORIOSALIDA"



nombres_aleatorios=($(shuf -e "${NOMBRE[@]}")) #shuf me mezcla la lista de nombres y despues iteramos con el for, pero con la lista ya mezclada :) . El uso de -e garantiza que cuando le pasamos todos los elementos a la lista como argumento a shuf , va a interpretarlos como elementos por separado


# Bucle for para generar img
for ((i=0; i<IMAGENES; i++)) #este bucle for se ejecuta IMAGENES veces , lo arrancamos en 0 y aumenta 1 por cada iteracion hasta i-1
do

  nombre_archivo="${nombres_aleatorios[$i]}_$i.jpg"  


  # Descargar imagen desde el servicio web
  curl -o "$DIRECTORIOSALIDA/$nombre_archivo" "https://source.unsplash.com/random/900%C3%97700/?person."  #el curl , por defecto descarga y guarda las img en "imagenes", con el -o podemos especificarle una ruta
  
  # Esperar 5 segundo entre descargas
  sleep 5
done


# Comprimir imágenes
#tar -czf imagenes.tar.gz "$DIRECTORIOSALIDA"
#tar -czf "$DIRECTORIOSALIDA/imagenes.tar.gz" -C "$DIRECTORIOSALIDA" .

