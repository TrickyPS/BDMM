$(document).ready(function () {

    const createdAt = localStorage.getItem("created_at").substr(0, 10);
    const avatar = JSON.parse(localStorage.getItem("avatar"))
    const name = localStorage.getItem("name");
    const birth = localStorage.getItem("date_birth");
    const email = localStorage.getItem("email");
    const pass = localStorage.getItem("password");
    const gender = JSON.parse(localStorage.getItem("gender"));
    const isStudent = localStorage.getItem("is_student");
    $("#nameUser").html(localStorage.getItem("name"));
    $("#createdAt").html(`Cuenta creada en: ${createdAt}`);
    $('#avatar').attr("src", avatar == null || avatar == "" ? "./../IMG/user.png" : `data:${typeImage};base64,${avatar}`);
    $("#nameP").val(name);
    $("#emailP").val(email);
    $("#passwordP").val(pass);
    $("#genderP").val(gender === null ? "" : gender);
    $("#birthdaytime").val(birth)

    $("#isStudent").html(isStudent == "0" ? "Profesor" : "Estudiante")
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


/////////////////////////// USER UPDATE

$("#formularioCuenta").submit( function (e) {
    e.preventDefault();
    var name = document.getElementById("nameP").value;
    var email = document.getElementById("emailP").value;
    var password = document.getElementById("passwordP").value;
    var gender = document.getElementById("genderP").value;
    var birth = document.getElementById("birthdaytime").value;
    var avatar = $('#updateAvatar').prop('files');
    var ps = validar_clave(password);
    var boolean = true;
    if (ps == false || password == "") {
        toastr.error('Error', 'Contraseña debe tener al menos 8 caracteres,un número y un carácater raro');
        boolean = false;
    }
    if (email == "" || name == "") {
        toastr.error('Error', 'Llena los campos correctamente');
        boolean = false;
    }
    if (avatar.length > 0) {
        if (!(avatar[0].type == "image/jpg" || avatar[0].type == "image/png" || avatar[0].type == "image/jpeg")) {
            toastr.error('Error', 'Solo se aceptan imagenes .jpg y .png');
            boolean = false;

        }
    }
    if (boolean == true) {
        var id = JSON.parse(localStorage.getItem("id"));
        //var type = avatar.length == 0 ? null : avatar[0].type;
        avatar = avatar.length == 0 ? null : avatar[0] ;
        //var files = avatar; //$('#updateAvatar')[0].files[0];
        var formData = new FormData();
        formData.append('method',"PUT");
        formData.append('id',id);
        formData.append('avatar',avatar);
        formData.append('name',name);
        formData.append('pass',password);
        formData.append('email',email);
        formData.append('gender',gender);
        formData.append('birth',birth);
        
        $.ajax({
            type: "POST",
            url: "./../../controllers/UserController.php",
            enctype: "multipart/form-data",
            data: formData, 
            dataType:"json",
            processData: false, 
            contentType: false ,
            success: function (response) {
                if (response.name) {
                    
                    toastr.info('Bien', 'Perfil actualizado');
                    setUser(response);
                    setTimeout(function () { location.reload(); }, 700);
                } else {
                    
                    toastr.error('Error', 'Error al actualizar usuario');
                }
            },
            error: function (x, y, z) {
                
                toastr.error('Error', 'Eror interno al actualizar usuario');
            }
        });

    }


})

const toBase64 = file => new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.readAsDataURL(file);
    reader.onload = () => resolve(reader.result);
    reader.onerror = error => reject(error);
});

async function  showImage(){
    var avatar = $('#updateAvatar').prop('files');
    var image = await toBase64(avatar[0]);
    debugger
    $('#avatar').attr("src",image);
}

function validar_clave(password) {

    if (password.length >= 8) {

        var mayuscula = false;
        var minuscula = false;
        var numero = false;
        var caracter_raro = false;

        for (var i = 0; i < password.length; i++) {
            if (password.charCodeAt(i) >= 65 && password.charCodeAt(i) <= 90) {

                mayuscula = true;
            } else if (password.charCodeAt(i) >= 97 && password.charCodeAt(i) <= 122) {

                minuscula = true;
            } else if (password.charCodeAt(i) >= 48 && password.charCodeAt(i) <= 57) {

                numero = true;
            }
            else {
                caracter_raro = true;
            }
        }
        if (mayuscula == true && minuscula == true && caracter_raro == true && numero == true) {
            return true;
        }
    }
    return false;
}

function setUser(user) {
    // localStorage.setItem("id",user.id_user);
    localStorage.setItem("name", user.name);
    localStorage.setItem("email", user.email);
    localStorage.setItem("password", user.pass);
    localStorage.setItem("is_student", user.is_student);
    localStorage.setItem("created_at", user.created_at);
    localStorage.setItem("updated_at", user.updated_at);
    localStorage.setItem("type_image", JSON.stringify(user.type_image));
    localStorage.setItem("avatar", JSON.stringify(user.avatar));
    localStorage.setItem("gender", user.gender);
    localStorage.setItem("date_birth", user.date_birth);
}








