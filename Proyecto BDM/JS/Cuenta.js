$(document).ready(function () {





    $('#sidebarCollapse').on('click', function () {
        $('#sidebar').toggleClass('active');
    });

  

    $("#boton1").on('click', function () {
        $(".division1").removeClass("d-none");
        $(".division2").addClass("d-none");
    });

    $("#boton2").on('click', function () {
        $(".division1").addClass("d-none");
        $(".division2").removeClass("d-none");
    });

      
      });











