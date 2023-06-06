#!/bin/bash

#$OPCION=""

while [[ $OPCION != "q" ]];
do
	echo
	echo -e "¡Bienvenido!: seleccione alguna de las opciones: (presione q para salir)\n"

	echo "1. Descargar imágenes"
	echo "2. Generar imágenes"

	echo 

	read -p "Opción: " OPCION

	echo 

	case $OPCION in
	    1)
		echo "Ha seleccionado 'Descargar Imágenes'"
		exit 0
	        ;;
	    2)
	        echo "Ha seleccionado 'Generar Imágenes'"
		exit 0
	        ;;
	    q)
		echo "Saliendo del programa..."
		;;
	    *)
		echo
	        echo "XxxxxxxERRORxxxxxxX"
		echo "No ha seleccionado una opción correcta, pruebe nuevamente..."
		echo "XxxxxxxERRORxxxxxxX"
		echo
	        ;;
	esac

	echo
done

#echo "La opción elegida es: $OPCION"
#echo
#echo "Cantidad de argumentos pasados: $#"
#echo
exit 0
