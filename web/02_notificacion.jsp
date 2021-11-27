<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="identidad.Pin"%>
<%@page import="bd.Consultar"%>

<%@page session="true"%>
<!DOCTYPE>
<html lang="es">
    <head>

        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="css/panelStyle.css">
        <link rel="stylesheet" href="image/icons.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Roboto" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

        <title>
            Notificaciones
        </title>
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
                            Notificaciones
                        </h1>
                        <div id="notificaciones">
                            <%
                                Consultar consultar = new Consultar();
                                Pin pin = new Pin();
                                ArrayList<Pin> array = new ArrayList();
                                
                                array = consultar.pinesByUser( Integer.parseInt(String.valueOf(sesion.getAttribute("id"))));

                                Iterator<Pin> iterator = array.iterator();

                                while(iterator.hasNext())
                                {
                                    pin = iterator.next();
                            %>
                            <div class="line-separator"></div>
                            <div class="punto-interes">
                                <b>Un nuevo pin acaba de ser agregado:</b> <br>
                                Categotia <%=pin.getNomcat()%> <br>
                                Zona de Interes #<%=pin.getZona()%> <br>
                                Dia: <%=pin.getFecha()%> <br>
                                <i>"<%=pin.getDes()%>"</i>
                            </div>
                            <%
                                }
                            %>
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