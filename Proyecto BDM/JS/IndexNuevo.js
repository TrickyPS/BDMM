$(document).ready(function () {



});






 function validateMyForm() {
    var email = document.getElementById("emaili").value;
    var password = document.getElementById("passwordi").value;
debugger
 var ps = validar_clave(password);
 

    if (ps == false || password =="") {
     debugger
        alert("Coloca una contraseña correcta")

    }
    if (email == "") {

        alert("llena bien los campos")
    }
    else{
        alert("Has ingresado incorrectamente")
    }

}

function validateMyFormR() {
    var name = document.getElementById("nombrer").value;
    var email = document.getElementById("emailr").value;
    var password = document.getElementById("passwordr").value;
    var Estudiante = document.getElementById("tipo").value;
    
debugger
 var ps = validar_clave(password);
 
 
    if (ps == false || password =="") {
     debugger
        alert("Coloca una contraseña correcta")

    }
    if (email == "" || name == "") {

        alert("llena bien los campos")
    }
    if((Estudiante == null)){

        alert("Selecciona una opcion");
      
    }
    else{
        alert("Te has registrado correctamente")
    }

}

function validar_clave(password) {
    debugger
    if (password.length >= 8) {
debugger
        var mayuscula = false;
        var minuscula = false;
        var numero = false;
        var caracter_raro = false;

        for (var i = 0; i < password.length; i++) {
            if (password.charCodeAt(i) >= 65 && password.charCodeAt(i) <= 90) {
                debugger
                mayuscula = true;
            } else if (password.charCodeAt(i) >= 97 && password.charCodeAt(i) <= 122) {
                debugger
                minuscula = true;
            } else if (password.charCodeAt(i) >= 48 && password.charCodeAt(i) <= 57) {
                debugger
                numero = true;
            }
            else{
                caracter_raro = true;
            }
        }
        if (mayuscula == true && minuscula == true && caracter_raro == true && numero == true) {
            return true;
        }
    }
    return false;
}
