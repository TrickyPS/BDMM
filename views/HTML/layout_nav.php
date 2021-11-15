<?php 
$url = explode('/', $_SERVER['PHP_SELF']);
$currentUrl = strtolower(array_pop($url));
 ?>

<link rel="stylesheet" href="./../CSS/layout.css">
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Yanone+Kaffeesatz&display=swap" rel="stylesheet">
<script defer src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
<script src="./../JS/categoriasTop.js" defer> </script>
<style>
.tooltip1 {
  position: relative;
  display: inline-block;
}

.tooltip1 .tooltiptext1 {
  visibility: hidden;
  min-width: 120px;
  background-color: #141C29;
  color: #fff;
  text-align: center;
  border-radius: 6px;
  padding: 5px 10px;

  /* Position the tooltip */
  position: absolute;
  right:100%;
  z-index: 1000;
}

.tooltip1:hover .tooltiptext1 {
  visibility: visible;
}
</style>
<nav class="navbar navi  navbar-expand-lg navbar-dark fixed-top" id="_cartelera">
    <div class="namep pt-0">
        <?php
            if( $currentUrl == "cuenta.php" || $currentUrl == "cms.php" ){ ?>
        <span type="button" id="sidebarCollapse" class="btn mr-2 zoom" style=" color: rgb(255, 255, 255);">
            <span class="navbar-dark navbar-toggler-icon"></span>
        </span>
        <?php } ?>
        <img style="cursor:pointer;" class="negro imageno pb-2" src="../IMG/logooficial.png" width="45px">
        <a  class="variable zoom variable negro pr-5 navbar-brand titulo"
            onclick="javascript:location.href='../HTML/index.php';"
            style="color: whitesmoke; font-family: 'Bebas Neue', cursive; font-size: 25px;cursor:pointer">Continuity</a>
    </div>


    <button id="botonazo" class=" navbar-toggler" type="button" data-toggle="collapse"
        data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
        aria-label="Toggle navigation">
        <span class="navbar-dark navbar-toggler-icon"></span>
    </button>
    <div class="collapse justify-content-between navbar-collapse text-center" id="navbarSupportedContent" id="_Buscador">
            <div></div>
        <form action="categorias.php" class=" form1 form-inline justify-content-center" method="GET">
            <input class="buscador form-control input-group-sm mr-sm-2 justify-content-center" type="search"
                placeholder="Busca algo..." id="b_buscar" name="b"  aria-label="Search"
                style="width: 360px; font-family: 'Yanone Kaffeesatz', sans-serif; font-size: small;">
                <input type="hidden" name="by" id="b_option" value="">
                <input type="hidden" name="desde" id="b_desde" value="">
                <input type="hidden" name="a" id="b_a" value="">
                <input type="hidden" name="categoria" id="b_categoria" value="">
            <button class=" p1p btn button mt-0 ml-1 zoom"  type="submit"
                style="font-family: 'Yanone Kaffeesatz', sans-serif; font-size: small;">Buscar</button>

        </form>
        <div class="grupo">
            <ul class="navbar-nav text-center mx-auto mt-2"
                style="flex-direction: row; justify-content: space-evenly; font-family: 'Yanone Kaffeesatz', sans-serif;;">

                <div class="dropdown">
                <a class="zoom btn  palab cdp nav-link dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Categorias
                    </a>
                <div id="showCatTop" class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                   
                </div>
                </div>
                <a class="zoom btn d-none  palab cdp nav-link" data-toggle="modal" data-target="#exampleModal"
                    id="sesioninicia">
                    Inicia sesion
                </a>

                <a class="zoom btn d-none  palab cdp nav-link" data-toggle="modal" data-target="#exampleModal2"
                    id="sesionregistrate">
                    Registrate
                </a>

              
                

                <li class="nav-item d-none " id="infocuenta">

                    <a class="zoom cdp nav-link dropdown-toggle" href="#" id="sesionperfil" role="button"
                        data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                        <img style="border-radius: 50%;width: 24px; height:24px; object-fit:cover " class="mr-2" id="navImagePerfil" alt="">Cuenta
                    </a>
                    <div class="dropdown-menu  dropdown-menu-right" aria-labelledby="navbarDropdown">
                        <a class="dropdown-item " id="noadmins" href="../HTML/cuenta.php">Mi Cuenta</a>
                        <a class="dropdown-item " id="noadmins" href="../HTML/cuenta.php?o=h">Historial</a>
                        <a class="variable dropdown-item" id="admins" href="../HTML/cms.php">Administración</a>
                        <a class="variable dropdown-item" id="chat" href="../HTML/chat.php">Chat Privado</a>
                        <div class="dropdown-divider"></div>
                        <a class="dropdown-item " style="cursor:pointer;" onclick="cerrarSesion();">Cerrar
                            sesión</a>
                            
                    </div>
                </li>
            </ul>
            <script src="../JS/handlerUser.js"  ></script>
        </div>
    </div>
