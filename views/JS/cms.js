var vars = {};
var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi,
  function (m, key, value) {
    vars[key] = value;
  });

$("#formCurso").submit(function (e) {
    e.preventDefault();
    var campos = [];
    const curso = $("#Ccurso").val();
    const description = $("#Cdescription").val();
    const categoria = $('#Ccategoria').val();
    const image = $('#Cimagen').prop('files');
    const gratis = $('#switch').is(':checked');
    const precio = $("#Cprecio").val();
    campos.push({ campo: " nombre de curso", value: curso });
    campos.push({ campo: " descripcion", value: description });
    campos.push({ campo: " categoria", value:  categoria.length == 0 ? "" : categoria });
    campos.push({ campo: "imagen", value: image.length == 0 ? "" : image.length });

    if (!gratis && precio == "") {
        campos.push({ campo: " precio", value: "" });
    } else {
        campos.push({ campo: " precio", value: "validate" });
    }
    var success = true;
    for (campo of campos) {
        if (campo.value == "") {
            toastr.error('Error', `El campo ${campo.campo} es requerido`);
            success = false;
        }
    }
    if (success) {
        toastr.success('Bien', 'Curso registrado');
    }




});


$("#formNivel").submit(function (e) {
    e.preventDefault();
    var campos = [];
    const name = $("#Nnivel").val();
    const curso = $("#Ncurso").val();
    const gratis = $('#switchLevel').is(':checked');
    const precio = $("#Lprecio").val();
    campos.push({ campo: " nombre del nivel", value: name });
    campos.push({ campo: " curso", value: curso == "0"? "":curso });
     
    if (!gratis && precio == "") {
        campos.push({ campo: " precio", value: "" });
    } else {
        campos.push({ campo: " precio", value: "validate" });
    }
 
    var success = true;
    for (campo of campos) {
        if (campo.value == "") {
            toastr.error('Error', `El campo ${campo.campo} es requerido`);
            success = false;
        }
    }
    if (success) {
        toastr.success('Bien', 'Curso registrado');
    }

});

$("#formVideo").submit(function (e) {
    e.preventDefault();
    var campos = [];
    const name = $("#Vname").val();
    const description = $("#Vdescription").val();
    const curso = $("#Vcurso").val();
    const nivel = $("#Vnivel").val();
    const video = $('#Vvideo').prop('files');

    campos.push({campo:" titulo del video", value:name});
    campos.push({campo:" descripcion del video", value:description});
    campos.push({campo:" curso", value: curso == "0" ? "" : curso});
    campos.push({campo:" nivel", value: nivel == "0" ? "" : nivel});
    campos.push({campo:" video ", value:video.length == 0 ? "": video.length});

   
    var success = true;
    for(campo of campos){
        if(campo.value == ""){
            toastr.error('Error', `El campo ${campo.campo} es requerido`);
        success = false;
        }
    }
    if(success){
        toastr.success('Bien', 'Curso registrado');
    }
    



    

})

$("#formCategoria").submit(function (e) {
    e.preventDefault();
    var campos = [];
    const name = $("#Catname").val();
    const description = $("#Catdescription").val();
    const id_user = JSON.parse(localStorage.getItem("id"));
    
    campos.push({campo:" nombre de categoria", value:name});
    campos.push({campo:" descripcion de la categoria", value:description});

   
    var success = true;
    for(campo of campos){
        if(campo.value == ""){
            toastr.error('Error', `El campo ${campo.campo} es requerido`);
        success = false;
        }
    }
    if(success){
        $.ajax({
            type:"POST",
            url:"./../../controllers/CategoryController.php",
            data:{action:"addCategory",name,description,id_user},
            dataType:"json",
            success: function(resp){
               showCategories(resp)
                $("#Catname").val("");
                $("#Catdescription").val("");
                Swal.fire({
                    position: 'center',
                    icon: 'success',
                    title: `Categoria ${name} agregada`,
                    showConfirmButton: false,
                    timer: 1500
                  })
            },
            error:function(x,y,z){
                Swal.fire({
                    icon: 'error',
                    title: 'Oops...',
                    confirmButtonColor: '#141C29',
                    text: 'Error al agregar categoria. Vuelvelo a intentar'
                  })
            }
        });

       
    }
    
});

$("#btnCategory").click(function(){
    $.ajax({
        type:"GET",
        url:"./../../controllers/CategoryController.php",
        data:{action:"findAll"},
        dataType:"json",
        success: function(resp){
           showCategories(resp)
           
        },
        error:function(x,y,z){
           
        }
    });
});

function showCategories(categories){
    $("#tableShowCategories").html("");
    var i = 0;
    for(var category of categories ){
        i++
        $("#tableShowCategories").append(`
        <tr>
            <td>${i}</td>
            <td>${category.name}</td>
            <td>${category.description}</td>
        </tr>
        `)
    }
}



var menus = [];
menus.push('dashboard');
menus.push('misCursos');
menus.push('curso');
menus.push('nivel');
menus.push('video');
menus.push('categoria');

function hideNavs() {
    for (item of menus) {
        $('#' + item).hide()
    }
}

function toggleNav(id) {
    hideNavs()
    $('#' + id).show();
}

function init() {
    hideNavs()
    $("#dashboard").show();
}

init()
if(vars.o == "categorias")
$("#btnCategory").click();


function stateSwitch() {
    var check = document.getElementById('switch').checked;
     
    if (!check) {
        $('#Cprecio').removeAttr('disabled');
    } else {
        $('#Cprecio').attr('disabled', true);
    }
}

function stateSwitchLevel() {
    var check = document.getElementById('switchLevel').checked;
     
    if (!check) {
        $('#Lprecio').removeAttr('disabled');
    } else {
        $('#Lprecio').attr('disabled', true);
    }
}

$('.ui.drop').dropdown();

$('#sidebarCollapse').on('click', function () {
    $('#nav-cms').toggleClass('toggle-nav');
    


   
    $("#cms-container").toggleClass('col-lg-12')
});