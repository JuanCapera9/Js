<?php
$estadoPQRS = $_POST['estadoPQRS'];
$tituloPqrs = $_POST['tituloPqrs'];
$id = $_POST["id"];

$conexion = mysqli_connect('localhost:3306', 'root', '', 'nowtify');

if (!$conexion) {
    die("Error en la conexión a la base de datos: " . mysqli_connect_error());
}

$consulta = "UPDATE pqrs SET estadoPqrs = '$estadoPQRS', tituloPqrs = '$tituloPqrs'
            WHERE idpqrs = '$id';";
$resultado = mysqli_query($conexion, $consulta);

if ($resultado){
    echo "<script>alert('Datos almacenados correctamente');
                location.href='../index.php'
            </script>";
} else{
    echo "<script>alert('Datos almacenados erroneamente');
                location.href='../index.php'
            </script>";
}
?>

