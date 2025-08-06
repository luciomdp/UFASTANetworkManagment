#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Uso: $0 <local_file_path> <remote_folder_path>"
  echo "Ej: ./file_upload.sh C:/Programacion/Redes/UFASTANetworkManagment/scripts/del_user.sh /home/ugr01/scripts"
  exit 1
fi

local_file_path="$1"
remote_folder_path="$2"

if [ -f .env ]; then
  source .env
elif [ -f ../../.env ]; then
  source ../../.env
else
  echo "Error: archivo .env no encontrado ni en el directorio actual ni en la raíz del proyecto"
  exit 1
fi

scp -P $SSH_PORT "$local_file_path" $USER@$SERVER_DOMAIN:"$remote_folder_path"
