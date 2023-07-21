#!/bin/bash

source utils.sh

if ! verificar_instalado "docker"
then
    echo "Error: Debes instalar Docker para poder utilizar esta aplicación"
    exit 1
fi

verificar_permisos_docker

if ! verificar_conexion_internet
then
    echo "Error: Computadora sin conexión a Internet"
    exit 1
fi

echo "Creando la imagen..." && sleep 1
docker build --tag test_grupo_tuia:1.0 .
echo "Iniciando el contenedor"

#para poder visualizar los resultados creamos un volumen(-v)
docker run -v ./output:/home/salida -it --name tp_edp_tuia test_grupo_tuia:1.0
docker rm tp_edp_tuia
docker rmi test_grupo_tuia:1.0



  

exit 0
