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
    <link rel="stylesheet" href="../CSS/Cuenta.css">

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


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css" />
    <link href="https://fonts.googleapis.com/css2?family=Oswald:wght@600&display=swap" rel="stylesheet">

    <link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Staatliches&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Source+Code+Pro:ital,wght@1,300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Raleway:ital,wght@1,300&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Arimo&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Yanone+Kaffeesatz&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Archivo+Narrow&display=swap" rel="stylesheet">
    <title>Continuity-Cuenta</title>
</head>

<body style="background-color: #F2F7F9;">
    <?php include_once("layout_nav.php") ?>
    <div class="wrapper" style="padding-top: 66px; overflow-x: hidden;">

        <nav id="sidebar" style="background-color: black; padding-top: 80px;">

            <div class="sidebar-header" style="color: ghostwhite !important; background-color: black;">
                <h3 style="font-family: 'Bebas Neue', sans-serif;">Navegacion</h3>
            </div>

            <ul class="list-unstyled components" style="font-family: 'Archivo Narrow', sans-serif;">

                <li>
                    <a class="zoom opcion" style="padding-left: 20px;"><i class="fas fa-home navegacion"></i>Inicio</a>
                </li>
                <li>
                    <a type="button " class=" zoom opcion" style="padding-left: 20px;" id="boton2"><i
                            class="fab fa-youtube navegacion"></i>Mis cursos</a>
                </li>
                <li>
                    <a type="button" class=" zoom opcion  " style="padding-left: 20px;" id="boton1"><i
                            class="fas fa-address-card navegacion"></i>Mi
                        perfil</a>

                </li>


                <!--     <button id="boton1" class="button mt-2"><span>Mi cuenta</span></button>
                 <button id="boton2" class="button mt-2"><span>Cursos</span></button> -->
            </ul>
        </nav>

        <div class="contenidoGeneral pl-4 col-lg-12" style="font-family: 'Archivo Narrow', sans-serif;">
            <div class="d-none division2">
                <div class=" d-flex  justify-content-center mx-auto"
                    style="  padding-top: 20px; font-family: 'Archivo Narrow', sans-serif;">

                </div>
                <div class="division2 pb-4" id="cursotes " style="font-family: 'Archivo Narrow', sans-serif;">
                    <section class="pt-4   cursos d-flex align-items-center">
                        <div class="container " style="overflow-x: hidden; overflow-y: scroll; height: 550px;">
                            <div class="col-lg-12 col-md-12 col-sm-12 row pb-3"
                                style="border:rgb(48, 16, 16) 1px !important; border-style: 1px !important;">
                                <div class="col-lg-4">
                                    <img class="shadow card-img-right" alt="" style="width: 300px; height:213px;"
                                        src="../IMG/python.png" data-holder-rendered="true">
                                </div>
                                <div class="col-lg-8">
                                    <h3>Curso de Python</h3>
                                    <h3 class="mb-0">
                                        <a class="text-dark" href="#">Categoria</a>
                                    </h3>

                                    <p class="card-text mb-auto" style="font-size: 15px;">Lorem ipsum dolor sit amet
                                        consectetur
                                        adipisicing elit. Corporis, ipsum? Laborum modi sunt, laboriosam quaerat tenetur
                                        recusandae
                                        mollitia, illum reiciendis eos sed, soluta totam itaque expedita cupiditate
                                        esse. Temporibus
                                        animi itaque iste aperiam esse debitis.</p>
                                    <div class="text-center">
                                        <span class=" mx-auto">Progreso del curso : 100%</span>
                                    </div>

                                    <div class="progress mx-auto" style="width: 500px;">
                                        <div class="progress-bar" role="progressbar" style="width: 100%"
                                            aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <div class="text-center">
                                        <button type="button" onclick="location.href = 'curso.php'"
                                            class="btn btn-dark  btn-lg mt-2 zoom justify-content-center"
                                            style="width:150px; font-size: 17px;">Ver
                                            clase</button>
                                    </div>




                                </div>

                            </div>
                            <hr>
                            <div class="col-lg-12 col-md-12 col-sm-12 row pb-3"
                                style="border:rgb(48, 16, 16) 1px !important; border-style: 1px !important;">
                                <div class="col-lg-4">
                                    <img class="shadow card-img-right" alt="" style="width: 300px; height:213px;"
                                        src="../IMG/python.png" data-holder-rendered="true">
                                </div>
                                <div class="col-lg-8">
                                    <h3>Curso de Python</h3>
                                    <h3 class="mb-0">
                                        <a class="text-dark" href="#">Categoria</a>
                                    </h3>

                                    <p class="card-text mb-auto" style="font-size: 15px;">Lorem ipsum dolor sit amet
                                        consectetur
                                        adipisicing elit. Corporis, ipsum? Laborum modi sunt, laboriosam quaerat tenetur
                                        recusandae
                                        mollitia, illum reiciendis eos sed, soluta totam itaque expedita cupiditate
                                        esse. Temporibus
                                        animi itaque iste aperiam esse debitis.</p>
                                    <div class="text-center">
                                        <span class=" mx-auto">Progreso del curso : 100%</span>
                                    </div>

                                    <div class="progress mx-auto" style="width: 500px;">
                                        <div class="progress-bar" role="progressbar" style="width: 100%"
                                            aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <div class="text-center">
                                        <button type="button" onclick="location.href = 'curso.php'"
                                            class="btn btn-dark  btn-lg mt-2 zoom justify-content-center"
                                            style="width:150px; font-size: 17px;">Ver
                                            clase</button>
                                    </div>




                                </div>

                            </div>
                            <hr>
                            <div class="col-lg-12 col-md-12 col-sm-12 row pb-3"
                                style="border:rgb(48, 16, 16) 1px !important; border-style: 1px !important;">
                                <div class="col-lg-4">
                                    <img class="shadow card-img-right" alt="" style="width: 300px; height:213px;"
                                        src="../IMG/python.png" data-holder-rendered="true">
                                </div>
                                <div class="col-lg-8">
                                    <h3>Curso de Python</h3>
                                    <h3 class="mb-0">
                                        <a class="text-dark" href="#">Categoria</a>
                                    </h3>

                                    <p class="card-text mb-auto" style="font-size: 15px;">Lorem ipsum dolor sit amet
                                        consectetur
                                        adipisicing elit. Corporis, ipsum? Laborum modi sunt, laboriosam quaerat tenetur
                                        recusandae
                                        mollitia, illum reiciendis eos sed, soluta totam itaque expedita cupiditate
                                        esse. Temporibus
                                        animi itaque iste aperiam esse debitis.</p>
                                    <div class="text-center">
                                        <span class=" mx-auto">Progreso del curso : 100%</span>
                                    </div>

                                    <div class="progress mx-auto" style="width: 500px;">
                                        <div class="progress-bar" role="progressbar" style="width: 100%"
                                            aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <div class="text-center">
                                        <button type="button" onclick="location.href = 'curso.php'"
                                            class="btn btn-dark  btn-lg mt-2 zoom justify-content-center"
                                            style="width:150px; font-size: 17px;">Ver
                                            clase</button>
                                    </div>




                                </div>

                            </div>
                            <hr>
                            <div class="col-lg-12 col-md-12 col-sm-12 row pb-3"
                                style="border:rgb(48, 16, 16) 1px !important; border-style: 1px !important;">
                                <div class="col-lg-4">
                                    <img class="shadow card-img-right" alt="" style="width: 300px; height:213px;"
                                        src="../IMG/python.png" data-holder-rendered="true">
                                </div>
                                <div class="col-lg-8">
                                    <h3>Curso de Python</h3>
                                    <h3 class="mb-0">
                                        <a class="text-dark" href="#">Categoria</a>
                                    </h3>

                                    <p class="card-text mb-auto" style="font-size: 15px;">Lorem ipsum dolor sit amet
                                        consectetur
                                        adipisicing elit. Corporis, ipsum? Laborum modi sunt, laboriosam quaerat tenetur
                                        recusandae
                                        mollitia, illum reiciendis eos sed, soluta totam itaque expedita cupiditate
                                        esse. Temporibus
                                        animi itaque iste aperiam esse debitis.</p>
                                    <div class="text-center">
                                        <span class=" mx-auto">Progreso del curso : 100%</span>
                                    </div>

                                    <div class="progress mx-auto" style="width: 500px;">
                                        <div class="progress-bar" role="progressbar" style="width: 100%"
                                            aria-valuenow="100" aria-valuemin="0" aria-valuemax="100"></div>
                                    </div>
                                    <div class="text-center">
                                        <button type="button" onclick="location.href = 'curso.php'"
                                            class="btn btn-dark  btn-lg mt-2 zoom justify-content-center"
                                            style="width:150px; font-size: 17px;">Ver
                                            clase</button>
                                    </div>




                                </div>

                            </div>
                            <hr>




                        </div>

                    </section>
                </div>
            </div>
            <div class="division1">
                <div class="division container" id="cuentota">

                    <section class=" cuenta d-flex align-items-center" id="home" data-scroll-index="0"
                        style="padding-top: 70px;">

                        <div class="col-lg-5 mx-auto text-center pt-4">
                            <img class="rounded-circle" id="avatar" alt=""
                                style="height: 150px; width: 150px;object-fit:cover ">
                            <title>Placeholder</title>
                            </svg>
                            <h5 id="isStudent"></h5>
                            <h2 id="nameUser"></h2>
                            <div class="text-center  mx-auto justify-content m-3">
                                <label class=" p1p btn button mt-0 ml-1 zoom" for="updateAvatar"
                                    style="font-family: 'Yanone Kaffeesatz', sans-serif; font-size: 20px; width: 200px;">Cambiar
                                    Imagen</label>

                                    <input multiple="false" type="file" class="d-none" accept="image/png, image/jpeg" onchange="showImage()" id="updateAvatar">

                            </div>
                        </div>

                    </section>
                    <section id="cursotes" class="  cursos d-flex align-items-center " id="home" data-scroll-index="0">

                        <div class="mx-auto col-lg-6 col-md-12 col-sm-12">
                            <div class="box-shadow justify-content-center mx-auto">
                                <div class="col-lg-12 col-md-12 col-sm-12 col-12">
                                    <h4 class="mb-3 mx-auto text-center" id="createdAt"></h4>
                                </div>
                                <form id="formularioCuenta" class="row justify-content-center">
                                    <div class=" col-lg-6 col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label for="fullName" style="font-size: 20px;">Nombre Completo</label>
                                            <input type="text" class="form-control" id="nameP"
                                                placeholder="Ingrese el nombre">
                                        </div>
                                    </div>
                                    <div class=" col-lg-6 col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label for="eMail" style="font-size: 20px;">Correo electrónico</label>
                                            <input type="email" class="form-control" id="emailP"
                                                placeholder="Ingrese el correo ">
                                        </div>
                                    </div>
                                    <div class=" col-lg-6 col-md-6 col-sm-12">
                                        <div class="form-group">
                                            <label for="password" style="font-size: 20px;">Contraseña</label>
                                            <input type="password" class="form-control" id="passwordP"
                                                placeholder="Contraseña" style="font-size:  15px;">
                                        </div>
                                    </div>

                                    <div class="col-lg-6 col-sm-12 pb-3 ">
                                        <label for="eMail" style="font-size: 20px;">Genero</label>

                                        <select id="genderP" class="custom-select mr-sm-2" 
                                            style="width: 100% !important;">
                                            <option id="opcion" value="">Seleccionar Género</option>
                                            <option id="opcion" value="1">Masculino</option>
                                            <option id="opcion" value="2">Femenino</option>
                                            <option id="opcion" value="3">Otro</option>
                                        </select>
                                    </div>
                                    <div class="col-lg-6 col-md-6 col-sm-12 text-center">

                                        <div class="form-group text-left">

                                            <label for="birthdaytime" class="" style="font-size: 20px;">Fecha de
                                                nacimiento</label>
                                            <input type="date" class="form-control" id="birthdaytime"
                                                name="birthdaytime" style="width: 100%; font-size: 15px;">
                                        </div>
                                    </div>


                                    <div class="col-lg-12 col-md-12 col-sm-12 ">
                                        <div class="text-center  mx-auto justify-content m-3">
                                            <button class=" p1p btn button mt-0 ml-1 zoom" id="botonsearch"
                                                type="submit"
                                                style="font-family: 'Yanone Kaffeesatz', sans-serif; font-size: 20px; width: 200px;">Actualizar
                                                perfil</button>

                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>


                    </section>
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
<script src="../JS/Cuenta.js"></script>

</html>