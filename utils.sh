#!/bin/bash

bienvenida() {
    echo -e "\n Bienvenido al programa \n"
    sleep 1
    echo -e "Desarrolladores: \n\n- Alsop Agustin, \n- Scavuzzo Lautaro \n- Peralta Alejandro \n"
    sleep 2
    echo -e "Recomendamos leer el archivo documentación (README.md) antes de comenzar a utilizar el siguiente programa"
    sleep 2
    touch .iniciado
}

cargando() {
    echo "Cargando: ---------- 0%"
    sleep 1
    echo "Cargando: ***------- 30%"
    sleep 1
    echo "Cargando: ******---- 60%"
    sleep 1
    echo "Cargando: *********- 90%"
    sleep 1
    echo -e "¡Completado! \n"
    sleep 1
}

verificar_instalado() {
    if command -v "$1" &> /dev/null
    then
        return 0
    else
        echo "Error: El paquete '$1' no está instalado en esta máquina."
        return 1
    fi
}

verificar_conexion_internet() {
    ping -c 1 "www.google.com" &> /dev/null
}

verificar_permisos_docker() {
    if [ "$(id -u)" != "0" ] && ! docker info &>/dev/null
    then
        echo "Error: No tienes permisos para ejecutar Docker."
        echo "Por favor ejecutar el siguiente comando y luego reiniciar la computadora: "
        echo -e "\n\nsudo usermod -aG docker $USER\n\n"
        exit 1
    fi
}