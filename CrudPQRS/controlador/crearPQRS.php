<?php
$tipoPQRS = $_POST['tipoPQRS'];
$tituloPqrs = $_POST['tituloPqrs'];
$descripcionPQRS = $_POST['descripcionPQRS'];
$idCliente = $_POST['idCliente'];

// Establece la zona horaria para asegurarte de que la fecha sea correcta
date_default_timezone_set('America/Bogota');

// Obtiene la fecha actual en formato yyyy-mm-dd hh:mm:ss
$fechaActual = date('Y-m-d H:i:s');

$conexion = mysqli_connect('localhost:3306', 'root', '', 'nowtify');

if (!$conexion) {
    die("Error en la conexión a la base de datos: " . mysqli_connect_error());
}

$consulta = "INSERT INTO pqrs (idPqrs, categoriaPqrs, tituloPqrs, fechaPqrs, descripcion, estadoPqrs, idCliente) 
             VALUES (null, '$tipoPQRS', '$tituloPqrs', '$fechaActual', '$descripcionPQRS', 'Activo', '$idCliente')";

$resultado = mysqli_query($conexion, $consulta);

if ($resultado) {
    echo "<script>alert('Datos almacenados correctamente'); location.href='../index.php';</script>";
} else {
    echo "<script>alert('Error al almacenar los datos'); location.href='../index.php';</script>";
}

mysqli_close($conexion);
?>
