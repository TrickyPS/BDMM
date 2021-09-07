$("#formCurso").submit(function (e) { 
    e.preventDefault();
    const curso = $("#Ccurso").val();
    const description = $("#Cdescription").val();
    const categoria = $('#Ccategoria').val();
    const image = $('#Cimagen').prop('files');
    const gratis = $('#switch').is(':checked');
    const precio = $("#Cprecio").val();
    
    if(curso == "" || description=="" || categoria == "0" || image.length == 0  || gratis && precio =="" ){
        toastr.error('Error', 'Has dejado campos vacios');
    }else{
        toastr.success('Bien', 'Curso registrado');
    }



}); 


$("#formNivel").submit(function (e) { 
    e.preventDefault();
    const name = $("#Nnivel").val();
    const curso = $("#Ncurso").val();
    debugger
    if(name == "" || curso == "0" ){
        toastr.error('Error', 'Has dejado campos vacios');
    }else{
        toastr.success('Bien', 'Nivel registrado');
    }
});

$("#formVideo").submit(function (e){
    e.preventDefault();
    const name = $("#Vname").val();
    const description = $("#Vdescription").val();
    const curso = $("#Vcurso").val();
    const nivel = $("#Vnivel").val();
    const video = $('#Vvideo').prop('files');

    if(name == "" || curso == "0" || nivel == "0" || description == "" || video.length == 0){
        toastr.error('Error', 'Has dejado campos vacios');
    }else{
        toastr.success('Bien', 'Video registrado');
    }

})

$("#formCategoria").submit(function (e) { 
    e.preventDefault();
    const name = $("#Catname").val();
    const description = $("#Catdescription").val();
    debugger
    if(name == "" || description == ""){
        toastr.error('Error', 'Has dejado campos vacios');
    }else{
        toastr.success('Bien', 'Categoria registrado');
    }

});