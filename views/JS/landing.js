// obtiene los cursos mas recientess

$.ajax({
    type:"GET",
    url:"./../../controllers/BuscarController.php",
    data:{action:"buscarRecientes",limit:9},
    dataType:"json",
    success: function(resp){
        
        const data = resp;
       
        for(var i = 0; i < data.length && i < 3; i++){
         
            $(".liRecientes1").append(`
            <div class="col-lg-4 col-md-3 col-sm-12  pt-2">
            <div class="imagen text-center" style="border-color: white !important;;">
              <img src="${'data:'+data[i].type_image + ";base64," + data[i].image }" style="height: 200px; width: 200px;">
            </div>
            <div class="stats mt-2 text-center">
              <div class="mx-auto p-price w-100" style="color: white;">
                <h4>Curso de ${data[i].name}</h4>
                <span>Precio</span>
                <p class="lead" style="color: white;">
                  <span> ${data[i].price?"$"+data[i].price:"Gratis"}</span>
                </p>
                 <button style="font-family: 'Bebas Neue'; background-color: rgb(100, 100, 96);  color: white;"
                  class="p1p btn mt-3 mb-4 zoom" type="submit" onclick="location.href='curso.php?curso=${data[i].id_course}';">Ver Curso</button>
              </div>
            </div>
          </div>
            `)
        }
        for(var i = 3; i < data.length && i < 6; i++){
            $(".liRecientes2").append(`
            <div class="col-lg-4 col-md-3 col-sm-12  pt-2">
            <div class="imagen text-center" style="border-color: white !important;;">
              <img src="${'data:'+data[i].type_image + ";base64," + data[i].image }" style="height: 200px; width: 200px;">
            </div>
            <div class="stats mt-2 text-center">
              <div class="mx-auto p-price" style="color: white;">
                <h4>Curso de ${data[i].name}</h4>
                <span>Precio</span>
                <p class="lead" style="color: white;">
                  <span>$ ${data[i].price}</span>
                </p>
                 <button style="font-family: 'Bebas Neue'; background-color: rgb(100, 100, 96);  color: white;"
                  class="p1p btn mt-3 mb-4 zoom" type="submit" onclick="location.href='curso.php?curso=${data[i].id_course}';">Ver Curso</button>
              </div>
            </div>
          </div>
            `)
        }
        for(var i = 6; i < data.length && i < 9; i++){
            $(".liRecientes3").append(`
            <div class="col-lg-4 col-md-3 col-sm-12  pt-2">
            <div class="imagen text-center" style="border-color: white !important;;">
              <img src="${'data:'+data[i].type_image + ";base64," + data[i].image }" style="height: 200px; width: 200px;">
            </div>
            <div class="stats mt-2 text-center">
              <div class="mx-auto p-price" style="color: white;">
                <h4>Curso de ${data[i].name}</h4>
                <span>Precio</span>
                <p class="lead" style="color: white;">
                  <span>$ ${data[i].price }</span>
                </p>
                 <button style="font-family: 'Bebas Neue'; background-color: rgb(100, 100, 96);  color: white;"
                  class="p1p btn mt-3 mb-4 zoom" type="submit" onclick="location.href='curso.php?curso=${data[i].id_course}';">Ver Curso</button>
              </div>
            </div>
          </div>
            `)
        }
    },
    error: function(x,y,z){
        console.error(x,y,z)
    }
})