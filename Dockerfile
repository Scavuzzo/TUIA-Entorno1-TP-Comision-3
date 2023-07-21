FROM ubuntu

#copiar los archivos .sh y depositarlos en /files en el contenedor   

COPY *.sh /files/

#directorio de trabajo

WORKDIR /files

#otorgamos permisos

RUN chmod 764 *.sh

#paquetes 

RUN apt-get update

RUN apt-get install -y imagemagick

RUN apt-get install -y zip

RUN apt-get install -y curl

#inicio del menu sh

CMD ["/files/menu.sh"]
