
/* Declarando la función 'myFunc' */
function calcularPromedio(num1, num2, num3)
{   
var num1 = parseFloat(document.getElementById('n1').value);
var num2 = parseFloat(document.getElementById('n2').value);
var num3 = parseFloat(document.getElementById('n3').value);

var mayor;
var menor;

    var calculoPromedio = (num1+num2+num3) / 3;

    if (num1 >= num2 && num2 >= num3){
        var mayor = num1;
        var menor = num3;
    }else if (num1 >= num3 && num3 >= num2) {
        var mayor = num1;
        var menor = num2;
    }else if (num2 >= num1 && num1 >= num3) {
        var mayor = num2;
        var menor = num3;
    }
     else if (num2 >= num3 && num3 >= num1) {
        var mayor = num2;
        var menor = num1;
    } else if (num3 >= num2 && num2 >= num1){ 
        var mayor = num3;
        var menor = num1;
    } else if (num3 >= num1 && num1 >= num2){ 
        var mayor = num3;
        var menor = num2;
    }
    
if (calculoPromedio >= 3.0 ) {
    alert('su promedio es: ' + calculoPromedio.toFixed(2) + "\nUsted aprobo. \nSu mejor nota es: "+ mayor+"\nY su peor nota es: "+ menor);
}
else if (calculoPromedio < 3.0 ){
    alert('su promedio es: ' + calculoPromedio.toFixed(2) + "\nUsted reprobo. \nSu mejor nota es: "+ mayor+"\nY su peor nota es: "+ menor);

}
}

function calcularSueldo(nombre, sueldo, tiempoTrabajado)
{   
var nombre = document.getElementById('nombre').value;
var sueldo = parseFloat(document.getElementById('sueldo').value);
var tiempoTrabajado = parseFloat(document.getElementById('tiempoTrabajado').value);

var bonificacion;

    if (tiempoTrabajado >= 5){
        bonificacion = sueldo * 0.2
        sueldo = sueldo + bonificacion
        alert('Estimado/a ' + nombre + ' su tiempo en la empresa es: ' + tiempoTrabajado + ' años, tiene una bonificacion del 20% \nSu sueldo es: ' + sueldo);
    }else if (tiempoTrabajado < 0){
        alert('Estimado/a ' + nombre + ' Los años trabajados en la empresa son incorrectos, por favor verifique su información');
    }
    else{
        bonificacion = sueldo * 0.1
        sueldo = sueldo + bonificacion
        alert('Estimado/a ' + nombre + ' su tiempo en la empresa es: ' + tiempoTrabajado + ' años, tiene una bonificacion del 10% \nSu sueldo es: ' + sueldo);
    }
}

function Solicitud(nombre, genero, edad, estatura, peso, colorOjos)
{   
var nombre = document.getElementById('nombre').value;
var genero = document.getElementById('genero').value;
var edad = parseInt(document.getElementById('edad').value);
var estatura = parseFloat(document.getElementById('peso').value);
var peso = parseFloat(document.getElementById('peso').value);
var colorOjos = document.getElementById('colorOjos').value;

    if (genero == "Hombre" && edad <= 20 && estatura >= 1.75 && peso <= 70 && colorOjos == "Azul"){
        alert("Estimado/a " + nombre + " Usted cumple con los requisitos, queda contratado!!")
    }else{
        alert("Estimado/a " + nombre + " Usted no cumple con los requisitos para ser contratado, gracias por su solicitud")
    }
}

function calcularNotas(notap1, notap2, notap3, notaf, notatf)
{   
var notap1 = parseFloat(document.getElementById('notap1').value);
var notap2 = parseFloat(document.getElementById('notap2').value);
var notap3 = parseFloat(document.getElementById('notap3').value);
var notaf = parseFloat(document.getElementById('notaf').value);
var notatf = parseFloat(document.getElementById('notatf').value);

notaparcial = ((notap1 + notap2 + notap3) / 3) * 0.55;
notaf = notaf * 0.3;
notatf = notatf * 0.15;
calificacion = notaparcial + notaf + notatf;
alert("Su nota final en la materia de fisica es: " + calificacion)
}

function raizCuadrada(){
    var raiz = document.getElementById("raiz")
    for (var numero = 1; numero <= 10; numero++){
        var cuadrado = numero * numero;
        var raizCuadrad = Math.sqrt(numero);

        const list = document.createElement("td");
        list.textContent = numero +" "+ cuadrado +" "+ raizCuadrad.toFixed(2) + "\n";
        raiz.appendChild(list);
    }
}

function numdel1al10(){
    var numeros = document.getElementById("numeros")
    var numero = 1;

    while (numero <= 10){
        const list = document.createElement("td");
        list.textContent = numero;
        numeros.appendChild(list);
        numero +=1;
    }
}
function Transaccion(valor){
    var valor = parseFloat(document.getElementById('valor').value);
    var opcion = document.getElementById('opcion').value;
    var valorcuenta = 100;
    switch (opcion){

        case "Consignar":
        valorcuenta = valorcuenta +  valor
        alert ("El valor de su cuenta es: "+ valorcuenta)
        break;

        case "Retirar":
        valorcuenta = valorcuenta -  valor
        if (valor >  valorcuenta){
            alert ("Fondos insuficientes")
        } else {
            alert ("El valor de su cuenta es: "+ valorcuenta)
        }
        break;
        
        case "Consultar saldo":
        alert ("El valor de su cuenta es: "+ valorcuenta)
        break;

        case "Cambiar Clave":
        var clave;
        clave = prompt("Ingrese la nueva clave por favor");
        alert ("Su clave fue cambiada con exito!")
        break;

        case "Salir":
        alert ("Usted salio de la cuenta con exito")
        break;
        
    }
}