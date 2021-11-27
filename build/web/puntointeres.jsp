<%@page import="java.util.Iterator"%>
<%@page import="java.util.ArrayList"%>
<%@page import="identidad.ZonaInteres"%>
<%@page import="bd.Consultar"%>
<%@page session="true"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
        <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="css/panelStyle.css">
        <link rel="stylesheet" href="image/icons.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Roboto" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

        <title>
            Zonas de interés
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
                            Zonas de Interes
                        </h1>
                        <script src="js/Borrar.js"></script>
                        <div id="puntos-interes">
                            <%
                                Consultar consultar = new Consultar();
                                ZonaInteres zonaInteres = new ZonaInteres();
                                ArrayList<ZonaInteres> array = new ArrayList();
                                
                                array = consultar.zonasInteres( Integer.parseInt(String.valueOf(sesion.getAttribute("id"))));

                                Iterator<ZonaInteres> iterator = array.iterator();

                                int i = 0;
                                
                                while(iterator.hasNext())
                                {
                                    zonaInteres = iterator.next();
                            %>
                            <form method="POST" action="BorrarZona.jsp" id="<%=i%>">
                                <div class="line-separator"></div>
                                <div class="punto-interes">
                                    <div class="nombre-punto">
                                        Zona Numero #<input name="idZon" type="text" width="2" value="<%=zonaInteres.getId()%>" readonly style="width: 5%"/>
                                    </div>
                                        <div class="eliminar-dato" onclick="mySubmit(<%=i%>)"><span class="icon-cross" style="vertical-align: middle"></span></div>
                                </div>
                            </form>
                            <%
                                i++;
                                }
                            %>
                        </div>
                        <div class="spacer"></div>
                        <div id="alternativas">
                            <a class="exp-all" href="04_home.jsp"><input class="input-alter col-xs-12 exp-w" type="button" value="Agregar zona de interes" /></a>
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