</nav>

<!-- Modal -->
<div class="modal fade modalon mt-5 p-5" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel"
    aria-hidden="true" style="font-family: 'Bebas Neue'">
    <div class="modal-dialog modal-dialog-centered " style="width:700px;">
        <div class="modal-content  modalon2">
            <button type="button" class="close ml-auto pr-2" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <div class=" col-12 ">
                <div class="modal-body">
                    <div class="form-title text-center">
                        <h4>Inicia sesión</h4>
                    </div>


                    <form id="rertol" accept-charset="utf-8" style="font-family: 'Archivo Narrow', sans-serif;">
                        <div class="form-group pl-5 pr-5">
                            <a>Correo electronico</a>
                            <input type="text" class="form-control" id="emaili" name="emaill"
                                placeholder="Ingresa tu correo electronico o usuario">
                        </div>
                        <div class="form-group pl-5 pr-5">
                            <a>Contraseña</a>
                            <input type="password" class="form-control" id="passwordi" name="passwordl"
                                placeholder="Ingresa tu contraseña">
                        </div>

                        <button type="submit" class="zoom btn btn-primary btn-md d-block mx-auto">Inicia sesion</button>

                    </form>


                    <div class="text-center text-muted delimiter pt-2">Sigue nuestras redes sociales</div>
                    <div class="text-center pt-5">
                        <a class="text-muted text-hover-primary " href="#" target="_blank" title="instagram">
                            <i class="fab fa-instagram p-1" style="font-size: 25px;"></i>
                        </a>

                        <a class="text-muted text-hover-primary p-1" href="#" target="_blank" title="facebook">
                            <i class="fab fa-facebook" style="font-size: 25px;"></i>
                        </a>

                        <a class="text-muted text-hover-primary p-1" href="#" target="_blank" title="twitter">
                            <i class="fab fa-twitter" style="font-size: 25px;"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div class="modal fade modalon mt-5" id="exampleModal2" tabindex="-1" aria-labelledby="exampleModalLabel"
    aria-hidden="true" style="font-family: 'Bebas Neue'">
    <div class="modal-dialog modal-dialog-centered  " style="width:700px;">
        <div class="modal-content  modalon2">
            <button type="button" class="close ml-auto pr-2" data-dismiss="modal" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
            <div class=" col-12 ">
                <div class="modal-body">
                    <div class="form-title text-center">
                        <h4>Crea una cuenta</h4>
                    </div>
                    <form id="rerto" accept-charset="utf-8" style="font-family: 'Archivo Narrow', sans-serif;">
                        <div class="form-group pl-5 pr-5">
                            <a>Nombre completo</a>
                            <input type="text" class="form-control" name="nombresign" id="nombrer"
                                placeholder="Escribe tu nombre completo" style="font-size:  14px;">
                        </div>
                        <div class="form-group pl-5 pr-5">
                            <a>Correo electronico</a>
                            <input type="email" class="form-control" name="correosign" id="emailr"
                                placeholder="Ingresa tu correo" style="font-size:  14px;">
                        </div>
                        <div class="form-group pl-5 pr-5">
                            <a>Contraseña</a>
                            <input type="password" class="form-control" name="contraseñasign" id="passwordr"
                                placeholder="Ingresa tu contraseña" style="font-size: 14px;">
                            <small class="form-text text-muted">
                                Tu contraseña deben ser mas de 8 cáracteres, al menos 1 número y un cáracter especial
                                (¡”#$%&/=’?¡¿:;,.-_+*{][}).
                            </small>
                        </div>

                        <div class="col-lg-12 col-sm-12 pb-3 pl-5 pr-5">
                            <a>Rol</a>
                            <label class="mr-sm-2 sr-only" for="tipo"
                                style="max-height: 200px !important;">Preference</label>
                            <select class="custom-select mr-sm-2" id="tipoest">
                                <option  value="true">Estudiante</option>
                                <option   value="false">Profesor</option>
                            </select>
                        </div>
                        <div class="grupo text-center pt-3">
                            <button type="sumbit" class="zoom btn btn-primary btn-md ">Registrate</button>
                        </div>
                    </form>
                    <div class="text-center text-muted delimiter pt-2">Sigue nuestras redes sociales</div>
                    <div class="text-center pt-3">
                        <a class="text-muted text-hover-primary p-1" href="#" target="_blank" title="instagram">
                            <i class="fab fa-instagram" style="font-size: 25px;"></i>
                        </a>
                        <a class="text-muted text-hover-primary p-1" href="#" target="_blank" title="facebook">
                            <i class="fab fa-facebook" style="font-size: 25px;"></i>
                        </a>
                        <a class="text-muted text-hover-primary p-1" href="#" target="_blank" title="twitter">
                            <i class="fab fa-twitter" style="font-size: 25px;"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../JS/UserAuth.js" defer></script>