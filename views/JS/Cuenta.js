$(document).ready(function () {





    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });

  

    $("#boton1").on('click', function () {
        $(".division1").removeClass("d-none");
        $(".division2").addClass("d-none");
    });

    $("#boton2").on('click', function () {
        $(".division1").addClass("d-none");
        $(".division2").removeClass("d-none");
    });

      
      });



    
$("#formularioCuenta").submit(function (e) { 
    e.preventDefault();
    var name = document.getElementById("nameP").value;
    var email = document.getElementById("emailP").value;
    var password = document.getElementById("passwordP").value;
    var opcion = document.getElementById("opcion").value;
    var fecha = document.getElementById("birthdaytime").value;
debugger
 var ps = validar_clave(password);
 var boolean = true;
    if (ps == false || password =="") {
     debugger
     toastr.error('Error','Selecciona una opcion');
 boolean = false;
    }
    if (email == "" || name == "") {

        toastr.error('Error','Llena los campos correctamente');
        boolean = false;
    }
    if((opcion == null)){

        toastr.error('Error','Selecciona una opcion');
        boolean = false;
      
    }if(fecha == null){

        toastr.error('Error','Selecciona una fecha');
        boolean = false;
    }
    if(boolean == true){
        toastr.success('Bien', 'Has modificado la información correctamente');
    }
   

})


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
    








