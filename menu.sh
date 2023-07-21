#!/bin/bash

# Opciones del menu:
# Opcion 1: Generar
generar() {
    echo "Has elegido Generar las imagenes"
    sleep 1
    echo "Cargando: ---------- 0%"
    sleep 1
    echo "Cargando: ***------- 30%"
    sleep 1
    echo "Cargando: ******---- 60%"
    sleep 1
    echo "Cargando: *********- 90%"
    sleep 1
    echo "¡Completado!"
    echo " "
    echo " "
    echo " "
    sleep 1
    ./generar.sh
    ./menu.sh
}
# Opcion 2: Descomprimir
descomprimir() {
    echo "Has elegido Descomprimir las imagenes"
    sleep 1
    echo "Cargando: ---------- 0%"
    sleep 1
    echo "Cargando: ***------- 30%"
    sleep 1
    echo "Cargando: ******---- 60%"
    sleep 1
    echo "Cargando: *********- 90%"
    sleep 1
    echo "¡Completado!"
    sleep 1

    ./descomprimir.sh
    ./menu.sh
}
# Opcion 3: Procesar
procesar() {
    echo "Has elegido procesar las imagenes"
    sleep 1
    echo "Cargando: ---------- 0%"
    sleep 1
    echo "Cargando: ***------- 30%"
    sleep 1
    echo "Cargando: ******---- 60%"
    sleep 1
    echo "Cargando: *********- 90%"
    sleep 1
    echo "¡Completado!"
    sleep 1
    ./procesar.sh
    ./menu.sh
}
# Opcion 4: Comprimir
comprimir() {
    echo "Has elegido comprimir"
    sleep 1
    echo "Cargando: ---------- 0%"
    sleep 1
    echo "Cargando: ***------- 30%"
    sleep 1
    echo "Cargando: ******---- 60%"
    sleep 1
    echo "Cargando: *********- 90%"
    sleep 1
    echo "¡Completado!"
    sleep 1
    ./comprimir.sh
    ./menu.sh
}

OPCIONES=("Generar Imagenes" "Descomprimir imagenes" "Procesar imagenes" "Comprimir" "Salir")

<<<<<<< HEAD
echo " "
echo " "
echo "-----------------------------------------------------------------------------------------------------------"
echo "Hola de nuevo!, seras redireccionado al menu"
sleep 2
echo "Recomendamos leer el archivo readme.md antes de comenzar a utilizar el siguiente programa"
echo "---------------------------------------------------------------------------------------------------------"
sleep 1
echo "Seleccione una opcion del siguiente menu: "
sleep 1
PS3='Ingrese el numero del proceso: '
select opcion in "Generar Imagenes" "Descomprimir imagenes" "Procesar imagenes" "Comprimir" "Salir"
do
#	[ -e "$opcion" ] && echo "Proceso a ejecutar: $opcion" && continue
	[ $REPLY == 5 ] && echo "Hasta luego :D" && break
	echo "Proceso a ejecutar: $opcion" && sleep 2 && break
=======
OPCIONES=("SALIR" "DescargarImágenes" "ComprimirImágenes") 

PS3='Ingrese un numero> '
echo "Que desea hacer?"
select opcion in "SALIR" "Descargar Imágenes" "Comprimir Imágenes"
do
	[ -e "$opcion" ] && echo "Opcion elegida: $opcion" && continue 
	[ $REPLY == 1 ] && echo "Hasta luego" && break 
	echo "Opcion elegida: $opcion" && break
>>>>>>> Alsop/procesar.sh
done

case $REPLY in
	1)
<<<<<<< HEAD
                generar
                exit 0
                ;;
   	2)
		Descomprimir
		exit 0
	 	;;
	3)
		Procesar
		exit 0
		;;
	4)
                Comprimir
                exit 0
                ;;
	5)
                exit 0
                ;;
=======
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

>>>>>>> Alsop/procesar.sh
esac



exit 0
