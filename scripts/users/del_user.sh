#!/bin/bash

if [ -z "$1" ]; then
  echo "Uso: $0 <nombre_de_usuario>"
  exit 1
fi

usuario="$1"

# Verificar si el usuario existe
if ! id "$usuario" &>/dev/null; then
  echo "El usuario '$usuario' no existe."
  exit 1
fi

# Verificar si el usuario tiene procesos activos y terminarlos
if pgrep -u "$usuario" > /dev/null; then
  echo "El usuario '$usuario' tiene procesos activos. Terminando procesos..."
  sudo pkill -9 -u "$usuario"

  while pgrep -u "$usuario" > /dev/null; do
    echo "Esperando a que se terminen los procesos del usuario '$usuario'..."
    sleep 1
  done
fi

# Eliminar al usuario de sus grupos secundarios
grupos=$(id -nG "$usuario")
grupo_primario=$(id -gn "$usuario")

for grupo in $grupos; do
  if [ "$grupo" != "$grupo_primario" ]; then
    sudo deluser "$usuario" "$grupo"
  fi
done

# Eliminar al usuario
sudo userdel -r "$usuario"
if [ $? -ne 0 ]; then
  echo "Error: no se pudo eliminar el usuario '$usuario'."
  exit 1
fi

echo "El usuario '$usuario' ha sido eliminado correctamente."
