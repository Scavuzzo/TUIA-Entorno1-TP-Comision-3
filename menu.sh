#!/bin/bash

# Opciones del menu- Posteriormente AGREGAMOS el archivo generar.sh
generar() {
    echo "Has elegido Generar las imagenes"
    # aca agregamos el scrip generar.sh
}

# Funcion para DESCARGAR
descargar() {
    echo "Has elegido Descargar las imagenes"
    #  scrip descargar.sh
}

#$OPCION=""

while [[ $OPCION != "3" ]];
do
	echo
	echo -e "¡Bienvenido!: seleccione alguna de las opciones: (presione q para salir)\n"

	echo "1. Descargar imágenes"
	echo "2. Generar imágenes"
	echo "3. Salir del programa"
	echo 

	read -p "Opción: " OPCION

	echo 

	case $OPCION in
	    1)
			descargar
			exit 0
	        ;;
	    2)
			generar
			exit 0
	        ;;
	    3)
			echo "Saliendo del programa..."
			exit 0
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
