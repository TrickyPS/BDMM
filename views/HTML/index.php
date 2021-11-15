<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <link rel="shortcut icon" href="./../IMG/logooficial.png" type="image/png">
  <link rel="preconnect" href="https://fonts.gstatic.com">
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css">
<!-- jolj -->
  <!--  Link de css -->
  <link rel="stylesheet" href="../CSS/IndexNuevo.css">
  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
  <!-- or the reference on CDN -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/css/splide.min.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intro.js/3.2.1/introjs.css"
    integrity="sha512-i+WzzATeaDcwcfi5CfLn63qBxrKqiQvDLC+IChU1zVlaPguPgJlddOR07nU28XOoIOno9WPmJ+3ccUInpmHxBg=="
    crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/css/splide.min.css">

   
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" defer></script>
  <!-- FONTS -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
  <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@600&display=swap" rel="stylesheet">

  <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Source+Code+Pro:ital,wght@1,300&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@1,300&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Arimo&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Yanone+Kaffeesatz&display=swap" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Archivo+Narrow&display=swap" rel="stylesheet">
  <script src="./../JS/landing.js" defer> </script>
  <title>Continuity-Pagina Principal</title>

</head>

<body>
<?php include_once("layout_nav.php") ?>

  <section class="inicio   shadow" id="home" data-scroll-index="0">

      <div class="mt-0 row row-inicio align-items-center" style="font-family: 'Bebas Neue'">
        <div class="col-lg-7 col-md-7 col-sm-12">
          <div class="inicio-text text-center mt-5">
            <h1>Bienvenido a una aventura nueva.</h1>
            <p style="font-size: 30px;">
              Continuity, la mejor para plataforma de cursos para aprender.
            </p>
            <button onclick="location.href = 'categorias.php'" class="p1p btn button zoom" type="submit"
              style="font-family: 'Yanone Kaffeesatz', sans-serif; font-size: large;">Ver Cursos</button>
          </div>
        </div>
        <div class="col-lg-5 col-md-5 col-sm-12 inicioDer" style="padding:0%;">
          <div class="pt-3 row-inicio align-items-center text-center">
            <div class=" pl-0  col-lg-12 col-md-12 col-sm-12">
              <div id="carouselExampleIndicators" class="mt-4 carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>
                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <img class="test " src="../IMG/reactredux.png" alt="First slide">
                  </div>
                  <div class="carousel-item">
                    <img class="test" src="../IMG/python.png" alt="Second slide">
                  </div>
                  <div class="carousel-item">
                    <img class="test" src="../IMG/photoshop.png" alt="Third slide">
                  </div>
                </div>
                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="sr-only">Previous</span>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="sr-only">Next</span>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
   
  </section>

  <section class="categorias pb-5" style="background-color: rgb(239, 242, 245);">
    <div class="text-center pt-4">
      <h1 style="font-family:'Bebas Neue'; color: rgb(0, 0, 0);"> Últimos cursos </h1>
    </div>

    <div class="container pt-0" id="_productos">
      <div class="splide pt-3 d-flex mx-auto justify-content-center col-lg-12 col-md-12 col-sm-12 " id="splide"
        style="font-family: 'Bebas Neue'">
        <div class="splide__track " style="border-radius: 10px">
          <ul id="splideManage" class="splide__list">
           
           
          </ul>
        </div>
      </div>

      <div class="splide__progress">
        <div class="splide__progress__bar">
        </div>
      </div>
    </div>

    <!---Los mas comprados-->
    <div class="text-center pt-4">
      <h1 style="font-family:'Bebas Neue'; color: rgb(0, 0, 0);">Cursos mas comprados </h1>
    </div>

    <div class="container px-4 px-lg-5 mt-5">
      <div id="contMasComprados" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
      

      </div>
    </div>

 
    <!-- Para los mas calificados-->
    <div class="text-center pt-4">
      <h1 style="font-family:'Bebas Neue'; color: rgb(0, 0, 0);">Los mejores calificados </h1>
    </div>

    <div class="container px-4 px-lg-5 mt-5">
      <div id="contMasCalificados" class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
       
        

      </div>
    </div>
 

  </section>


  <section id="siNoEsMaestro" class="shadow" id="home" data-scroll-index="0"
    style="background-color: rgb(151, 174, 180); color: rgb(255, 255, 255);">
    <div class="container">
      <div class="mt-0 row row-inicio align-items-center" style="font-family: 'Bebas Neue'">

        <div class="col-lg-7 col-md-7 col-sm-12">
          <div class="carousel-item active">
            <img class="test2" src="../IMG/image6.png" alt="First slide">
          </div>
        </div>
        <div class="col-lg-5 col-md-5 col-sm-12 " style="padding:0%;">

          <h1 style="font-size: 50px;">Conviertete en instructor</h1>
          <p style="font-size: 20px;">Conviértete en instructor
            Instructores de todo el mundo enseñan a millones de estudiantes en Continuity. Proporcionamos las
            herramientas y las habilidades para que enseñes lo que te apasiona.</p>
          <div class="text-center">
            <button class="p1p btn button mt-0 ml-1 zoom text-center"  type="submit"
              style="font-family: 'Yanone Kaffeesatz', sans-serif; font-size: 30px;"  data-toggle="modal" data-target="#exampleModal2">Unete ahora</button>
          </div>

        </div>
      </div>
    </div>
  </section>



  <?php include_once("layout_footer.php") ?>




  <script>
    




    });
  </script>

 



</body>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"
  integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
  integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
</script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
  integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
</script>
<script src="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/js/splide.min.js"></script>

</html>