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

[ -d output ] && rm -r output && mkdir output && chmod 764 output

echo "Creando la imagen..." && sleep 1
docker build --tag grupo24_edp_tuia:1.0 .
echo "Iniciando el contenedor"

#para poder visualizar los resultados creamos un volumen(-v)
docker run -v ./output:/home/output -it --name grupo24_files_tuia grupo24_edp_tuia:1.0
docker rm grupo24_files_tuia
docker rmi grupo24_edp_tuia:1.0



  

exit 0
