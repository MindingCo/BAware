<%@page session="true"%>
<!DOCTYPE>
<html lang="es">
    <head>

        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="css/log-sign.css">
        <link rel="stylesheet" href="image/icons.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Roboto" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
        <title>
            Error en Modificar Contraseņa
        </title>
        <script>
            function usuarrioInexistente()
                {
                    alert("La contraseņa antigua es incorrecta");
                    location.replace("02_configuracion.jsp");
                }
        </script>
    </head>
    <body onpaste="return false" ondrop="return false" onload="usuarrioInexistente()">
        <%
            HttpSession sesion = request.getSession();
        %>
    </body>
</html>
