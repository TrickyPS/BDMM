$("#btnCourse").click(function(){
    $.ajax({
        type:"GET",
        url:"./../../controllers/CategoryController.php",
        data:{action:"findAll"},
        dataType:"json",
        success: function(resp){
            debugger
            $("#Ccategoria").html("")
          resp.map((item)=>{
              $("#Ccategoria").append(`
              <option value="${item.id_category}"> ${item.name} </option>
              `)
          })
        },
        error:function(x,y,z){
           debugger
        }
    });
    const id_user = JSON.parse(localStorage.getItem("id"));
    getAllCursos(id_user);
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
        const id_user = JSON.parse(localStorage.getItem("id"));
        addCurso(image,curso,description,gratis? "":precio,id_user,categoria);
    }

});

function addCurso(image,name,description,price,user,categoria){
    var formData = new FormData();
        formData.append('image',image[0]);
        formData.append('action',"addCurso");
        formData.append('name',name);
        formData.append('description',description);
        formData.append('price',price);
        formData.append('user',user);
        debugger
    $.ajax({
        type:"POST",
        enctype: "multipart/form-data",
        url:"./../../controllers/CourseController.php",
        data:formData,
        dataType:"json",
        processData: false, 
        contentType: false ,
        success: function(resp){
           for(item of categoria){
            addCursoCategoria(resp.id,item)
           }
           Swal.fire({
            position: 'center',
            icon: 'success',
            title: `Curso ${name} agregado`,
            showConfirmButton: false,
            timer: 1500
          })
          getAllCursos(user)
        },
        error:function(x,y,z){
        }
    });
}

function addCursoCategoria(curso,categoria){
    debugger
    $.ajax({
        type:"POST",
        url:"./../../controllers/CategoryController.php",
        data:{action:"addCategoriaCurso",curso,categoria},
        dataType:"json",
        success: function(resp){
        },
        error:function(x,y,z){
        }
    });
}

function getAllCursos(user){
    $.ajax({
        type:"GET",
        url:"./../../controllers/CourseController.php",
        data:{action:"getAllCursosByUser",user},
        dataType:"json",
        success: function(resp){
            console.log(resp);
        },
        error:function(x,y,z){
            console.log(z,y,z);
        }
    });
}