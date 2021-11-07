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
    <link rel="stylesheet" href="../CSS/Curso.css">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <!-- or the reference on CDN -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/css/splide.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/intro.js/3.2.1/introjs.css"
        integrity="sha512-i+WzzATeaDcwcfi5CfLn63qBxrKqiQvDLC+IChU1zVlaPguPgJlddOR07nU28XOoIOno9WPmJ+3ccUInpmHxBg=="
        crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/@splidejs/splide@latest/dist/css/splide.min.css">
    <link rel="stylesheet" href="../CSS/Onboarding.css">
    <link rel="stylesheet" href="../CSS/toast.css">
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
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" defer></script>
    <script src="./../JS/video.js" defer></script>
    <title>Continuity-Video</title>
</head>

<body style="overflow-x: hidden;">
   
<?php include_once("layout_nav.php") ?>

    <div class="row" style="padding-top: 80px;">

    

        <div class="col-lg-8 pt-2 mt-2" style="padding-left: 50px;">
            <h2 id="titleVideo" style="font-family: 'Archivo Narrow', sans-serif; font-size: 30px;"></h2>
            <div class="row justify-content-center">
                <div class="col-lg-12 col-md-8 col-sm-12">

                    <video id="srcVideo" controls ="controls" class="jutify-content-center " width="100%" height="auto" >
                        
                    </video>
                    
                </div>

            </div>


            </form>

        </div>
        <div class="col-lg-4 mt-2">


            <h2 class="title text-center pt-3" style="font-family: 'Archivo Narrow', sans-serif; font-size: 40px;">
                Niveles del curso</h2>
            <div id="accordion" class="pb-5 justify-content-center examplee" style="font-family: 'Archivo Narrow', sans-serif; overflow-y:scroll; height: 190px;" >
                <div class="col-lg-12 mx-auto">
                    <div class="card-header" id="headingOne">
                        <h5 class="mb-0">
                            <button class="btn" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true"
                                aria-controls="collapseOne">
                                Nivel 1
                            </button>
                            <span></span>
                            <span></span>
                        </h5>
                    </div>

                    <div id="collapseOne" class="collapse show" aria-labelledby="headingOne" data-parent="#accordion">
                        <div class="card-body">
                            <span>Video uno de practica de programacion con Python.</span>
                            <button  onclick="location.href = 'video.php'" class=" p1p btn button mt-0 ml-1 zoom float-right"  id="botonsearch" type="submit"
                            style="font-family: 'Yanone Kaffeesatz', sans-serif; font-size: small;">Ver</button>
                           </div>
                    </div>
                </div>
                <div class="col-lg-12 mx-auto">
                    <div class="card-header" id="headingTwo">
                        <h5 class="mb-0">
                            <button class="btn collapsed" data-toggle="collapse" data-target="#collapseTwo"
                                aria-expanded="false" aria-controls="collapseTwo">
                                Nivel 2
                            </button>
                            <span></span>
                            <span> </span>
                        </h5>
                    </div>
                    <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordion">
                        <div class="card-body">
                            <span>Video uno de practica de programacion con Python.</span>
                            <button  onclick="location.href = 'video.php'" class=" p1p btn button mt-0 ml-1 zoom float-right"  id="botonsearch" type="submit"
                            style="font-family: 'Yanone Kaffeesatz', sans-serif; font-size: small;">Ver</button>
                           </div>

                    </div>
                </div>
                <div class="col-lg-12 mx-auto">
                    <div class="card-header" id="headingThree">
                        <h5 class="">
                            <button class="btn collapsed" data-toggle="collapse" data-target="#collapseThree"
                                aria-expanded="false" aria-controls="collapseThree">
                                Nivel 3
                            </button>
                            <span></span>
                            <span></span>
                        </h5>
                    </div>
                    <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordion">
                        <div class="card-body">
                            <span>Video uno de practica de programacion con Python.</span>
                            <button  onclick="location.href = 'video.php'" class=" p1p btn button mt-0 ml-1 zoom float-right"  id="botonsearch" type="submit"
                            style="font-family: 'Yanone Kaffeesatz', sans-serif; font-size: small;">Ver</button>
                           </div>
                    </div>
                </div>
                <div class="col-lg-12 mx-auto">
                    <div class="card-header" id="headingFour">
                        <h5 class="mb-0">
                            <button class="btn collapsed" data-toggle="collapse" data-target="#collapseFour"
                                aria-expanded="false" aria-controls="collapseFour">
                                Nivel 4
                            </button>
                            <span></span>
                            <span></span>
                        </h5>
                    </div>
                    <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordion">
                        <div class="card-body">
                            <span>Video uno de practica de programacion con Python.</span>
                            <button  onclick="location.href = 'video.php'" class=" p1p btn button mt-0 ml-1 zoom float-right"  id="botonsearch" type="submit"
                            style="font-family: 'Yanone Kaffeesatz', sans-serif; font-size: small;">Ver</button>
                           </div>
                    </div>
                </div>
                
              
            </div>  <div class="text-center">
                        <h2>Contenido del nivel </h2>
            </div>
    
            <div class="contenidon text-center examplee" style="overflow-y: scroll; height: 290px;" >
              
            <ul class="list-group" id="contResources" style="color: white;">
               
               
                
            
              </ul>
            </div>
      
        </div>


    </div>






    </div>


    </div>



    <?php include_once("layout_footer.php") ?>



   



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