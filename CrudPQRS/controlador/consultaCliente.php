<?php
function consultarCliente()
{
    $codigo = $_POST['consultarC'];

    $conexion = mysqli_connect('localhost:3306', 'root', '', 'nowtify');
    $consulta = "SELECT * FROM cliente WHERE idCliente = '$codigo';";
    $resultado = mysqli_query($conexion, $consulta);

    $filas = mysqli_num_rows($resultado);

    while ($filas = mysqli_fetch_row($resultado)) {
        echo ('<form action = "guardar.php" method= "post"
    <label>Codigo Producto</label>
    <input type = "text" name = "codigo" value = "' . $filas[0] . '" readonly><br>
    <label>Nombre Producto</label>
    <input type = "text" name = "nombre" value = "' . $filas[1] . '"><br>
    <label>Cantidad Producto</label>
    <input type = "number" name = "cantidad" value = "' . $filas[2] . '"><br>
    <label>Marca Producto</label>
    <input type = "text" name = "marca" value = "' . $filas[3] . '"><br>
    <label>Precio Producto</label>
    <input type = "number" name = "precio" value = "' . $filas[4] . '"><br>
    <button type = "submit">Guardar</button>
    </form>
    ');

    }
}
?>