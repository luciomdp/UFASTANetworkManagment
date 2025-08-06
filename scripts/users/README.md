# Gestión de Usuarios en Linux

Este repositorio contiene dos scripts bash diseñados para facilitar la **creación** y **eliminación** de usuarios en sistemas Linux. Son útiles para entornos educativos, laboratorios o sistemas donde se requiere gestionar usuarios de forma repetitiva y controlada.

---

## Scripts incluidos

### 1. `create_user.sh`

#### Propósito:
Crear un nuevo usuario, asignarle un grupo (`estudiantes`), agregarlo al grupo `sudo`, establecer su contraseña y asegurar que su shell sea `/bin/bash`.

#### Uso:
```bash
./create_user.sh <nombre_de_usuario> <contraseña>
```
Ejemplo:
```bash
./create_user.sh maxis 1234
```
Funcionalidad principal:
- Verifica que se hayan pasado los argumentos necesarios.

- Crea el grupo estudiantes si no existe.

- Comprueba si el usuario ya existe.

- Crea el usuario con directorio home (-m), y lo agrega a los grupos estudiantes y sudo.

- Establece su shell como /bin/bash.

- Asigna la contraseña especificada.

### 2. `del_user.sh`

#### Propósito:
Eliminar completamente un usuario del sistema, asegurándose de cerrar sus procesos activos y removerlo de sus grupos secundarios.

#### Uso:
```bash
./del_user.sh <nombre_de_usuario>
```
Ejemplo:
```bash
./del_user.sh maxis
```
Funcionalidad principal:
- Verifica que se haya proporcionado un nombre de usuario.

- Comprueba si el usuario existe.

- Si tiene procesos activos, los termina con pkill y espera que finalicen.

- Obtiene los grupos del usuario (id -nG) y su grupo primario (id -gn).

- Lo elimina de todos los grupos secundarios.

- Elimina al usuario completamente con userdel -r.

## Requisitos
- Privilegios de superusuario (sudo).

- Bash shell.

- Linux con comandos estándar (useradd, userdel, pkill, etc).

## Consideraciones
- No debes ejecutar del_user.sh desde una sesión activa del usuario que vas a eliminar.

- Se asume que el grupo estudiantes es usado como grupo base para nuevos usuarios.


