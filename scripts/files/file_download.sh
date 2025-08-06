#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Use: $0 <remote_file_path> <local_folder_path>"
  echo "Ej: ./file_download.sh /home/ugr01/scripts/del_user.sh C:/Programacion/Redes/UFASTANetworkManagment/scripts"
  exit 1
fi

remote_file_path="$1"
local_folder_path="$2"

if [ -f .env ]; then
  source .env
elif [ -f ../../.env ]; then
  source ../../.env
else
  echo "Error: archivo .env no encontrado ni en el directorio actual ni en la raiz del proyecto"
  exit 1
fi

scp -P $SSH_PORT $USER@$SERVER_DOMAIN:$remote_file_path $local_folder_path