var vars = {};
var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi,
  function (m, key, value) {
    vars[key] = value;
  });

var esComprado = false;
var esCursoTerminado = false;

if(!vars.curso){
  location.href = "index.php"
}
const id_user = JSON.parse(localStorage.getItem("id"));
//Para traer datos del curso
$.ajax({
  type:"GET",
  url:"./../../controllers/CourseController.php",
  data:{action:"getCursobyId",user:id_user,curso:vars.curso},
  dataType:"json",
  success:function(resp){
    esComprado =resp.is_comprado == 0? false:true;
    $("#titleCurso").html(resp.curso)
    $("#precioCurso").html(resp.price ? "$ " + resp.price : "Gratis")
    $("#descriptionCurso").html(resp.description);
    $("#imageCurso").attr("src",`${"data:"+resp.type_image + ";base64,"+resp.image}`)
    $("#chatearCurso").append(`Creado por : ${resp.name } / ${resp.email} <i class="far fa-comment-dots"></i>`)
    $("#chatearCurso").attr("href",`chat.php?to=${resp.id_user}`)
  },
  error:function (x,y,z){
    location.href = "index.php"
  }
})
// Para traer las categorias del curso
$.ajax({
  type:"GET",
  url:"./../../controllers/CategoryController.php",
  data:{action:"getCategoriasByCurso",curso:vars.curso},
  dataType:"json",
  success:function(resp){
    for(var item of resp){
      $("#categoriasCurso").append(`${item.name} -`)
    }
  },
  error:function (x,y,z){
    debugger
    location.href = "index.php"
  }
})

$('#ratingCurso')
   .rating({
    initialRating: 1,
    maxRating: 1,
    interactive:false
  })
;

$('#ratingModal')
   .rating({
    initialRating: 0,
    maxRating: 5
  })
;

$('#ratingCalificate')
.rating({
 maxRating: 5,
 interactive:true
});

$('#ratingModalOpen').on('shown.bs.modal', function () {
    var rating = $('#ratingModal').rating('get rating');
    $('#ratingCalificate').rating('set rating',rating);
  })



//////////////////////////////CONTROL DE LA PAGINA SI ES COMPRADO CURSO
if(esComprado){
  $("#btnComprarPaypal").hide();
  $("#btnComprarMasterCard").hide();
  $("#comprarCon").hide();
  $("#contProgreso").show();
  $("#containerComentarios").show();
}

if(esCursoTerminado){
  $("#btnVerCertificado").show();
}

//////////////////////////////CONTROL DE LA PAGINA SI ES COMPRADO CURSO
