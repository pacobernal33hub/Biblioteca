#!/bin/bash

# Variables de conexión
DB_NAME="biblioteca"
DB_USER="paco"
DB_PASS="0113"  # Reemplaza con la contraseña del usuario 'paco'

# Solicitar el nombre del libro a buscar
read -p "Introduce el nombre del libro a buscar (puedes usar * como comodín): " nombre

# Reemplazar * por % para la consulta SQL
nombre_sql="${nombre//\*/%}"

# Consultar los registros en la base de datos
mysql -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "SELECT * FROM libros WHERE nombre LIKE '$nombre_sql';"