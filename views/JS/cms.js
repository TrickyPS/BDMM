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
        toastr.success('Bien', 'Curso registrado');
    }
    
});

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