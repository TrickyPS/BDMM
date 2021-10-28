<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="./../IMG/logooficial.png" type="image/png">
    <title>Continuity-CMS</title>
    <!----Semantic ui-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/semantic-ui/2.4.1/semantic.min.css">
    <script src="https://cdn.jsdelivr.net/npm/semantic-ui@2.4.2/dist/semantic.min.js" defer></script>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="./../CSS/cms.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" defer></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/uuid/8.1.0/uuidv4.min.js"></script>

    <script src="./../JS/cms/video.js" defer></script>
    <script src="./../JS/cms/nivel.js" defer></script>
    <script src="./../JS/cms/curso.js" defer></script>
    <script src="./../JS/cms/category.js" defer></script>
    <script src="./../JS/cms.js" defer></script>
</head>

<body>

    <?php include_once("layout_nav.php") ?>



    <div class="cms-container">
        <div class="row ">
            <div id="nav-cms" class="col-lg-2">

                <div  class="nav">
                    <div  onclick="toggleNav('dashboard')" class="item-nav cms-act">Dashboard <i
                            class="fas fa-tachometer-alt"></i> </div>
                    <div id="btnMyCourses" onclick="toggleNav('misCursos')" class="item-nav cms-act">Mis Cursos <i
                            class="fas fa-laptop-house"></i> </div>
                    <div class="item-nav cms-des">Agregar Nuevo</div>
                    <div id="btnCourse" onclick="toggleNav('curso')" class="item-nav cms-act"> Curso <i
                            class="fas fa-arrow-circle-right"></i> </div>
                    <div id="btnLevel" onclick="toggleNav('nivel')" class="item-nav cms-act"> Nivel <i
                            class="fas fa-arrow-circle-right"></i></div>
                    <div id="btnVideo" onclick="toggleNav('video')" class="item-nav cms-act"> Video <i
                            class="fas fa-arrow-circle-right"></i></div>
                    <div id="btnCategory" onclick="toggleNav('categoria')" class="item-nav cms-act"> Categoria <i
                            class="fas fa-arrow-circle-right"></i></div>

                </div>

            </div>
            <div id="cms-container" class="col-lg-10 container cms-pad  pt-4">
                <div id="dashboard">
                    <div class="row">
                        <div class="col-md-8">
                            <div class="row">
                                <div class="col-md-4">
                                    <div class="card shadow">
                                        <div class="card-body">
                                            <div class="h5"> Total</div>
                                            <div class="card-text">$8,600.00 MXN</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card shadow">
                                        <div class="card-body">
                                            <div class="h5"> Total Semanal</div>
                                            <div class="card-text">$1,200.00 MXN</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <div class="card shadow">
                                        <div class="card-body">
                                            <div class="h5"> Cursos Vendidos</div>
                                            <div class="card-text">5 cursos</div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row p-2 mt-2">
                                <div class="col-12 card p-2  shadow">
                                    <p class="h5 pl-2">Ingresos</p>
                                    <canvas id="myChart"></canvas>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="  card shadow pt-3">
                                <p class="h5 pl-3">Cursos Mas Vendidos</p>
                                <ul class="list-group">
                                    <li
                                        class="list-group-item d-flex flex-row justify-content-between align-items-center list-group-item-action">
                                        <div class="h4">1</div>
                                        <img src="" alt="Curso" class="img-thubnail">
                                        <div class="h5">$2,500.00</div>
                                    </li>
                                    <li
                                        class="list-group-item d-flex flex-row justify-content-between align-items-center list-group-item-action">
                                        <div class="h4">2</div>
                                        <img src="" alt="Curso" class="img-thubnail">
                                        <div class="h5">$2,100.00</div>
                                    </li>
                                    <li
                                        class="list-group-item d-flex flex-row justify-content-between align-items-center list-group-item-action">
                                        <div class="h4">3</div>
                                        <img src="" alt="Curso" class="img-thubnail">
                                        <div class="h5">$1,400.00</div>
                                    </li>

                                </ul>
                            </div>
                            <div class="card shadow p-3 mt-2 mb-4">
                                <p class="h5">Mejores Categorias</p>
                                <canvas id="categoryChart"></canvas>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="misCursos">
                    <p class="h2 pl-2">
                        Mis Cursos
                    </p>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="card shadow p-3 mt-3 mb-3">
                                <table class="table">

                                    <thead>
                                        <tr>
                                            <th>Curso</th>
                                            <th>Status</th>
                                            <th>Precio</th>
                                            <th>Inscritos</th>
                                            <th>Ingresos</th>
                                            <th>Nivel promedio</th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>Javascript Introducción</td>
                                            <td>Público <i class="fas fa-globe-americas text-success"></i></td>
                                            <td>$500.00</td>
                                            <td>14</td>
                                            <td>$7,000</td>
                                            <td>3</td>
                                            <td><button class="btn btn-sm btn-primary ">Ver detalle</button></td>
                                            <td> <button class="btn  btn-sm btn-info" onclick="toggleNav('curso')"> <i
                                                        class="fas fa-pen"></i> Editar</button> </td>
                                            <td><button class="btn btn-sm btn-ligth"
                                                    onclick="location.href='curso.php'"><i
                                                        class="far fa-eye"></i></button></td>
                                        </tr>
                                        <tr>
                                            <td>Golang Gorilla-Mux</td>
                                            <td>Público <i class="fas fa-globe-americas text-success"></i></td>
                                            <td>$400.00</td>
                                            <td>4</td>
                                            <td>$1,600</td>
                                            <td>5</td>
                                            <td><button class="btn btn-sm btn-primary ">Ver detalle</button></td>
                                            <td> <button class="btn  btn-sm btn-info" onclick="toggleNav('curso')"> <i
                                                        class="fas fa-pen"></i> Editar</button> </td>
                                            <td><button class="btn btn-sm btn-ligth"
                                                    onclick="location.href='curso.php'"><i
                                                        class="far fa-eye"></i></button></td>
                                        </tr>
                                        <tr>
                                            <td>React Native</td>
                                            <td>No público <i class="fas fa-globe-americas text-secondary"></i></td>
                                            <td>$650.00</td>
                                            <td>0</td>
                                            <td>$0.00</td>
                                            <td>0</td>
                                            <td><button class="btn btn-sm btn-primary ">Publicar <i
                                                        class="fas fa-globe-americas "></button></td>
                                            <td> <button class="btn  btn-sm btn-info" onclick="toggleNav('curso')"> <i
                                                        class="fas fa-pen"></i> Editar</button> </td>
                                            <td><button class="btn btn-sm btn-ligth"
                                                    onclick="location.href='curso.php'"><i
                                                        class="far fa-eye"></i></button></td>
                                        </tr>

                                        <tr>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <th>Total: $8,600.00</th>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                            <td></td>
                                        </tr>

                                    </tbody>
                                </table>
                            </div>
                            <div class="card shadow p-3 mt-3 mb-3">
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>Formas de pago</th>
                                            <td>Master Card</td>
                                            <td>Paypal</td>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th>Ingresos</th>
                                            <td>6200</td>
                                            <td>2400</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <div class="card shadow p-3 mt-3 mb-3">
                                <p class="h4">Detalles del Curso Javascript Introducción</p>
                                <table class="table">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Alumno</th>
                                            <th>Correo</th>
                                            <th>Pago</th>
                                            <th>Forma de pago</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>1</td>
                                            <td>Pedro Angel Ramírez Villarreal</td>
                                            <td>pedro@gmail.com</td>
                                            <td>$500.00</td>
                                            <td>Master Card</td>
                                        </tr>
                                        <tr>
                                            <td>2</td>
                                            <td>Jesus Angel Paredes Sauceda</td>
                                            <td>angel @gmail.com</td>
                                            <td>$500.00</td>
                                            <td>Master Card</td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="curso">
                    <p class="h2 pl-2">Cursos</p>
                    <div class="row">
                        <div class="col-lg-4 p-4">
                            <div class="card shadow p-3">
                                <p class="h2 mb-3">Agregar Curso</p>
                                <form class="w-100" id="formCurso">
                                    <div class="form-group">
                                        <input class="form-control" type="text" id="Ccurso"
                                            placeholder="Nombre del curso...">
                                    </div>
                                    <div class="form-group">
                                        <input class="form-control" type="text" id="Cdescription"
                                            placeholder="Descripcion del curso...">
                                    </div>

                                    <div class="form-group">
                                        <select class=" ui drop w-100 " placeholder="si" multiple="" id="Ccategoria">
                                        <option value="" >Selecciona la categoria</option>
                                         
                                        </select>
                                    </div>

                                    <div class="custom-file mb-3">
                                        <input type="file" class="custom-file-input" lang="es" id="Cimagen">
                                        <label class="custom-file-label" for="customFileLang">Seleccionar imagen del
                                            curso</label>
                                    </div>

                                    <label for="" class="d-block">Gratis</label>
                                    <input type="checkbox" onchange="stateSwitch()" name="switch" id="switch"
                                        class="switch">
                                    <label for="switch" class="lbl-switch"></label>

                                    <div class="form-group">

                                        <input class="form-control" step="0.01" min="0.01" type="number" id="Cprecio"
                                            name="precio" placeholder="Precio del curso">

                                    </div>


                                    <div class="form-group d-flex justify-content-center">
                                        <input id="btnAddCurso" type="submit" class="btn btn-primary zoom " value="Agregar">
                                    </div>


                                </form>
                            </div>
                        </div>
                        <div class="col-lg-8 p-4">
                            <div class="card shadow p-3">
                                <table class="table ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Curso</th>
                                            <th>Precio</th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody id="tableShowCursos">
                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="nivel">
                    <p class="h2 pl-2">Niveles</p>
                    <div class="row">
                        <div class="col-lg-4 p-4">
                            <div class="card shadow p-3">
                                <p class="h2 mb-3">Agregar Nivel</p>
                                <form class="w-100" id="formNivel" action="">
                                    <div class="form-group">
                                        <input class="form-control" type="text" id="Nnivel"
                                            placeholder="Nombre del nivel...">
                                    </div>

                                    <div class="form-group">
                                        <select class="custom-select" id="Ncurso">
                                           
                                        </select>
                                    </div>
                                    <label for="" class="d-block">Gratis</label>
                                    <input type="checkbox" onchange="stateSwitchLevel()"  name="switch" id="switchLevel" class="switch" >
                                    <label for="switchLevel"   class="lbl-switch"></label>

                                    <div class="form-group">

                                        <input class="form-control" step="0.01" min="0.01" type="number" id="Lprecio"
                                            name="precio" placeholder="Precio del nivel">

                                    </div>
                                    <label for="">Contenidos Adjuntos</label>
                                    <div class="custom-file mb-3">
                                        <input  type="file" class="custom-file-input" id="filesNivelCms" lang="es">
                                        <label class="custom-file-label" for="customFileLang">Seleccionar
                                            Archivos</label>
                                    </div>
                                    <div class="row mb-3">
                                        <div class="col">
                                            <input id="urlInput" type="text" class="form-control" placeholder="Url ...">
                                        </div>
                                        <div class="col">
                                            <button id="btnUrl" type="button" class="btn btn-secondary"> Agregar link</button>
                                        </div>
                                    </div>
                                    <small class="text-muted"> Documentos agregados </small>
                                    <div class="form-group">
                                        <div id="contResourcesCms" class="list-group">
                                            
                                        </div>
                                    </div>

                                    <div class="form-group d-flex justify-content-center">
                                        <input type="submit" class="btn btn-primary zoom " value="Agregar">
                                    </div>


                                </form>
                            </div>
                        </div>
                        <div class="col-lg-8 p-4">
                            <div class="card shadow p-3">
                                <table class="table ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Nivel</th>
                                            <th>Curso</th>
                                            <th>Precio</th>
                                            <th></th>
                                            <th></th>
                                        </tr>
                                    </thead>
                                    <tbody id="tableNivel">
                                        

                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="video">
                    <p class="h2 pl-2">Videos</p>
                    <div class="row">
                        <div class="col-lg-4 p-4">
                            <div class="card shadow p-3">
                                <p class="h2 mb-3">Agregar Video</p>
                                <form class="w-100" id="formVideo" action="">
                                    <div class="form-group">
                                        <input class="form-control" type="text" id="Vname"
                                            placeholder="Título del video...">
                                    </div>

                                    
                                    <div class="form-group">
                                        <select id="Vcurso" class="custom-select">
                                           
                                            
                                        </select>
                                    </div>

                                    <div class="form-group">
                                        <select class="custom-select" id="Vnivel">
                                            <option selected value="0">Seleciona el nivel</option>
                                        </select>
                                    </div>
                                    <div class="custom-file mb-3">
                                        <input type="file" class="custom-file-input" id="Vvideo" lang="es">
                                        <label class="custom-file-label" for="customFileLang">Seleccionar Video</label>
                                    </div>
                                    <div class="form-group d-flex justify-content-center">
                                        <input type="submit" class="btn btn-primary zoom " value="Agregar">
                                    </div>

                                </form>
                            </div>
                        </div>
                        <div class="col-lg-8 p-4">
                            <div class="card shadow p-3">
                                <table class="table ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Video</th>
                                            <th>Nivel</th>
                                            <th>Curso</th>
                                            <th></th>
                                            
                                        </tr> 
                                    </thead>
                                    <tbody id="tableVideos">
                                        
                                       
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <div id="categoria">
                    <p class="h2 pl-2">Categorias</p>
                    <div class="row">
                        <div class="col-lg-4 p-4">
                            <div class="card shadow p-3">
                                <p class="h2 mb-3">Agregar Categoria</p>
                                <form class="w-100" id="formCategoria" >
                                    <div class="form-group">
                                        <input class="form-control" type="text" id="Catname"
                                            placeholder="Nombre de categoria...">
                                    </div>

                                    <div class="form-group">
                                        <textarea class="form-control" id="Catdescription"
                                            placeholder="Descripción de la categoria..." rows="3"></textarea>

                                    </div>

                                    <div class="form-group d-flex justify-content-center">
                                        <input type="submit" class="btn btn-primary zoom " value="Agregar">
                                    </div>

                                </form>
                            </div>
                        </div>
                        <div class="col-lg-8 p-4">
                            <div class="card shadow p-3">
                                <table class="table ">
                                    <thead>
                                        <tr>
                                            <th>#</th>
                                            <th>Categoria</th>
                                            <th>Descripción</th>
                                        </tr>
                                    </thead>
                                    <tbody id="tableShowCategories">
                                        
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <?php include_once("layout_footer.php") ?>

    <script>
    const labels = [
        'January',
        'February',
        'March',
        'April',
        'May',
        'June'
    ];
    const data = {
        labels: labels,
        datasets: [{
            label: 'My First dataset',
            backgroundColor: 'rgb(255, 99, 132)',
            borderColor: 'rgb(255, 99, 132)',
            data: [0, 10, 5, 2, 20, 30],
        }]
    };

    const dataCategory = {
        labels: labels,
        datasets: [{
            label: 'My First dataset',
            backgroundColor: ['rgb(255, 99, 132)',
                'rgb(54, 162, 235)',
                'rgb(255, 205, 86)',
                'rgb(54,235,162)',
                'rgb(162,54,240)',
                'rgb(40,255,100)'
            ],
            borderColor: 'rgb(255, 99, 132)',
            data: [5, 10, 5, 2, 20, 30],
        }]
    };

    const config = {
        type: 'line',
        data: data,
        options: {}
    };
    var myChart = new Chart(
        document.getElementById('myChart'),
        config
    );
    var categoryChart = new Chart(
        document.getElementById('categoryChart'), {
            type: 'doughnut',
            data: dataCategory,
            options: {}
        }
    );
    </script>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>

</body>

</html>