<%@page session="true"%>
<!DOCTYPE html>
<html lang="es" style="height: 100%">
    <head>

        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

       <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="css/panelStyle.css">
        <link rel="stylesheet" href="image/icons.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Roboto" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

    </head>
    <body onpaste="return false" ondrop="return false">
        <script src="js/jquery-3.3.1.min.js"></script>
         <div class="real-container exp-all">
             <div class="row exp-all">
                 <div id="container" class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3 col-offset-sm-3 col-offset-md-4 col-offset-lg-4dot5 col-offset-xl-4dot5">
                     <div id="logo">
                         Reporte
                     </div>
                     <div id="formulario">
                         <form action="rep.jsp" method="POST" id="forep" name="forep">
                                 <label>Ingresa el número del pin que deseas reportar</label>  
                                 
                                 <input type="text" placeholder="" style="background-color: white; color: black" name="idp" id="idp" maxlength="3"/>
                                 <br>
                                 Motivo:
                                 <select style="background-color: black" id="cate" name="cate">
                                    <option>Broma</option>
                                    <option>Contenido inapropiado</option>
                                    <option>Lenguaje Vulgar</option>
                                    <option>Otros</option>
                                </select>
                                 <br>
                                 <textarea placeholder="Añadir comentario" name="descrip" id="descrip"></textarea>
                                 <br>
                                <input id="reportar" type="button" value="Reportar" />
                             <footer>
                                 <p>El número de cada pin se encuentra en la parte superior de la ventana con sus detalles.</p>
                             </footer>
                         </form>
                     </div>
                 </div>
             </div>
         </div>
        <script>
            $(document).ready(function() 
{
     $("#reportar").click(
      function checar(){
      if ($('#idp').val() != ""){
          document.forep.submit();
      }
      else{
          alert("Debes poner un número de pin");
      }
      });
  $("#idp").keypress(
    function check(e) {
    tecla = (document.all) ? e.keyCode : e.which;

    //Tecla de retroceso para borrar, siempre la permite
    if (tecla == 8) {
        return true;
    }

    // Patron de entrada, en este caso solo acepta numeros y letras
    patron = /[0-9]/;
    tecla_final = String.fromCharCode(tecla);
    return patron.test(tecla_final);
    });
    $("#descrip").keypress(
    function check(e) {
    tecla = (document.all) ? e.keyCode : e.which;

    //Tecla de retroceso para borrar, siempre la permite
    if (tecla == 8) {
        return true;
    }

    // Patron de entrada, en este caso solo acepta numeros y letras
    patron = /[A-Za-z0-9]/;
    tecla_final = String.fromCharCode(tecla);
    return patron.test(tecla_final);
    });
      
});
            
        </script>
    </body>
</html>