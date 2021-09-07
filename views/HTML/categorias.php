<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Continuity-Chat</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
        integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="./../CSS/categorias.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js" defer></script>
</head>

<body>

    <?php include_once("layout_nav.php") ?>
    <div class="container cat-nav bg-light p-2" >
        <div class="container">
        <div class="  row align-items-center">
            <div class="col-md-3">
                
                    <select id="inputState" class="form-control">
                        <option selected>Categoria</option>
                        <option>...</option>
                    </select>
                

            </div>
            <div class="col-md-1 ">
                <p class="text-dark text-center pt-2">Desde:</p>
            </div>
            <div class="col-md-3">
                
                    <input type="date" name="" id="desdeDate" class="form-control" id="">
                

            </div>
            <div class="col-md-1 ">
                <p class="text-dark text-center pt-2">A:</p>
            </div>
            <div class="col-md-3  ">
                
                    <input type="date" name="" id="aDate"  class="form-control" id="">
                   

            </div>
            <div class="col-md-1 ">
            <button onclick="dateValidate()" class=" ml-2 btn btn-primary"><i class="fas fa-search"></i></button>
            </div>
        </div>

        </div>
    </div>
    <div class="container mt-3">
        <div class="row 1">

            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="product-grid">
                    <div class="product-image">
                        <a href="#">
                            <img class="pic-1" src="../IMG/python.png">

                        </a>
                        <ul class="social">
                            <li><a href="curso.html" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                            
                        </ul>
                        <span class="product-new-label">Sale</span>
                        <span class="product-discount-label">20%</span>
                    </div>
                    <ul class="rating">
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star disable"></li>
                    </ul>
                    <div class="product-content">
                        <h3 class="title"><a href="#">Curso de Python</a></h3>
                        <div class="price pb-2">$16.00
                            <span>$20.00</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="product-grid">
                    <div class="product-image">
                        <a href="#">
                            <img class="pic-1" src="../IMG/python.png">
                        </a>
                        <ul class="social">
                            <li><a href="curso.html" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                           
                        </ul>
                        <span class="product-new-label">Sale</span>
                        <span class="product-discount-label">50%</span>
                    </div>
                    <ul class="rating">
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                    </ul>
                    <div class="product-content">
                        <h3 class="title"><a href="#">Curso de Python</a></h3>
                        <div class="price pb-2">$16.00
                            <span>$20.00</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="product-grid">
                    <div class="product-image">
                        <a href="#">
                            <img class="pic-1" src="../IMG/python.png">
                        </a>
                        <ul class="social">
                            <li><a href="curso.html" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                           
                        </ul>
                        <span class="product-new-label">Sale</span>
                        <span class="product-discount-label">50%</span>
                    </div>
                    <ul class="rating">
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                    </ul>
                    <div class="product-content">
                        <h3 class="title"><a href="#">Curso de Python</a></h3>
                        <div class="price pb-2">$16.00
                            <span>$20.00</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="product-grid">
                    <div class="product-image">
                        <a href="#">
                            <img class="pic-1" src="../IMG/python.png">
                        </a>
                        <ul class="social">
                            <li><a href="curso.html" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                           
                        </ul>
                        <span class="product-new-label">Sale</span>
                        <span class="product-discount-label">50%</span>
                    </div>
                    <ul class="rating">
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                    </ul>
                    <div class="product-content">
                        <h3 class="title"><a href="#">Curso de Python</a></h3>
                        <div class="price pb-2">$16.00
                            <span>$20.00</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>

        <div class="row 2">

            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="product-grid">
                    <div class="product-image">
                        <a href="#">
                            <img class="pic-1" src="../IMG/angular.png">

                        </a>
                        <ul class="social">
                            <li><a href="curso.html" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                           
                        </ul>
                        <span class="product-new-label">Sale</span>
                        <span class="product-discount-label">20%</span>
                    </div>
                    <ul class="rating">
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star disable"></li>
                    </ul>
                    <div class="product-content">
                        <h3 class="title"><a href="#">Stack MEAN</a></h3>
                        <div class="price pb-2">$16.00
                            <span>$20.00</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="product-grid">
                    <div class="product-image">
                        <a href="#">
                            <img class="pic-1" src="../IMG/angular.png">
                        </a>
                        <ul class="social">
                            <li><a href="curso.html" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                            
                        </ul>
                        <span class="product-new-label">Sale</span>
                        <span class="product-discount-label">50%</span>
                    </div>
                    <ul class="rating">
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                    </ul>
                    <div class="product-content">
                        <h3 class="title"><a href="#">Stack MEAN</a></h3>
                        <div class="price pb-2">$16.00
                            <span>$20.00</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="product-grid">
                    <div class="product-image">
                        <a href="#">
                            <img class="pic-1" src="../IMG/angular.png">
                        </a>
                        <ul class="social">
                            <li><a href="curso.html" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                            
                        </ul>
                        <span class="product-new-label">Sale</span>
                        <span class="product-discount-label">50%</span>
                    </div>
                    <ul class="rating">
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                    </ul>
                    <div class="product-content">
                        <h3 class="title"><a href="#">Stack MEAN</a></h3>
                        <div class="price pb-2">$16.00
                            <span>$20.00</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="product-grid">
                    <div class="product-image">
                        <a href="#">
                            <img class="pic-1" src="../IMG/angular.png">
                        </a>
                        <ul class="social">
                            <li><a href="curso.html" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                           
                        </ul>
                        <span class="product-new-label">Sale</span>
                        <span class="product-discount-label">50%</span>
                    </div>
                    <ul class="rating">
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                    </ul>
                    <div class="product-content">
                        <h3 class="title"><a href="#">Curso de Javascript</a></h3>
                        <div class="price pb-2">$16.00
                            <span>$20.00</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>
        <div class="row 3">

            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="product-grid">
                    <div class="product-image">
                        <a href="#">
                            <img class="pic-1" src="../IMG/javascript.png">

                        </a>
                        <ul class="social">
                            <li><a href="curso.html" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                            
                        </ul>
                        <span class="product-new-label">Sale</span>
                        <span class="product-discount-label">20%</span>
                    </div>
                    <ul class="rating">
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star disable"></li>
                    </ul>
                    <div class="product-content">
                        <h3 class="title"><a href="#">Curso de Javascript</a></h3>
                        <div class="price pb-2">$16.00
                            <span>$20.00</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="product-grid">
                    <div class="product-image">
                        <a href="#">
                            <img class="pic-1" src="../IMG/javascript.png">
                        </a>
                        <ul class="social">
                            <li><a href="curso.html" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                            
                        </ul>
                        <span class="product-new-label">Sale</span>
                        <span class="product-discount-label">50%</span>
                    </div>
                    <ul class="rating">
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                    </ul>
                    <div class="product-content">
                        <h3 class="title"><a href="#">Stack MEAN</a></h3>
                        <div class="price pb-2">$16.00
                            <span>$20.00</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="product-grid">
                    <div class="product-image">
                        <a href="#">
                            <img class="pic-1" src="../IMG/javascript.png">
                        </a>
                        <ul class="social">
                            <li><a href="curso.html" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                            
                        </ul>
                        <span class="product-new-label">Sale</span>
                        <span class="product-discount-label">50%</span>
                    </div>
                    <ul class="rating">
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                    </ul>
                    <div class="product-content">
                        <h3 class="title"><a href="#">Curso de Javascript</a></h3>
                        <div class="price pb-2">$16.00
                            <span>$20.00</span>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-3 col-md-3 col-sm-6">
                <div class="product-grid">
                    <div class="product-image">
                        <a href="#">
                            <img class="pic-1" src="../IMG/javascript.png">
                        </a>
                        <ul class="social">
                            <li><a href="curso.html" data-tip="Quick View"><i class="fa fa-search"></i></a></li>
                           
                        </ul>
                        <span class="product-new-label">Sale</span>
                        <span class="product-discount-label">50%</span>
                    </div>
                    <ul class="rating">
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                        <li class="fa fa-star"></li>
                    </ul>
                    <div class="product-content">
                        <h3 class="title"><a href="#">Curso de Javascript</a></h3>
                        <div class="price pb-2">$16.00
                            <span>$20.00</span>
                        </div>
                    </div>
                </div>
            </div>

        </div>


        <div class="d-flex justify-content-center">
        <div class="pagination justify-content-center pt-2 m-3">
            <a href="#">&laquo;</a>
            <a href="#">1</a>
            <a class="active" href="#">2</a>
            
            <a href="#">&raquo;</a>
        </div>
        </div>

    </div>
    <?php include_once("layout_footer.php") ?>


    <script src="https://code.jquery.com/jquery-3.6.0.min.js"
        integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
        integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous">
    </script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
        integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous">
    </script>
    <script>
        function dateValidate(){
            var desde = document.getElementById("desdeDate").value;
            var a = document.getElementById("aDate").value;

            var dateDesde = new Date(desde);
            var dateA = new Date(a);
            
            if(dateA < dateDesde){
                toastr.warning("Cuidado","Fechas deben estar en un rango")
            }
        }
    </script>
</body>



</html>