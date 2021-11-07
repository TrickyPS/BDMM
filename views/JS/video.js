var vars = {};
var parts = window.location.href.replace(/[?&]+([^=&]+)=([^&]*)/gi,
  function (m, key, value) {
    vars[key] = value;
  });
const id_user = JSON.parse(localStorage.getItem("id"))


const Video = {
    getVideo: function(){
        $.ajax({
            type:"GET",
            url:"./../../controllers/VideoController.php",
            data:{action:"getVideo",id:vars.video},
            dataType:"json",
            success:function(resp){
               
              console.log(resp);
              $("#srcVideo").append(`
              <source src="${"./../.." + resp.path}" type="${resp.type}" >
              `)
              $("#titleVideo").html(resp.title)
            },
            error:function (x,y,z){
               
              console.error(x.responseText);
            }
          })
    },
    getResources: function(){
      $.ajax({
        type:"POST",
        url:"./../../controllers/VideoController.php",
        data:{action:"getResources",id:vars.video},
        dataType:"json",
        success:function(resp){
           console.log(resp);
          if(resp ){
              for(var item of resp){
                if(item.url == null){
                  $("#contResources").append(`
                  <li class="list-group-item" style="background-color: rgb(71, 67, 67);">
                  <span class="float-left">${item.nombre}</span>  <a  download="${item.type}" href="${"data:" + item.type + ";base64," + item.resource}" class="float-right p1p btn button mt-0 ml-1 zoom" 
                  style="font-family: 'Yanone Kaffeesatz', sans-serif; font-size: small;">Descargar</a>
                 </li>
                  `)
                }else{
                  $("#contResources").append(`
                  <li class="list-group-item" style="background-color: rgb(71, 67, 67);">
                  <span class="float-left">${item.url.substring(0,20) + "..."}</span> 
                   <a target="blank" href="${item.url}" class="float-right p1p btn button mt-0 ml-1 zoom"  
                  style="font-family: 'Yanone Kaffeesatz', sans-serif; font-size: small;">Ver</a>
                 </li>
                  `)
                }
              }
          }
         
        },
        error:function (x,y,z){
           
          console.error(x.responseText);
        }
      })
    }
}

if(vars.video){
    Video.getVideo()
}else{
    window.location.href = "notfound.php"
}

Video.getResources()