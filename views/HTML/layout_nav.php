<link rel="stylesheet" href="./../CSS/layout.css">
<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Yanone+Kaffeesatz&display=swap" rel="stylesheet">
<nav class="navbar navi  navbar-expand-lg navbar-dark fixed-top" id="_cartelera">
    <div class="namep pt-0">
      <img class="negro imageno pb-2" src="../IMG/logooficial.png" width="45px">
      <a class="variable zoom variable negro pr-5 navbar-brand titulo"
        onclick="javascript:location.href='../HTML/IndexNuevo.php';"
        style="color: whitesmoke; font-family: 'Bebas Neue', cursive; font-size: 25px;">Continuity</a>
    </div>

    <button id="botonazo" class=" navbar-toggler" type="button" data-toggle="collapse"
      data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false"
      aria-label="Toggle navigation">
      <span class="navbar-dark navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse text-center" id="navbarSupportedContent" id="_Buscador">

      <form class=" form1 form-inline justify-content-center" id="_Buscador">
        <input class="buscador form-control input-group-sm mr-sm-2 justify-content-center" type="search"
          placeholder="Busca algun producto..." aria-label="Search"
          style="width: 260px; font-family: 'Yanone Kaffeesatz', sans-serif; font-size: small;"">
            <button class=" p1p btn button mt-0 ml-1 zoom" id="botonsearch" type="submit"
          style="font-family: 'Yanone Kaffeesatz', sans-serif; font-size: small;">Buscar</button>

      </form>
      <div class="grupo ml-auto">
        <ul class="navbar-nav text-center mx-auto mt-2"
          style="flex-direction: row; justify-content: space-evenly; font-family: 'Yanone Kaffeesatz', sans-serif;;">


          <a class="zoom  palab  cdp btn pt-2 pr-2 nav-link" id="_categorias" type="sumbit"
            onclick="javascript:location.href='../HTML/Categorias.php';">
            Categorias
          </a>

          <a class="zoom btn  palab cdp nav-link" data-toggle="modal" data-target="#exampleModal" id="sesioninicia">
            Inicia sesion
          </a>





          <a class="zoom btn  palab cdp nav-link" data-toggle="modal" data-target="#exampleModal2"
            id="sesionregistrate">
            Registrate
          </a>



          <a class="zoom btn palab cdp nav-link d-none" role="button" id="__Historial"
            onclick="javascript:location.href='../HTML/Historial.php';">
            Historial
          </a>


          <a class="zoom btn  palab cdp nav-link d-none" href="#" role="button" id="carrito"
            onclick="javascript:location.href='../HTML/Carrito.php';">
            Carrito
            <i class="fas fa-shopping-cart" id="_carritonumero"> </i>
          </a>



          <li class="nav-item " id="infocuenta">

            <a class="zoom cdp nav-link dropdown-toggle" href="#" id="sesionperfil" role="button"
              data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
              Cuenta
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdown">
              <a class="dropdown-item " id="noadmins" href="../HTML/Cuenta.html">Cuenta</a>
              <a class="variable dropdown-item" id="admins" href="../HTML/cms.php">Cms</a>
              <div class="dropdown-divider"></div>
              <a class="dropdown-item" href="../../models/cierrasesion.php" onclick="myFunction();">Cerrar
                sesión</a>
              <script>
                function myFunction() {
                  debugger
                  localStorage.clear();
                }
              </script>
            </div>
          </li>
        </ul>
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


            <form id="rertol" accept-charset="utf-8" method="POST">
              <div class="form-group pl-5 pr-5">
                <a>Correo electronico</a>
                <input type="email" class="form-control" id="emaili" name="emaill"
                  placeholder="Ingresa tu correo electronico">
              </div>
              <div class="form-group pl-5 pr-5">
                <a>Contraseña</a>
                <input type="password" class="form-control" id="passwordi" name="passwordl"
                  placeholder="Ingresa tu contraseña">
              </div>

              <button type="submit" class="zoom btn btn-primary btn-md d-block mx-auto">Inicia sesion</button>

            </form>


            <div class="text-center text-muted delimiter pt-2">O utiliza una red social</div>
            <div class="text-center pt-5">
              <a class="text-muted text-hover-primary " href="#" target="_blank" title="instagram">
                <i class="fab fa-instagram" style="font-size: 25px;"></i>
              </a>

              <a class="text-muted text-hover-primary " href="#" target="_blank" title="facebook">
              <i class="fab fa-facebook" style="font-size: 25px;"></i>
              </a>

              <a class="text-muted text-hover-primary " href="#" target="_blank" title="twitter">
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
              <h4>Crea una cuenta.</h4>
            </div>
            <form id="rerto" accept-charset="utf-8" method="POST">
              <div class="form-group pl-5 pr-5">
                <a>Nombre completo</a>
                <input type="text" class="form-control" name="nombresign" id="nombrer" placeholder="Escribe tu nombre"
                  style="font-size:  14px;">
              </div>
              <div class="form-group pl-5 pr-5">
                <a>Correo electronico</a>
                <input type="email" class="form-control" name="correosign" id="emailr" placeholder="Ingresa tu correo"
                  style="font-size:  14px;">
              </div>
              <div class="form-group pl-5 pr-5">
                <a>Contraseña</a>
                <input type="password" class="form-control" name="contraseñasign" id="passwordr"
                  placeholder="Ingresa tu contraseña" style="font-size: 14px;">
              </div>

              <div class="col-lg-12 col-sm-12 pb-3 pl-5 pr-5">
                <a>Rol</a>
                <label class="mr-sm-2 sr-only" for="inlineFormCustomSelect"
                  style="max-height: 200px !important;">Preference</label>
                <select id="cantidad" class="custom-select mr-sm-2" id="inlineFormCustomSelect">
                  <option value="Estudiante">Estudiante</option>
                  <option value="Profesor">Profesor</option>
                </select>
              </div>
              <div class="grupo text-center pt-3">
                <button type="sumbit" class="zoom btn btn-primary btn-md ">Registrate</button>
              </div>
            </form>
            <div class="text-center text-muted delimiter pt-2">O utiliza una red social</div>
            <div class="text-center pt-3">
              <a class="text-muted text-hover-primary " href="#" target="_blank" title="instagram">
                <i class="fab fa-instagram" style="font-size: 25px;"></i>
              </a>
              <a class="text-muted text-hover-primary " href="#" target="_blank" title="facebook">
                <i class="fab fa-facebook" style="font-size: 25px;"></i>
              </a>
              <a class="text-muted text-hover-primary " href="#" target="_blank" title="twitter">
                <i class="fab fa-twitter" style="font-size: 25px;"></i>
              </a>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>