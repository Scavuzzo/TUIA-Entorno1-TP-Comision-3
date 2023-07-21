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