

var vars = {};
var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi,
  function (m, key, value) {
    vars[key] = value;
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
    window.history.replaceState(null,id,location.pathname.concat(`?o=${id}`))
}

function init() {
    hideNavs()
    $("#dashboard").show();
}

init()

if(vars.o == "categoria")
$("#btnCategory").click();
if(vars.o == "video")
$("#btnVideo").click();
if(vars.o == "nivel")
$("#btnLevel").click();
if(vars.o == "curso")
$("#btnCourse").click();
if(vars.o == "misCursos")
$("#btnMyCourses").click();

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