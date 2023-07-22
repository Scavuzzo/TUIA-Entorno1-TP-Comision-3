# TRABAJO PRÁCTICO - ENTORNO DE PROGRAMACIÓN

Trabajo final realizado para la materia Entorno De Programación. En este repositorio se encuentran todos los archivos necesarios para la realización de dicho trabajo.

## GRUPO 24:

Alsop, Agustin - Scavuzzo, Lautaro - Peralta, Alejandro

## Objetivo:

Diseñar y escribir un programa para procesar un lote de imágenes. El programa cuenta con 5 Scrips que correran dentro de un contenedor, el resultado de este proceso 
será un archivo comprimido y un archivo de texto.

## Paso a Paso
### 1) Ejecución del contenedor

1- Descarga de archivos: Para comenzar, asegúrate de descargar todos los archivos necesarios desde el repositorio y colócalos en una misma carpeta en tu sistema.

2- Acceso a la terminal: Abre una terminal shell en tu sistema operativo. Esto te permitirá ejecutar comandos y navegar entre las carpetas del sistema.

4- Navegación a la carpeta: Utiliza el comando "cd" para navegar hasta la carpeta donde has almacenado los archivos descargados. Por ejemplo:
	
```
cd Ruta_de_la_carpeta
```
Sustituye "Ruta_de_la_carpeta" por la ruta real de la carpeta en tu sistema.

5- Verificación de permisos: Antes de ejecutar el archivo "init.sh", verifica si tiene los permisos necesarios para ser ejecutado. Puedes hacerlo con el siguiente comando:
	
```
ls -l init.sh
```
6- Asegúrate de que el archivo tenga permisos de ejecución. Si no los tiene, puedes otorgárselos utilizando el siguiente comando:
	
```
chmod +x init.sh
```
7- Ejecución del script: Ahora que tienes los permisos adecuados, puedes ejecutar el script "init.sh". Utiliza el siguiente comando para hacerlo:

```
./init.sh
```
Este script creará una imagen en Docker y llevará a cabo las configuraciones necesarias para poner en marcha el contenedor.

### Aclaracion 
La primera vez iniciada tendras que que poner el siguiente codigo con tu usuario y luego reiniciar el equipo
```
sudo usermod -aG docker $USER
```
Luego de esto realizar la ejecucion del comando para iniciar de manera exitosa el programa
```
./init.sh
```
### 2) Generación de imágenes

Para iniciar el proceso de generación de imágenes, el usuario deberá seguir los siguientes pasos de manera precisa:

1- Ingresar el número "1" en la interfaz del programa y presionar la tecla "Enter" para seleccionar la opción de generación de imágenes.

2- A continuación, el programa solicitará al usuario que ingrese la cantidad de imágenes que desea generar. Es importante ingresar un valor válido y positivo que indique la cantidad exacta de imágenes requeridas.

3- Después de especificar la cantidad deseada, el programa pedirá al usuario que proporcione un nombre para el archivo comprimido que contendrá todas las imágenes generadas. Es recomendable elegir un nombre descriptivo y significativo para facilitar la identificación del archivo posteriormente.

### 3) Descompresión de imágenes

Una vez que se han generado las imágenes siguiendo el proceso mencionado anteriormente, el usuario podrá proceder a la descompresión de las mismas mediante los siguientes pasos:

1- Seleccionar la opción "2" en la interfaz del programa y presionar la tecla "Enter" para iniciar el proceso de descompresión.

2- A continuación, el programa solicitará al usuario que ingrese el nombre del archivo comprimido que desea descomprimir. Es crucial ingresar el nombre exacto del archivo comprimido previamente generado durante la fase de generación de imágenes.

3- Posteriormente, se requerirá la suma de verificación del archivo comprimido para validar su versión. Esta suma de verificación garantizará la integridad y autenticidad del archivo, asegurando que no haya ocurrido ninguna alteración durante su transferencia o almacenamiento.

Es importante seguir rigurosamente estos pasos para garantizar una generación y descompresión exitosa de las imágenes. Siempre se debe verificar la exactitud de la información ingresada antes de proceder con cualquier operación para evitar posibles errores y asegurar un resultado satisfactorio.

### 4) Procesamiento de las imágenes

Una vez que se han descomprimido las imágenes, el siguiente paso es realizar el procesamiento de las mismas. Para ello, se deberá seguir el procedimiento detallado a continuación:

1- Seleccionar la opción "3" en la interfaz del programa y presionar la tecla "Enter" para iniciar el proceso de procesamiento de imágenes.

2- Durante este proceso, el programa analizará todas las imágenes descomprimidas y seleccionará únicamente aquellas que cumplan con el criterio de nombres válidos. Se consideran nombres válidos aquellas combinaciones de palabras que comiencen con la primera letra en mayúscula seguida de letras en minúscula. Las imágenes con nombres que no cumplan esta estructura no serán procesadas.

