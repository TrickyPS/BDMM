$(document).ready(function () {
  var vars = {};
  var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi,
    function (m, key, value) {
      vars[key] = value;
    });


  var esComprado = false;
  var esCursoTerminado = false;
  var precioCurso = null;
  if (!vars.curso) {
    location.href = "index.php"
  }
  const id_user = JSON.parse(localStorage.getItem("id"));
  const is_student = JSON.parse(localStorage.getItem("is_student"));

  // Para traer las categorias del curso
  $.ajax({
    type: "GET",
    url: "./../../controllers/CategoryController.php",
    data: {
      action: "getCategoriasByCurso",
      curso: vars.curso
    },
    dataType: "json",
    success: function (resp) {
      for (var item of resp) {
        $("#categoriasCurso").append(`${item.name} -`)
      }
    },
    error: function (x, y, z) {

      location.href = "index.php"
    }
  })

  $('#ratingCurso')
    .rating({
      initialRating: 1,
      maxRating: 1,
      interactive: false
    });

  $('#ratingModal')
    .rating({
      initialRating: 0,
      maxRating: 5
    });

  $('#ratingCalificate')
    .rating({
      maxRating: 5,
      interactive: true
    });

  $('#ratingModalOpen').on('shown.bs.modal', function () {
    var rating = $('#ratingModal').rating('get rating');
    $('#ratingCalificate').rating('set rating', rating);
  })

  //////HACERLE UN INSERT ALA TABLA COMPRAR TRAYENDO EL ID DEL CURSO DEL USUARIO PRECIO /uuidv4()
  $("#btnComprarPaypal2").click(function () {
    debugger
    var paymentMethod = 1;
    var key = uuidv4()
    $.ajax({
      type: "POST",
      url: "./../../controllers/CourseController.php",
      data: {
        action: "pagarCurso",
        userId: id_user,
        courseId: vars.curso,
        amount: precioCurso,
        paymentMethod,
        key
      },
      success: function (resp) {

      },
      error: function (x, y, z) {

        location.href = "index.php"

      }
    })



  });
  $("#btnpagartarjeta2").click(function () {
debugger
    //$courseid = $_POST["courseId"];
    //$userid = $_POST["userId"];
    //$precio = $_POST["amount"];
    //$payment = $_POST["paymentMethod"];
    //$keyp = $_POST["key"];

    var paymentMethod = 2;
    var key = uuidv4()
    $.ajax({
      type: "POST",
      url: "./../../controllers/CourseController.php",
      data: {
        action: "pagarCurso",
        userId: id_user,
        courseId: vars.curso,
        amount: precioCurso,
        paymentMethod,
        key
      },
      success: function (resp) {

      },
      error: function (x, y, z) {

        location.href = "index.php"

      }
    })



  });
  if (id_user != null) {
    //Para traer datos del curso cuando esta logeado
    if (is_student == 0) { // SI ES MAESTRO
      $.ajax({
        type: "GET",
        url: "./../../controllers/CourseController.php",
        data: {
          action: "getCursobyId",
          user: id_user,
          curso: vars.curso
        },
        dataType: "json",
        success: function (resp) {
          esComprado = resp.is_comprado == 0 ? false : true;
          precioCurso = resp.price ? resp.price : 0

          $("#titleCurso").html(resp.curso)
          $("#precioCurso").html(resp.price ? "$ " + resp.price : "Gratis")
          $("#descriptionCurso").html(resp.description);
          $("#imageCurso").attr("src", `${"data:"+resp.type_image + ";base64,"+resp.image}`)
          $("#chatearCurso").append(`Creado por : ${resp.name } / ${resp.email} <i class="far fa-comment-dots"></i>`)
          $("#chatearCurso").attr("href", `chat.php?to=${resp.id_user}`)
          $("#nombreCurso").addClass("d-none");
          //$("#cursocal").addClass("invisible");
          //$("#compraBotones").addClass("invisible");
          //$("#ratingCurso").addClass("invisible");
          $('#btnComprarPaypal').prop("disabled", true);
          $('#btnComprarMasterCard').prop("disabled", true);
       

        },
        error: function (x, y, z) {

          location.href = "index.php"

        }
      })




    } else {
      var curso = vars.curso;
      var user = id_user;
      //SI ES ESTUDIANTE
      $.ajax({
        type: "GET",
        url: "./../../controllers/CourseController.php",
        data: {
          action: "getCursobyId",
          user: id_user,
          curso: vars.curso
        },
        dataType: "json",
        success: function (resp) {
          esComprado = resp.is_comprado == 0 ? false : true;
          precioCurso = resp.price ? resp.price : 0
          debugger
          $("#titleCurso").html(resp.curso)
          $("#precioCurso").html(resp.price ? "$ " + resp.price : "Gratis")
          $("#descriptionCurso").html(resp.description);
          $("#imageCurso").attr("src", `${"data:"+resp.type_image + ";base64,"+resp.image}`)
          $("#chatearCurso").append(`Creado por : ${resp.name } / ${resp.email} <i class="far fa-comment-dots"></i>`)
          $("#chatearCurso").attr("href", `chat.php?to=${resp.id_user}`)
        //  $("#cursocal").hide();
          debugger
          if(esComprado){
            
            $('#btnComprarPaypal2').hide();
            $('#btnComprarMasterCard2').hide();
            $("#cursocal").hide();
            $("#cursocal2").hide();
           // $('#cursocal').hide();
  
  }

  if (esCursoTerminado) {
    $("#btnVerCertificado").show();
    $("#cursocal").show();
    $("#cursocal2").show();
  }
var cursito = vars.curso;
          $.ajax({
            type: "POST",
            url: "./../../controllers/CourseController.php",
            data: {
              action: "obtenerporcentaje",
              cursito: cursito,user:user
            },
            dataType: "json",
            async: false,
            success: function (resppp) {
              debugger
              $("#numerop").append(resppp.porcentaje+"%");
              $("#numeropp").css("width",resppp.porcentaje+"%");
            },
            error: function (x, y, z) {


              // location.href = "index.php"
            }
          })
          //$('#btnComprarPaypal').prop("disabled",true);
          //$('#btnComprarMasterCard').prop("disabled",true);
          if (esComprado) {
            //TRAE NIVELES CUANDO EL CURSO ESTA COMPRADO Y LOS MUESTRA TODOS
            $("#btnComprarPaypal").hide();
            $("#btnComprarMasterCard").hide();
            $("#comprarCon").hide();
            $("#contProgreso").removeClass("d-none");
            $("#containerComentarios").removeClass("d-none");
            var curso = vars.curso;
            $.ajax({
              type: "POST",
              url: "./../../controllers/CourseController.php",
              data: {
                action: "obtenerNiveles",
                curso: curso
              },
              dataType: "json",
              success: function (resp3) {

                console.log(resp3);
                debugger
                for (item3 of resp3) {
                  if(item3.cantidad > 0){
                  $("#accordion").append(`
        <div class="col-lg-8 mx-auto">
        <div class="card-header" id="headingOne${item3.idNivel}">
            <h5 class="mb-0">
               
                <button class="btn" data-toggle="collapse" data-target="#collapseOne${item3.idNivel}" aria-expanded="true"
                    aria-controls="collapseOne${item3.idNivel}">
                   Videos
                </button>
                <span id="nombreN${item3.idNivel}">${item3.nombreNivel}</span>
            </h5>
        </div>
        <div id="collapseOne${item3.idNivel}" class="collapse show" aria-labelledby="headingOne${item3.idNivel}" data-parent="#accordion">
          
        </div>
    </div>  `);
                  }
                  var level = item3.idNivel;
                  var user = id_user;
                  $.ajax({
                    type: "POST",
                    url: "./../../controllers/CourseController.php",
                    data: {
                      action: "obtenervideoslevel",
                      level: level
                    },
                    dataType: "json",
                    async: false,
                    success: function (resp4) {

                      for (item4 of resp4) {
                        if(item3.cantidad > 0){
                        $("#collapseOne" + item3.idNivel).append(`
       <div class="card-body">
                   <span>${item4.tituloVideo}</span>
                   <button class=" p1p btn button mt-0 ml-1 zoom float-right" onclick="location.href = 'video.php'"
                       id="botonsearch" type="submit"
                       style="font-family: 'Yanone Kaffeesatz', sans-serif; font-size: small;">Ver</button>
               </div>
       `)
                        }

                      }
                    },
                    error: function (x, y, z) {


                      // location.href = "index.php"
                    }
                  })

                  debugger
                  $.ajax({
                    type: "POST",
                    url: "./../../controllers/CourseController.php",
                    data: {
                      action: "estatusnivel",
                      level: level,
                      user: user
                    },
                    dataType: "json",
                    async: false,
                    success: function (resp4) {
                      debugger
                    
                  $("#nombreN"+item3.idNivel).append(`
                   (${resp4.Progreso})
                  `);
                    },
                    error: function (x, y, z) {
  
  
                      // location.href = "index.php"
                    }
                  })
  
                }
              
              },
              error: function (x, y, z) {

                location.href = "index.php"

              }
            })
          } else {
            // TRAE NIVELES CUANDO EL CURSO NO SE COMPRA PERO LOS NIVELES SI
            $("#contProgreso").removeClass("d-none");
            $("#containerComentarios").removeClass("d-none");
            debugger
            var curso = vars.curso;
            $.ajax({
              type: "POST",
              url: "./../../controllers/CourseController.php",
              data: {
                action: "obtenerNivelesUser",
                user: user,
                curso: curso
              },
              dataType: "json",
              success: function (resp3) {
                // $('#btnComprarPaypal').prop("disabled",true);
                // $('#btnComprarMasterCard').prop("disabled",true);
                debugger
            
                console.log(resp3);
                for (item3 of resp3) {
                 if(item3.cantidad > 0){
                  $("#accordion").append(`
      <div class="col-lg-8 mx-auto">
      <div class="card-header" id="headingOne${item3.idNivel}">
          <h5 class="mb-0">
              <button class="btn" data-toggle="collapse" data-target="#collapseOne${item3.idNivel}" aria-expanded="true"
                  aria-controls="collapseOne${item3.idNivel}">
                 Videos
              </button>
              <span id="nombreN${item3.idNivel}">${item3.nombreNivel}</span>
              <button target="blank" id="btnComprarPaypal" type="button" name="${item3.idNivel}" accessKey="${item3.precio}"
                      class="m-0 btn text-light btn-dark zoom float-right ml-1 btnComprarPaypal${item3.idNivel}" style="font-size: 10px;">Paypal <i class="fab fa-paypal"></i></button>    
                  <button id="btnComprarMasterCard" type="button" data-toggle="modal" data-target="#tarjeta" type="submit" name="${item3.idNivel}" accessKey="${item3.precio}"
                      class="m-0 btn btn-dark zoom float-right ml-1 btnComprarMasterCard${item3.idNivel} " style="font-size: 10px;">MasterCard <i class="fab fa-cc-mastercard"></i></button>
          </h5>
      </div>
      <div id="collapseOne${item3.idNivel}" class="collapse show" aria-labelledby="headingOne${item3.idNivel}" data-parent="#accordion">
          

      </div>
  </div>  `);}
                  debugger
                  if (item3.Comprado == 0) {

                    $('.btnComprarPaypal'+item3.idNivel).prop("disabled", false);
                    $('.btnComprarMasterCard'+item3.idNivel).prop("disabled", false);
                  } else {
                    $('.btnComprarPaypal'+item3.idNivel).hide();
                    $('.btnComprarMasterCard'+item3.idNivel).hide();
                  }
                  //$iduser = $_POST["user"];
                  //$idlevel = $_POST["level"];
                  //$nombreNivel = $_POST["nivel"];
                  //$precio = $_POST["precio"];
                  //$metodo = $_POST["metodo"];
                  //$llave = $_POST["llave"];
                  var level = item3.idNivel;
                  var nivel = item3.nombreNivel;
                  var precio = item3.precio;
                  var llave = uuidv4();
                  if (precio == null) {
                    precio = 0;
                  }


                  debugger
                  var level = item3.idNivel;
                  var user = id_user;
                  $.ajax({
                    type: "POST",
                    url: "./../../controllers/CourseController.php",
                    data: {
                      action: "obtenervideosleveluser",
                      level: level,
                      user: user
                    },
                    dataType: "json",
                    async: false,
                    success: function (resp4) {
                      debugger

                      for (item4 of resp4) {
                        if(item3.cantidad > 0){
                          if (item3.Comprado == 1) {

                      
                        $("#collapseOne" + item3.idNivel).append(`
  <div class="card-body">
              <span>${item4.tituloVideo}</span>
              <button class=" p1p btn button mt-0 ml-1 zoom float-right" onclick="location.href = 'video.php'"
                  id="botonsearch" type="submit"
                  style="font-family: 'Yanone Kaffeesatz', sans-serif; font-size: small;">Ver</button>
          </div>
  `)
                          }
                        }
                      }


                    },
                    error: function (x, y, z) {

                      debugger
                      alert(x);
                      // location.href = "index.php"
                    }
                  })
                  $.ajax({
                    type: "POST",
                    url: "./../../controllers/CourseController.php",
                    data: {
                      action: "estatusnivel",
                      level: level,
                      user: user
                    },
                    dataType: "json",
                    async: false,
                    success: function (resp4) {
                      alert("obtiene el estatus aqui")
                  $("#nombreN"+item3.idNivel).append(`
                   (${resp4.Progreso})
                  `);
                    },
                    error: function (x, y, z) {


                      // location.href = "index.php"
                    }
                  })




                }


              },
              error: function (x, y, z) {


                // location.href = "index.php"

              }
            })
          }

          if (esCursoTerminado) {
            $("#btnVerCertificado").show();
            $("#cursocal").show();
            $("#cursocal2").show();
          }
        },
        error: function (x, y, z) {

          location.href = "index.php"

        }
      })
    }
  } else {
    $("#btnComprarPaypal1").click(function () {

      location.href = "index.php"
    })

    $("#btnComprarMasterCard1").click(function () {
      //$courseid = $_POST["courseId"];
      //$userid = $_POST["userId"];
      //$precio = $_POST["amount"];
      //$payment = $_POST["paymentMethod"];
      //$keyp = $_POST["key"];

      location.href = "index.php"

    })
    var curso = vars.curso;
    $.ajax({
      type: "POST",
      url: "./../../controllers/CourseController.php",
      data: {
        action: "traercurso",
        curso
      },
      dataType: "json",
      success: function (resp) {
        precioCurso = resp.price ? resp.price : 0

        $("#titleCurso").html(resp.nombrec)
        $("#precioCurso").html(resp.precioc ? "$ " + resp.precioc : "Gratis")
        $("#descriptionCurso").html(resp.decripcionc);
        $("#imageCurso").attr("src", `${"data:"+resp.tipo + ";base64,"+resp.imagen}`)
        //$("#chatearCurso").append(`Creado por : ${resp.name } / ${resp.email} <i class="far fa-comment-dots"></i>`)
        //$("#chatearCurso").attr("href",`chat.php?to=${resp.id_user}`)

      },
      error: function (x, y, z) {

        // location.href = "index.php"
      }
    })

    //Para traer datos del curso cuando no esta logeado

    var curso = vars.curso;
    $.ajax({
      type: "POST",
      url: "./../../controllers/CourseController.php",
      data: {
        action: "obtenerNiveles",
        curso: curso
      },
      dataType: "json",
      success: function (resp3) {

        console.log(resp3);
        for (item3 of resp3) {
          $("#accordion").append(`
        <div class="col-lg-8 mx-auto">
        <div class="card-header" id="headingOne${item3.idNivel}">
            <h5 class="mb-0">
                <button class="btn" data-toggle="collapse" data-target="#collapseOne${item3.idNivel}" aria-expanded="true"
                    aria-controls="collapseOne${item3.idNivel}">
                   Videos
                </button>
                <span>${item3.nombreNivel}</span>
                <button  onclick="location.href='../HTML/index.php'"
                        class="m-0 btn text-light btn-dark zoom float-right ml-1" style="font-size: 10px;">Paypal <i class="fab fa-paypal"></i></button>    
                    <button   onclick="location.href='../HTML/index.php'"
                        class="m-0 btn btn-dark zoom float-right ml-1" style="font-size: 10px;">MasterCard <i class="fab fa-cc-mastercard"></i></button>
            </h5>
        </div>
        <div id="collapseOne${item3.idNivel}" class="collapse show" aria-labelledby="headingOne${item3.idNivel}" data-parent="#accordion">
          
        </div>
    </div>  `);

          var level = item3.idNivel;
          $.ajax({
            type: "POST",
            url: "./../../controllers/CourseController.php",
            data: {
              action: "obtenervideoslevel",
              level: level
            },
            dataType: "json",
            async: false,
            success: function (resp4) {

               for(item4 of resp4){
                $("#collapseOne"+item3.idNivel).append(`
                <div class="card-body">
                            <span>${item4.tituloVideo}</span>
                            <button class=" p1p btn button mt-0 ml-1 zoom float-right" onclick="location.href = 'video.php'"
                                id="botonsearch" type="submit"
                                style="font-family: 'Yanone Kaffeesatz', sans-serif; font-size: small;">Ver</button>
                        </div>
                `)
              
                 }
            },
            error: function (x, y, z) {


              // location.href = "index.php"
            }
          })
        }


      },
      error: function (x, y, z) {

        location.href = "index.php"

      }
    })

  }
  var userm  = null;; 
  var levelm = null;
  var nivelm = null;
  var preciom = null;
  var metodom = null;
  var llavem = null;

 $(this).on('click','#btnComprarPaypal',function(e){
   debugger
   console.log(e.target.name,e.target.accessKey);
   var user = id_user;
   var level = e.target.name;
   var nivel = "nada";
   var precio = e.target.accessKey;
   var metodo = 1;
   var llave = uuidv4;
      $.ajax({
                 type: "POST",
                 url: "./../../controllers/CourseController.php",
                 data: {
                   action: "pagarNivel",
                   user: user,
                   level: level,
                   nivel: nivel,
                   precio: precio,
                   metodo: metodo,
                   llave: llave
                 },
                 dataType: "json",
                 async: false,
                 success: function (resppago) {
                   debugger
                   location.href = "curso.php"
                 },
                 error: function (x, y, z) {
   
                   debugger
                   alert(x);
                   // location.href = "index.php"
                 }
               })
   
   })

   $(this).on('click','#btnComprarMasterCard',function(e){
    debugger
    console.log(e.target.name,e.target.accessKey);
     userm   = id_user;
     levelm  = e.target.name;
     nivelm  = "nada";
     preciom = e.target.accessKey;
     metodom = 2;
     llavem  = uuidv4;
    })
 
    $(this).on('click','#btnpagartarjeta',function(e){
      var user = userm;
      var level = levelm;
      var nivel = nivelm;
      var precio = preciom;
      var metodo = metodom;
      var llave = llavem;
      debugger
      $.ajax({
        type: "POST",
        url: "./../../controllers/CourseController.php",
        data: {
          action: "pagarNivel",
          user: user,
          level: level,
          nivel: nivel,
          precio: precio,
          metodo: metodo,
          llave: llave
        },
        dataType: "json",
        async: false,
        success: function (resppago) {
          debugger
          location.href = "curso.php"
        },
        error: function (x, y, z) {

          debugger
          alert(x);
          // location.href = "index.php"
        }
      })
      
      })

   $("#comentariosu").click(function () {
     debugger
     var curso = vars.curso;
     var user = id_user;
     var comentario = document.getElementById('comment').value;
    $.ajax({
      type: "POST",
      url: "./../../controllers/CourseController.php",
      data: {
        action: "comentar",
       curso:curso,user:user,comentario:comentario
      },
      success: function (resp) {
debugger

      },
      error: function (x, y, z) {

        location.href = "index.php"

      }
    })



  });

  debugger
  var curso = vars.curso;
 $.ajax({
   type: "POST",
   url: "./../../controllers/CourseController.php",
   data: {
     action: "comentar2",
    curso:curso
   }, dataType: "json",
   success: function (respc) {
     //${"data:"+item.tipo + ";base64,"+item.imagen}
debugger
console.log(respc);
for (item444 of respc){

$("#agregacomentario").append(`  <div class="card p-3 m-1">
<div class="d-flex justify-content-between align-items-center">
    <div class="user d-flex flex-row align-items-center"> 
    <img src="${"data:"+item444.tipo + ";base64,"+item444.imagen}" class="user-img rounded-circle mr-2"
            style="object-fit: contain; width: 30px; height:30px;"> <span><small
                class="font-weight-bold text-primary">${item444.correo}:</small> <small
                class="font-weight-bold">${item444.comentario}</small></span> </div>
    <small>${item444.fecha}</small>
</div>
</div>
`)

  
}


   },
   error: function (x, y, z) {

     location.href = "index.php"

   }
 })


});