# File Transfer Scripts (Upload/Download)

## Propósito

Estos scripts permiten subir (`file_upload.sh`) o descargar (`file_download.sh`) archivos entre una máquina local y un servidor remoto utilizando `scp`. Están diseñados para simplificar la transferencia de archivos en entornos donde se utilizan claves SSH y múltiples servidores con diferentes configuraciones de puerto.

## Uso

### Descargar archivo desde el servidor

```bash
./file_download.sh <remote_file_path> <local_folder_path>
```
#### Ejemplo:

```bash
./file_download.sh /home/ugr01/scripts/del_user.sh C:/Programacion/Redes/UFASTANetworkManagment/scripts
```
### Subir archivo al servidor
```bash
./file_upload.sh <local_file_path> <remote_folder_path>
```
#### Ejemplo:

```bash
./file_upload.sh C:/Programacion/Redes/UFASTANetworkManagment/scripts/del_user.sh /home/ugr01/scripts
```
## Variables de entorno requeridas
Ambos scripts requieren un archivo .env que contenga las siguientes variables:

```env
SERVER_DOMAIN=dominio.o.ip.del.servidor
SSH_PORT=puerto_ssh
USER=nombre_usuario
```

Los scripts buscarán este archivo .env primero en el directorio actual y luego en la raiz del proyecto, lo que permite flexibilidad en la estructura del mismo.

## Requisitos

- Tener instalado scp en el sistema local (viene con OpenSSH).
- Tener configurada la autenticación por clave pública SSH con el servidor remoto (recomendado).

## Notas
- Asegurate de tener permisos de lectura/escritura sobre las rutas indicadas.

- Si los archivos ya existen en destino, serán sobreescritos sin confirmación.