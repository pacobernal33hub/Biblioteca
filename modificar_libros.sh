#!/bin/bash

# Variables de conexión
DB_NAME="biblioteca"
DB_USER="paco"
DB_PASS="0113"  # Reemplaza con la contraseña del usuario 'paco'

# Función para modificar un libro
modificar_libro() {
    local id=$1
    local nombre=$2
    local autor=$3
    local editorial=$4
    local leido=$5
    local estanteria=$6

    # Construir la consulta de actualización
    local query="UPDATE libros SET "
    local set_clause=""

    [[ -n "$nombre" ]] && set_clause+="nombre='$nombre', "
    [[ -n "$autor" ]] && set_clause+="autor='$autor', "
    [[ -n "$editorial" ]] && set_clause+="editorial='$editorial', "
    [[ -n "$leido" ]] && set_clause+="leido='$leido', "
    [[ -n "$estanteria" ]] && set_clause+="estanteria='$estanteria' "

    # Eliminar la última coma y espacio si hay algo en set_clause
    if [[ -n "$set_clause" ]]; then
        set_clause=${set_clause%, }  # Eliminar la última coma y espacio
        query+="$set_clause WHERE id=$id;"
        
        # Ejecutar la consulta
        mysql -u "$DB_USER" -p"$DB_PASS" "$DB_NAME" -e "$query"
    else
        echo "No se proporcionaron nuevos valores para modificar."
    fi
}

# Solicitar el ID del libro a modificar
read -p "Introduce el ID del libro que deseas modificar: " id

# Preguntar por los nuevos valores
echo "Introduce los nuevos valores (deja en blanco si no deseas modificar):"
read -p "Nuevo nombre: " nombre
read -p "Nuevo autor: " autor
read -p "Nueva editorial: " editorial
read -p "¿Nuevo estado leído? (sí/no): " leido
read -p "Nueva estantería: " estanteria

# Modificar el libro en la base de datos
modificar_libro "$id" "$nombre" "$autor" "$editorial" "$leido" "$estanteria"

echo "Registro modificado correctamente."
