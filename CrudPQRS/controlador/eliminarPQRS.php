<?php
$conexion = mysqli_connect('localhost:3306', 'root', '', 'nowtify');

if (!$conexion) {
    die("Error en la conexión a la base de datos: " . mysqli_connect_error());
}

if (!empty ($_GET ["id"])){
    $id = $_GET ["id"];
    $consulta = "DELETE FROM pqrs WHERE idpqrs = '$id';";
    $resultado = mysqli_query($conexion, $consulta);

if ($resultado){
    echo "<script>alert('PQRS Eliminada correctamente');
                location.href='../index.php'
            </script>";
} else{
    echo "<script>alert('PQRS Eliminada erroneamente');
                location.href='../index.php'
            </script>";
}
}
