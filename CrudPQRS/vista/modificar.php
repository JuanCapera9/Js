<?php
$id = $_GET["id"];

$conexion = mysqli_connect('localhost:3306', 'root', '', 'nowtify');
$consulta = "SELECT * FROM pqrs WHERE idpqrs = '$id';";
$resultado = mysqli_query($conexion, $consulta);
?>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Modificar PQRS</title>
    <!--Biblioteca de bootstrap CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">    <script src="https://kit.fontawesome.com/b80bf1e3ae.js" crossorigin="anonymous"></script>
</head>

<body>
<header class="bg-dark text-white">
        <h2 class="p-2"><i class="fa-solid fa-car"></i> Nowtify Logist</h2>
    </header>
    <div>
    <h3 class="text-center p-3">Modificar PQRS</h3>
    <form action="../controlador/modificarPQRS.php" method="post" class="col-4 shadow-lg bg-body m-auto p-3" onsubmit="return validarFormulario();">
        <input type="hidden" name="id" value="<?= $_GET["id"] ?>">
        <div id="mensajeError" style="color: red;"></div>
        <?php

        $filas = mysqli_num_rows($resultado);

        while ($filas = mysqli_fetch_row($resultado)) { ?>
            <div class="mb-3">
                <label class="form-label">Titulo</label>
                <input type="text" class="form-control" name="tituloPqrs" placeholder="Titulo" value="<?= $filas[2] ?>">
            </div>
            <div class="mb-3">
                <label class="form-label">Estado PQRS</label>
                <select name="estadoPQRS" class="form-control">
                    <?php
                    // Establece el valor seleccionado de estadoPQRS
                    $estadoSeleccionado = $filas[5]; // Asumiendo que el índice 5 contiene el valor de estadoPQRS
                    $opciones = ["Activo", "Inactivo", "En Proceso", "Resuelto", "Rechazado"];

                    foreach ($opciones as $opcion) {
                        // Compara y marca la opción seleccionada
                        $selected = ($estadoSeleccionado === $opcion) ? "selected" : "";
                        echo "<option value=\"$opcion\" $selected>$opcion</option>";
                    }
                    ?>
                </select>
            </div>
        <?php }
        ?>
        <div class="d-grid gap-2">
        <button type="submit" class="btn btn-primary" name="btnEnviar" value="ok">Enviar</button>
        </div>
    </form>
    
    <div class="col-8 m-auto p-5">
            <table class="table table-hover">
                <?php
                $conexion = mysqli_connect('localhost:3306', 'root', '', 'nowtify');
                $consulta = "SELECT 
                pq.idPqrs, pq.categoriaPqrs, pq.tituloPqrs, pq.fechaPqrs, pq.descripcion, pq.estadoPqrs, 
                (SELECT CONCAT(u.nombre1, ' ', u.apellido1) FROM cliente c INNER JOIN usuarios u ON c.idUsuario = u.idUsuario WHERE c.idCliente = pq.idCliente) AS nombre_completo
            FROM pqrs pq;";
                $resultado = mysqli_query($conexion, $consulta);
                $filas = mysqli_num_rows($resultado);
                ?>
                <thead class="table-info">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Categoria</th>
                        <th scope="col">Titulo</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Descripcion</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Nombre Cliente</th>
                    </tr>
                    </th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <?php
                        while ($fila = mysqli_fetch_assoc($resultado)) {
                            // Utiliza $fila['idPqrs'] para obtener el ID de la fila
                            $idPqrs = $fila['idPqrs'];

                            echo '<tr>
                        <td>' . $idPqrs . '</td>
                        <td>' . $fila['categoriaPqrs'] . '</td>
                        <td>' . $fila['tituloPqrs'] . '</td>
                        <td>' . $fila['fechaPqrs'] . '</td>
                        <td>' . $fila['descripcion'] . '</td>
                        <td>' . $fila['estadoPqrs'] . '</td>
                        <td>' . $fila['nombre_completo'] . '</td>
                    </tr>';
                        }
                        ?>
                    </tr>
                </tbody>
            </table>
        </div>

    <script>
        function validarFormulario() {
            var tituloPqrs = document.querySelector('input[name="tituloPqrs"]').value.trim();
            var mensajeError = document.getElementById('mensajeError');

            // Expresión regular para validar que el campo tenga al menos 3 letras y no sea una sola letra
            var regex = /^[a-zA-Z]{3,}$/;

            // Verifica si el campo "Titulo" está vacío o no cumple con la expresión regular
            if (tituloPqrs === "" || !regex.test(tituloPqrs)) {
                mensajeError.textContent = "El campo 'Titulo' debe contener al menos tres letras.";
                return false; // Evita que el formulario se envíe
            }

            // Si la validación pasó, borra el mensaje de error
            mensajeError.textContent = "";
            return true; // Permite que el formulario se envíe
        }
    </script>

    <!--Jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!--js de bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
    <script src="./js/main.js"></script>
    <!-- Agrega los enlaces a las bibliotecas de Bootstrap y jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</body>
</html>