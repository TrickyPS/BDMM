<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="./../IMG/logooficial.png" type="image/png">
    <title>Continuity-Chat</title>
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.2/css/all.css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
    integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <link rel="stylesheet" href="./../CSS/chat.css">
</head>

<body>

  <?php include_once("layout_nav.php") ?>

  

  <div class="container cont">
      <div class="row">
          <div class="col-md-4 p-3 ">
              <div class="head-chat m-2 d-flex justify-content-between">
              <div class="title-chat">
                  Chats
              </div>
              <input type="search" class="search-chat" placeholder="Buscar usuario">
              </div>
              <div class="users-chat " id="users-chat">
                  
              </div>
          </div>
          <div class="col-md-8 p-3 ">
              <div class="card card-msg p-3 h-100  ">
                  <div id="head-msg" class="head-msg">

                  </div>
                  <div class="messages ">
                        <div class="comment owner">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Ad, molestias sequi! Quam, delectus. Soluta ipsum neque eum ullam laborum veniam porro maxime facilis vitae? Sit eveniet aliquid quos dignissimos delectus.
                        </div>
                        <div class="comment noowner">
                            Lorem ipsum dolor sit amet consectetur adipisicing elit. Autem praesentium iste dolor in distinctio sed tempore ex sunt adipisci officiis?
                        </div>
                  </div>
                  <div class="box-message">
                      <textarea rows="1" class="text-message" placeholder="Escribir mensaje..."></textarea>
                      <button class=" zoom btn btn-primary">Enviar</button>
                  </div>
              </div>
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
</body>

<script>
   async function  init(){
    var resp = await fetch("https://reqres.in/api/users");
    var data = await resp.json();
    for(item of data.data){
        document.getElementById("users-chat").innerHTML += `
        <div class="list-group" onclick="handlerUser('${item.avatar}','${item.first_name}')">
                  <div class="list-group-item list-group-item-action d-flex justify-content-start align-items-center">
                    <img src="${item.avatar}" class="img-fluid img-user"/>
                    <div class="pl-2"><p> ${item.first_name} ${item.last_name} </p>
                            <p> Mensaje   </p> <div/>
                  </div>
              </div>`;
    }
   }
   function handlerUser(avatar,name){
       document.getElementById("head-msg").innerHTML =`
       <img src="${avatar}" class="img-fluid img-user-head"/>
            <div> ${name} </div>
       `;
   }
   init(); 
</script>

</html>