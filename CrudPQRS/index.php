<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crud PQRS</title>
    <!-- Biblioteca de bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
    <script src="https://kit.fontawesome.com/b80bf1e3ae.js" crossorigin="anonymous"></script>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
</head>

<body>
    <header class="bg-dark text-white">
        <h2 class="p-2"><i class="fa-solid fa-car"></i> Nowtify Logist</h2>
    </header>
    <div class="container-fluid row">
        <form action="controlador/crearPQRS.php" method="post" class="col-4 text- p-3" id="pqrsForm">
            <h3 class="text-center text-secondary">Registro PQRS</h3>

            <!-- Consultar cliente -->
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
                <input type="text" class="form-control" name="idCliente" id="idCliente" placeholder="IdCliente">
                <p id="idClienteError" style="color: red;"></p>
            </div>
            <div class="mb-3">
                <label class="form-label">Tipo PQRS</label>
                <select name="tipoPQRS" class="form-control" required>
                    <option value="Seleccione su tipo solicitud" disabled="disabled">Seleccione su tipo solicitud</option>
                    <option value="Pregunta">Pregunta</option>
                    <option value="Queja">Queja</option>
                    <option value="Reclamo">Reclamo</option>
                    <option value="Sugerencia">Sugerencia</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">Titulo</label>
                <input type="text" class="form-control" name="tituloPqrs" id="tituloPqrs" placeholder="Titulo">
                <p id="tituloError" style="color: red;"></p>
            </div>
            <div class="mb-3">
                <label class="form-label">Descripción</label>
                <textarea class="form-control" name="descripcionPQRS" id="descripcionPQRS" rows="5" placeholder="Cuentanos tu experiencia con nosotros..."></textarea>
                <p id="descripcionError" style="color: red;"></p>
            </div>
            <button type="button" onclick="validarFormulario();" class="btn btn-dark" name="btnEnviar" value="ok">Enviar</button>
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
                <thead class="table-primary">
                    <tr>
                        <th scope="col">Id</th>
                        <th scope="col">Categoria</th>
                        <th scope="col">Titulo</th>
                        <th scope="col">Fecha</th>
                        <th scope="col">Descripcion</th>
                        <th scope="col">Estado</th>
                        <th scope="col">Nombre Cliente</th>
                        <th scope="col">Estado/Eliminar</td>
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
                        <td>
                            <a href="./vista/modificar.php?id=' . $idPqrs . '" class="btn btn-sm btn-info editar-pqrs"><i class="fa-solid fa-pen-to-square"></i></a>
                            <a href="./controlador/eliminarPQRS.php?id=' . $idPqrs . '" class="btn btn-sm btn-danger"><i class="fa-solid fa-trash"></i></a>
                        </td>
                    </tr>';
                        }
                        ?>
                    </tr>
                </tbody>
            </table>
        </div>
    </div>

    <!-- Modal consultar cliente -->
    <div class="modal fade bd-example-modal-lg" id="resultadoModal" tabindex="-1" role="dialog" aria-labelledby="myLargeModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-lg">
            <div class="modal-content">
                <div class="modal-header">
                    <h4 class="modal-title">Resultado de la consulta</h4>
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
            </div>
        </div>
    </div>

    <script>
        function validarFormulario() {
            var idClienteRegex = /^[0-9]+$/;
            var idCliente = document.getElementById("idCliente").value;
            var descripcion = document.getElementById("descripcionPQRS").value;
            var tituloPqrs = document.getElementById("tituloPqrs").value;

            // Validación del campo "Id Cliente"
            if (!idClienteRegex.test(idCliente)) {
                document.getElementById("idClienteError").innerText = "El ID del cliente debe contener solo números o no puede estar vacio.";
                return;
            } else {
                document.getElementById("idClienteError").innerText = "";
            }

            // Validación del campo "Descripción"
            if (descripcion.trim() === "") {
                document.getElementById("descripcionError").innerText = "La descripción no puede estar vacía.";
                return;
            } else {
                document.getElementById("descripcionError").innerText = "";
            }

            // Validación del campo "Titulo"
            var tituloRegex = /^[a-zA-Z]/; // Al menos tres letras
            if (!tituloRegex.test(tituloPqrs)) {
                document.getElementById("tituloError").innerText = "El campo 'Titulo' debe contener al menos tres letras.";
                return;
            } else {
                document.getElementById("tituloError").innerText = "";
            }

            // Si todas las validaciones pasan, envía el formulario
            document.getElementById("pqrsForm").submit();
        }
    </script>

    <script>
        function consultarCliente() {
            var cedula = document.getElementById('cedula').value;

            // Realizar la solicitud AJAX
            $.ajax({
                type: "POST", // O el método que uses (GET, POST, etc.)
                url: "./controlador/consulta.php", // Reemplaza con la URL de tu script de consulta SQL
                data: {
                    cedula: cedula
                },
                success: function(data) {
                    // Llenar la tabla con el resultado de la consulta
                    $('#tablaResultado').html(data);
                    // Mostrar el modal
                    $('#resultadoModal').modal('show');
                },
            });
        }
    </script>

    <!--Jquery -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <!--js de bootstrap -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="./js/main.js"></script>
    <!-- Agrega los enlaces a las bibliotecas de Bootstrap -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
</body>

</html>