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