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


echo "Bienvenido al programa"
sleep 1
echo "El mismo fue desarrollado por Alsop Agustin, Scavuzzo Lautaro y Peralta Alejandro"
sleep 2
echo "Recomendamos leer el archivo readme.md antes de comenzar a utilizar el siguiente programa"
sleep 2
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
done

case $REPLY in
	1)
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
esac



exit 0
