#!/bin/bash

source utils.sh

CONEXION=$(ping -c 2 "www.google.com")

if [ -z "$CONEXION" ]; then

  echo "Error- Compruebe su conexiÃ³n a interner"

else

  echo "Creando la imagen"

  docker build --tag test_grupo_tuia:1.0 .

  echo "Iniciando el contenedor"

  #para poder visualizar los resultados creamos un volumen(-v)

  docker run -v ./output:/home/salida -it --name tp_edp_tuia test_grupo_tuia:1.0

  docker rm tp_edp_tuia

  docker rmi test_grupo_tuia:1.0
fi

exit 0
