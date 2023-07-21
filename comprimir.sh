#!/bin/bash

#Rutas, directorios o archivos
RUTA_UBICACION=$(pwd)
DIRECT_PROCESADOS="$RUTA_UBICACION/procesados"
DIRECT_COMPRIMIDOS="$RUTA_UBICACION/comprimidos"
DIRECT_OUTPUT="$RUTA_UBICACION/output"
AUX_TXT="aux.txt"
VALIDOS_TXT="$DIRECT_COMPRIMIDOS/lista_nombres_validos.txt"
VALIDOS_A_TXT="$DIRECT_COMPRIMIDOS/lista_nombres_a.txt"

#Expresiones Regulares
REGEXP_NOMBRE="(^[A-Z][a-z]+)"
#REGEXP_VALIDOS="$REGEXP_NOMBRE( |\$)$REGEXP_NOMBRE( |\$)$REGEXP_NOMBRE( |\$)"

REGEXP_VALIDOS="^[A-Z][a-z]+[ ]?[A-Z]?[a-z]*[ ]?[A-Z]?[a-z]*"
REGEXP_VALIDOS_A="$REGEXP_NOMBRE[a]{1}($|[ ])"
#REGEXP_VALIDOS_A="^[A-Z][a-z]+[a]{1}($|[ ])"


#Validacion de archivos utilizados
[ -e $AUX_TXT ] && rm $AUX_TXT
[ -e $DIRECT_COMPRIMIDOS ] && rm -r $DIRECT_COMPRIMIDOS
[ -e $DIRECT_OUTPUT ] && rm -r $DIRECT_OUTPUT

mkdir $DIRECT_COMPRIMIDOS

#Validamos que la ruta sea un directorio
if [ -d "$DIRECT_PROCESADOS" ]
then
	# Buscamos las imágenes dentro de la carpeta y luego volvemos a la raíz del programa
	echo "Buscando imágenes..."
	echo "Cargando: ---------- 0%"
        sleep 1
        echo "Cargando: ***------- 30%"
	sleep 1
	echo "Cargando: ******---- 60%"
        sleep 1
        echo "Cargando: *********- 90%"
	sleep 1
	echo -e  "¡Completado!"
	sleep 1
	cp -r "$DIRECT_PROCESADOS"/*.jpg "$DIRECT_COMPRIMIDOS"
	if [ "$(ls -A "$DIRECT_COMPRIMIDOS")" ]
	then
		find $DIRECT_COMPRIMIDOS -name "*.jpg" >> "$AUX_TXT"
		CONTADOR_A=0
	  	while IFS= read -r LINEA; do
			NOMBRE_FOTO=$(echo "$LINEA" | grep -oP '[^/]+(?=\.jpg)')
			if [[ "$NOMBRE_FOTO" =~ $REGEXP_VALIDOS ]]
                       	then
				echo "$NOMBRE_FOTO" >> $VALIDOS_TXT
			fi
                       	if [[ "$NOMBRE_FOTO" =~ $REGEXP_VALIDOS_A ]]
                       	then
                       		echo "$NOMBRE_FOTO" >> $VALIDOS_A_TXT
				((CONTADOR_A++))
                       	fi
  		done < "$AUX_TXT"
		echo -e "Imágenes procesadas correctamente. \n"
		sleep 1
		echo -e "Cantidad de nombres que terminan en a: $CONTADOR_A \n"
		echo -e "Cantidad de nombres que terminan en a: $CONTADOR_A \n" | cat - $VALIDOS_A_TXT > $AUX_TXT
		mv $AUX_TXT $VALIDOS_A_TXT
	else
		echo "No se existen imágenes procesadas. Vuelva al paso anterior." && exit 1
	fi
	# Si el proceso se lleva a cabo correctamente, comprimimos los archivos y directorios
	echo -e "Compresión en curso... \n"
	echo $(ls -a)
	mkdir $DIRECT_OUTPUT
	cd $DIRECT_COMPRIMIDOS
	zip -r $DIRECT_OUTPUT ./
#	zip -r "$RUTA_UBICACION/imagenes.zip ./"
	echo "Proceso terminado, resultado disponible en carpeta output"
fi



#mkdir descomprimidos

#echo "$NOMBRES_COMPLETOS"
#echo "$NOMBRES_COMPLETOS" > descomprimidos/nombres-imagenes.txt


exit 0
