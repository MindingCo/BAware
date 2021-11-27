<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="identidad.Pin"%>
<%@page import="bd.Consultar"%>
<%@page session="true"%>
<!DOCTYPE html>
<html lang="es">
    <head>

        <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">

        <link rel="stylesheet" href="css/homeStyle.css">
        <link rel="stylesheet" href="image/icons.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Roboto" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">

        <title>
            B-Aware
        </title>

        <script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBEAZHA3Oz9Fl_O36L-Ly0Ohy6M8NB8MZc&callback=initMap"></script>
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/animacion_home.js"></script>
        <script src="js/k.js"></script>
        
    </head>
    <body onpaste="return false" ondrop="return false">
  
        <div id="map"></div>
    </body>
</html> 