#!/bin/bash

RUTA_UBICACION=$(pwd)

# Importamos las funciones bienvenida y cargando
source "$RUTA_UBICACION/utils.sh"

# Opciones del menu:
# 1: Generar
generar() {
    ./generar.sh
    ./menu.sh
}
# Opcion 2: Descomprimir
descomprimir() {
    ./descomprimir.sh
    ./menu.sh
}
# Opcion 3: Procesar
procesar() {
    ./procesar.sh
    ./menu.sh
}
# Opcion 4: Comprimir
comprimir() {
    ./comprimir.sh
    ./menu.sh
}

# OPCIONES=("Generar Imagenes" "Descomprimir imagenes" "Procesar imagenes" "Comprimir" "Salir")
if [ ! -e .iniciado ]
then
    bienvenida
else
    echo -e "\nDocumentación complementaria en README.md"
fi

echo -e "--------------------------------------------------------------------------------------------------------- \n" && sleep 1
echo -e "Seleccione una opcion del siguiente menu:\n" && sleep 1
PS3='Ingrese el numero del proceso: '
select opcion in "Generar Imagenes" "Descomprimir imagenes" "Procesar imagenes" "Comprimir" "Salir"
do
#	[ -e "$opcion" ] && echo "Proceso a ejecutar: $opcion" && continue
	[ $REPLY == 5 ] && rm -f .iniciado && echo -e "\n¡Gracias por utilizar nuestro programa!\n\nNos vemos pronto :D \n" && break
	echo -e "\n$opcion\n" && sleep 1 && break
done

case $REPLY in
	1)
        generar
        exit 0
        ;;
   	2)
		descomprimir
		exit 0
	 	;;
	3)
		procesar
		exit 0
		;;
	4)
        comprimir
        exit 0
        ;;
	5)
        exit 0
        ;;
esac

exit 0