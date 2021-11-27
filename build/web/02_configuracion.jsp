<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>

        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="css/panelStyle.css">
        <link rel="stylesheet" href="image/icons.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Roboto" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

        <title>
            Configuración
        </title>
        
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/validacion.js"></script>
    </head>
    <body onpaste="return false" ondrop="return false">
        <%
            HttpSession sesion = request.getSession();
            if ((sesion.getAttribute("nombre") != null) && (Integer.parseInt(String.valueOf(sesion.getAttribute("tipousuario"))) == 2))
            {
        %>
            <div class="real-container exp-all">
                <div class="row exp-all">
                    <div id="container" class="col-xs-12 col-sm-12 col-md-12 col-lg-12 col-xl-12">
                        <div id="nav">
                            <div id="options">
                                <div class="option">
                                    <a class="exp-all" href="02_perfil.jsp">
                                        <span class="icon-user"></span>
                                    </a>
                                </div>
                                <div class="option">
                                    <a class="exp-all" href="02_notificacion.jsp">
                                        <span class="icon-notification"></span>
                                    </a>
                                </div>
                                <div class="option">
                                    <a class="exp-all" href="02_puntointeres.jsp">
                                        <span class="icon-map"></span>
                                    </a>
                                </div>
                                <div class="option">
                                    <a class="exp-all" href="02_configuracion.jsp">
                                        <span class="icon-configuration"></span>
                                    </a>
                                </div>  
                            </div>
                        </div>
                        <div class="line-separator"></div>
                        <div id="section">
                                <h1 id="titlePage">
                                    Configuracion
                                </h1>
                            <div id="forms">
                                <form id="modificarDatos" class="exp-all" action="ModificarDatos.jsp">
                                    <div class="exp-all">
                                        <div class="campos-form">
                                            <h1 class="second-titlePage">
                                                Cambio de  Contraseña
                                            </h1>
                                            <input id="old-pass" name="old-pass" class="campoPassword i-update input-update" type="password" placeholder="Antigua Contraseña">
                                            <input id="new-pass" name="new-pass" class="campoPassword i-update input-update" type="password" placeholder="Nueva Contraseña">
                                            <input id="new-cpass" name="new-cpass" class="campoPassword i-update input-update" type="password" placeholder="Confirmar Nueva Contraseña">
                                            <div id="errorPassword" class="sinCoincidencias"></div>
                                        </div>
                                            <div class="campos-form">
                                                <h1 class="second-titlePage">
                                                    Cambio de Correo
                                                </h1>
                                                <div class="mid-spacer"></div>
                                                <input id="campoEmail" name="new-ema" class="campoEmail i-update input-update" type="email" placeholder="Nuevo Correo">
                                                <input id="campoCEmail" name="new-cema" class="campoEmail i-update input-update" type="email" placeholder="Confirnar Nuevo Correo">
                                                <div id="errorEmail" class="sinCoincidencias"></div>
                                            </div>
                                        <input id="submit-update" type="submit" value="Actualizar datos">
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        <%
            }
            else
            {
                if(sesion.getAttribute("tipousuario") == null)
                {
                    %>
                        <script>
                            alert("Debe iniciar sesion con usuario que pertenezca a esta pagina");
                            location.replace('index.jsp');
                        </script>
                    <%
                }
                else
                {
                    %>
                        <script>
                            alert("Tipo de usuario <%=sesion.getAttribute("tipousuario")%> no permitido en esta pagina");
                            location.replace('index.jsp');
                        </script>
                    <%
                }
            }
        %>
    </body>
</html>