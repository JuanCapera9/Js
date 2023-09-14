<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crud PQRS</title>
    <!--Biblioteca de bootstrap CSS-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/b80bf1e3ae.js" crossorigin="anonymous"></script>

</head>

<body>
    <h1 class="text-center p-3">PQRS Dashboard</h1>
    <div class="container-fluid row">
        <form action="controlador/crearPQRS.php" method="post" class="col-4 p-3">
            <h3 class="text-center text-secondary">Registro PQRS</h3>

            <!--Consultar cliente-->
            <label class="form-label">Cedula Cliente</label>
            <div class="container">
                <div class="input-group mb-3">
                    <input type="text" class="form-control" id="cedula" placeholder="Cedula">
                    <div class="input-group-append">
                        <button onclick="consultarCliente();" class="btn btn-outline-secondary" type="button">
                            <i class="fa-solid fa-magnifying-glass" style="color: #2573da;"></i>
                        </button>
                    </div>
                </div>
            </div>
            
            <div class="mb-3">
                <label class="form-label">Id Cliente</label>
                <input type="text" class="form-control" name="idCliente" placeholder="IdCliente">
            </div>
            <div class="mb-3">
                <label class="form-label">Tipo PQRS</label>
                <select name="tipoPQRS" class="form-control">
                    <option selected="true" disabled="disabled">Seleccione su tipo solicitud</option>
                    <option value="Pregunta">Pregunta</option>
                    <option value="Queja">Queja</option>
                    <option value="Reclamo">Reclamo</option>
                    <option value="Sugerencia">Sugerencia</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Titulo</label>
                <input type="text" class="form-control" name="tituloPqrs" placeholder="Titulo">
            </div>
            <div class="mb-3">
                <label class="form-label">Descripcion</label>
                <textarea type="text" class="form-control" name="descripcionPQRS" rows="5"
                    placeholder="Cuentanos tu experiencia con nosotros..."></textarea>
            </div>
            <button type="submit" class="btn btn-primary" name="btnEnviar" value="ok">Enviar</button>
        </form>
        <div class="col-8 p-5">
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
                        <th scope="col">Responder</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <?php
                        while ($filas = mysqli_fetch_row($resultado)) {

                            echo '<tr><td>' . $filas[0] . '</td><td>' . $filas[1] . '</td><td>' . $filas[2] . '</td><td>' . $filas[3] . '</td><td>' . $filas[4] . '</td><td>' . $filas[5] . '</td><td>' . $filas[6] . '</td>
                            <td><a href="" class="btn btn-sm btn-info"><i class="fa-solid fa-pen-to-square"></i></a></td></tr>';
                        }
                        echo '</table>';
                        ?>

                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal -->
    <div class="modal fade bd-example-modal-lg" id="resultadoModal" tabindex="-1" role="dialog"
        aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Resultado de la consulta</h4>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                </div>
                <div class="modal-body">
                    <table class="table">
                        <thead>
                            <tr>
                                <th>IdCliente</th>
                                <th>Cedula</th>
                                <th>Nombre Completo</th>
                                <th>Email</th>
                                <th>Telefono</th>
                            </tr>
                        </thead>
                        <tbody id="tablaResultado">
                            <!-- Aquí se insertarán las filas de resultados -->
                        </tbody>
                    </table>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" id="usarID" data-dismiss="modal">Usar ID</button>
                </div>

            </div>
        </div>
    </div>

    <script>
        function consultarCliente() {
            var cedula = document.getElementById('cedula').value;

            // Realizar la solicitud AJAX
            $.ajax({
                type: "POST", // O el método que uses (GET, POST, etc.)
                url: "./controlador/consulta.php", // Reemplaza con la URL de tu script de consulta SQL
                data: { cedula: cedula },
                success: function (data) {
                    // Llenar la tabla con el resultado de la consulta
                    $('#tablaResultado').html(data);
                    // Mostrar el modal
                    $('#resultadoModal').modal('show');
                },
                error: function (xhr, status, error) {
                    console.error("Error en la solicitud AJAX: " + error);
                }
            });
        }
    </script>



    <!--js de bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
        crossorigin="anonymous"></script>
    <script src="./js/main.js"></script>
    <!-- Agrega los enlaces a las bibliotecas de Bootstrap y jQuery -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</body>

</html>