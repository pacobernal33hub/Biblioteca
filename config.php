<?php
$host = 'localhost'; // Cambia si es necesario
$db = 'biblioteca';
$user = 'paco'; // Cambia si es necesario
$pass = '0113'; // Cambia por la contraseña real

try {
    $pdo = new PDO("mysql:host=$host;dbname=$db;charset=utf8", $user, $pass);
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
} catch (PDOException $e) {
    echo "Error de conexión: " . $e->getMessage();
}
?>