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

OPCIONES=("SALIR" "DescargarImágenes" "ComprimirImágenes") 

PS3='Ingrese un numero> '
echo "Que desea hacer?"
select opcion in "SALIR" "Descargar Imágenes" "Comprimir Imágenes"
do
	[ -e "$opcion" ] && echo "Opcion elegida: $opcion" && continue 
	[ $REPLY == 1 ] && echo "Hasta luego" && break 
	echo "Opcion elegida: $opcion" && break
done

case $REPLY in
	1)
		exit 0
        	;;
   	2)
		descargar
		exit 0
	 	;;
	3)
		generar
		exit 0
		;;

esac



exit 0
