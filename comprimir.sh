#!/bin/bash

RUTA_UBICACION=$(pwd) 
DIRECT_PROCESADOS="$RUTA_UBICACION/procesados"
echo $DIRECT_PROCESADOS
AUX_TXT="aux.txt"

REGEXP_VALIDOS="^[A-Z][a-z]+[ ]?[A-Z]?[a-z]*[ ]?[A-Z]?[a-z]*"
REGEXP_VALIDOS_A="^[A-Z][a-z]+[ ]?[A-Z]?[a-z]*[ ]?[A-Z]?[a-z]*[a]{1}"

[ -e "lista_nombres_validos.txt" ] && rm -r lista_nombres_validos.txt
[ -e "lista_nombres_a.txt" ] && rm -r lista_nombres_a.txt
[ -e $AUX_TXT ] && rm -r $AUX_TXT

#Validamos que la ruta sea un directorio
if [ -d "$DIRECT_PROCESADOS" ] 
then	
	# Buscamos las imágenes dentro de la carpeta y luego volvemos a la raíz del programa
	find $DIRECT_PROCESADOS -name "*.jpeg" >> "$AUX_TXT" 
	echo "Buscando imágenes..."
	sleep 2
	#  Validamos que haya fotos en el directorio 
	if [ -s "$AUX_TXT" ]
	then
	  	while IFS= read -r linea; do
    			# asfasfa
			NOMBRE_FOTO="${linea##*/}"
			NOMBRE_FOTO="${linea%.jpeg}"
			echo "$NOMBRE_FOTO" >> lista_nombres_validos.txt
  		done < "$AUX_TXT"
#		for FOTO in $RUTA_PROCESADOS\*
#		do
#			echo $(basename "$FOTO")
#			if [[ $FOTO_NOMBRE =~ $REGEXP_VALIDOS ]]
#			then
#			echo "${FOTO_NOMBRE%.*}" >> ../lista_nombres_validos.txt
#			fi
#			if [[ $FOTO_NOMBRE =~ $REGEXP_VALIDOS_A ]]
#			then
#			echo "${FOTO_NOMBRE%.*}" >> lista_nombres_a.txt
#			fi
#		done
	else
		echo "No se encontraron fotos en el directorio" && exit 1
	fi
fi



#mkdir descomprimidos

#echo "$NOMBRES_COMPLETOS"
#echo "$NOMBRES_COMPLETOS" > descomprimidos/nombres-imagenes.txt 


exit 0
