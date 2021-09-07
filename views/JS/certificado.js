var vars = {};
var progrss = null;
var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi,
  function (m, key, value) {
    vars[key] = value;
  });

  var usuario = jQuery.parseJSON(localStorage.getItem("user"));
  $.ajax({
    type: "POST",
    url: "../../Controllers/getCurso.php",
    data: {id:vars.curso},
    dataType: 'json',
    success: function(data){
       
$("#curso").html(data.nameCurso);
$("#curso2").html(data.nameCurso);
$("#nameUser").html(usuario.nombre);
var today = new Date();
var dd = String(today.getDate()).padStart(2, '0');
var mm = String(today.getMonth() + 1).padStart(2, '0'); //January is 0!
var yyyy = today.getFullYear();
debugger
today = mm + '/' + dd + '/' + yyyy;
$("#date").html(today);


    },error:function(x,y,z){

      location.href = "IndexNuevo.php";
      
    }
  });
