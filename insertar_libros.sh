#!/bin/bash

# Variables de conexión
DB_NAME="biblioteca"
DB_USER="paco"
DB_PASS="0113"  # Reemplaza con la contraseña del usuario 'paco'

# Función para insertar un libro
insertar_libro() {
    local nombre=$1
    local autor=$2
    local editorial=$3
    local leido=$4
    local estanteria=$5

    mysql -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "INSERT INTO libros (nombre, autor, editorial, leido, estanteria) VALUES ('$nombre', '$autor', '$editorial', '$leido', '$estanteria');"
}

# Bucle para añadir libros
while true; do
    echo "Introduce los detalles del libro:"

    read -p "Nombre: " nombre
    read -p "Autor: " autor
    read -p "Editorial: " editorial
    read -p "¿Leído? (sí/no): " leido
    read -p "Estantería: " estanteria

    # Insertar el libro en la base de datos
    insertar_libro "$nombre" "$autor" "$editorial" "$leido" "$estanteria"

    read -p "¿Quieres añadir otro libro? (sí/no): " respuesta
    if [[ "$respuesta" != "sí" ]]; then
        break
    fi
done

echo "Proceso finalizado."