3- Una vez que se hayan identificado las imágenes válidas, estas pasarán por un proceso de conversión de resolución, donde su tamaño será ajustado a 512x512 píxeles. Esto garantiza que todas las imágenes procesadas tengan una resolución uniforme y adecuada para su posterior uso.

4- Finalmente, las imágenes que han sido procesadas y ajustadas a la resolución de 512x512 píxeles serán almacenadas en la carpeta denominada "procesados". Es importante asegurarse de que la carpeta exista en el sistema antes de llevar a cabo este paso.

El proceso de procesamiento de imágenes asegura que solo se trabajará con aquellas que cumplen con los criterios establecidos y que han sido adaptadas a una resolución estándar. Esta fase es fundamental para garantizar la calidad y consistencia de las imágenes resultantes, lo que facilitará su uso en posteriores tareas o proyectos. Recuerda siempre verificar los resultados obtenidos para asegurarse de que el programa ha funcionado correctamente y las imágenes procesadas están en la ubicación esperada.

### 5) Comprensión de las imágenes

Finalmente, luego de procesadas las imágenes:

1- Seleccionar la opción "4" en la interfaz del programa y presionar la tecla "Enter" para iniciar el proceso de comprensión de imágenes.

Se iniciará el proceso de comprensión, que realizará automáticamente las siguientes acciones:

2- Generará un archivo con la lista de nombres de todas las imágenes procesadas. Este archivo contendrá una enumeración de los nombres de todas las imágenes que fueron procesadas y redimensionadas durante la ejecución del programa.

3- Generará otro archivo con la lista de nombres válidos de imágenes. En este archivo, se incluirán únicamente los nombres de las imágenes que cumplieron con los criterios de validez establecidos durante el proceso de selección y validación de nombres.

4- Creará un archivo con el recuento total de personas cuyos nombres finalizan con la letra "a". Este archivo proporcionará el número total de personas cuyos nombres cumplen con esta característica en las imágenes procesadas.

5- Por último, se generará un archivo comprimido que incluirá los archivos generados en los items anteriores y todas las imágenes procesadas. Este archivo comprimido permitirá tener una copia completa y ordenada de los resultados obtenidos durante el proceso de generación, descompresión, procesamiento y comprensión de las imágenes. Es importante destacar que este archivo comprimido será accesible desde fuera del contenedor del programa, lo que facilitará su distribución y respaldo.

El proceso de comprensión automática de los resultados simplificará la gestión y organización de la información generada durante la ejecución del programa. De esta manera, el usuario podrá acceder fácilmente a los archivos con la lista de nombres, los nombres válidos y el recuento de personas, así como al archivo comprimido que contiene todos los resultados y las imágenes procesadas. Este paso final asegurará una experiencia eficiente y completa al utilizar el programa "Generación de Imágenes".

## Guia de usuario

#### Definiciones
En esta sección se brinda un breve resumen de cada archivo presente en el contenedor:

##### menu.sh
Permite visualizar el cada uno de los Script, mostrándose como opciones a ejecutar.
##### generar.sh  
Genera imágenes utilizando un servicio web. El usuario debe indicar cuantas imágenes generar. A estas imágenes se les asigna un nombre al azar proveniente de un archivo CSV (https://raw.githubusercontent.com/adalessandro/EdP-2023-TP-Final/main/dict.csv). Posteriormente se comprimen las imágenes en un archivo .zip y se genera una suma de verificación. En resumen, el resultado de este Scrip es un archivo .zip con las imágenes comprimidas y un archivo .txt con la suma de verificación, este resultado va a estar contenido en un directorio creado por el propio Script, llamado “imagenes_comprimidas”.
##### descomprimir.sh: 
El usuario debe indicar dos archivos como argumento. Uno es el archivo comprimido y el otro la suma de verificación, ambos generados por generar.sh y contenidos en “imagenes_comprimidas”. Realiza un proceso de validación, si no retorna un error se procede a descomprimir en el directorio “descomprimidos”.
##### procesar.sh: 
Toma un lote de imágenes que se encuentra en un directorio obtenido por descomprimir y hace un recorte a una resolución de 512*512. Sólo procesa las imágenes que tienen nombres válidos(entiéndase por nombres válidos a cualquier combinación de palabras que comienzan con una letra mayúscula y sigan con minúsculas). Estas imágenes ya procesadas se guardan en el directorio “procesados”.
##### comprimir.sh: 
Luego de haber procesado las imágenes, se genera un archivo .txt con el nombre de cada imagen como contenido. Luego un archivo .txt con los nombres
válidos(nombre válido explicado en procesar.sh) y por último un archivo comprimido que contenga los archivos anteriores  y todas las imágenes contenidas en “descomprimidos”. El archivo comprimido se podrá acceder fuera del contenedor. 

