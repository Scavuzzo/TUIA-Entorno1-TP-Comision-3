#!/bin/bash

echo "Ingrese el nombre del directorio en donde tiene almacenadas las imágenes:"
read -r DIRECTORIO

echo "Ingrese el nombre del archivo a descomprimir:"
read -r DESCOMPRIMIR

echo "Ingrese el nombre de la suma de verificacion"
read -r SUMVERIFICACION

SUMVERIFICACION="../sumas_verificacion.txt"

cd "$DIRECTORIO" 

# Descomprimir el archivo comprimido
unzip "$DESCOMPRIMIR" 

cd "$DIRECTORIO"

# Generar las sumas de verificación
for archivo in *.jpg; do
  suma_verificacion=$(md5sum "$archivo" | grep -o '^[^ ]*')
  echo "$suma_verificacion" >> "$sumverificacion_actual.txt"
done

# Ordenar las sumas de verificación
sort -o "$SUMAVERIFICACION_ACTUAL" "$SUMAVERIFICACION_ACTUAL"
sort -o "$SUMAVERIFICACION_ANTERIOR" "$SUMAVERIFICACION_ANTERIOR"

# Comparar las sumas de verificación
if cmp -s "$SUMAVERIFICACION_ACTUAL" "$SUMAVERIFICACION_ANTERIOR"; then
  echo "La suma de verificación no ha cambiado."
else
  echo "La suma de verificación ha cambiado."
fi
