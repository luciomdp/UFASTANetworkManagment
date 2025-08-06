#!/bin/bash

if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Uso: $0 <nombre_de_usuario> <password>"
  exit 1
fi

usuario="$1"
password="$2"
grupo="estudiantes"

# Crear grupo si no existe
if ! getent group "$grupo" > /dev/null; then
  sudo groupadd "$grupo"
fi

# Verificar si el usuario ya existe
if id "$usuario" &>/dev/null; then
  echo "El usuario '$usuario' ya existe."
  exit 1
fi

# Crear el usuario
sudo useradd -m -G "$grupo,sudo" "$usuario"
sudo usermod -s /bin/bash "$usuario"
echo "$usuario:$password" | sudo chpasswd
