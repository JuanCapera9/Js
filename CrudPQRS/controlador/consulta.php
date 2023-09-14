<?php
// Conexión a la base de datos
$conexion = mysqli_connect('localhost', 'root', '', 'nowtify');

// Obtener la cédula del cliente desde la solicitud AJAX
$cedula = $_POST['cedula'];

// Consulta SQL para obtener los datos del cliente
$query = "SELECT C.IDCliente, U.cedula, CONCAT(U.nombre1, ' ', U.apellido1) AS nombre, U.email, U.telefono
          FROM cliente C
          INNER JOIN Usuarios U ON C.idUsuario = U.idUsuario
          WHERE U.Cedula = '$cedula'";

$resultado = mysqli_query($conexion, $query);

// Generar las filas de resultados en formato HTML
while ($fila = mysqli_fetch_assoc($resultado)) {
    echo '<tr>';
    echo '<td>' . $fila['IDCliente'] . '</td>';
    echo '<td>' . $fila['cedula'] . '</td>';
    echo '<td>' . $fila['nombre'] . '</td>';
    echo '<td>' . $fila['email'] . '</td>';
    echo '<td>' . $fila['telefono'] . '</td>';
    echo '</tr>';
}

// Cerrar la conexión a la base de datos
mysqli_close($conexion);
?>