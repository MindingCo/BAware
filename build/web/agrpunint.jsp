<%@page session="true"%>
<!DOCTYPE html>
<html lang="es">
<head>

    <meta name="viewport" content="width=device-width, user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0">
    
       <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="css/panelStyle.css">
        <link rel="stylesheet" href="image/icons.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Roboto" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    <title>Agregar punto de interés</title>
</head>
<body onpaste="return false" ondrop="return false"  style="height: 100%">
<img id="background" src="https://lh3.googleusercontent.com/loyqpqJqaahoStsTcUGwSm6jCTZedcou4jfkBd9V_DtvsuD6YFihi-LKchjT24qAt-z9RWU8yxWPwYB6CBi7hh1rUK92MYuQtz-K5iv8eLN9WYR477GNf6-IBmYFDvj704UQvJS0qvcHM3Atfg2fZPkf5QiAvEst8dviXfTx9R3lmbG_kjpXsx9T_wURNQnQ4yYZ0QDPxPaOe5cj5myZqnFNE8cDqoqaya3qax5bzbA8USBLqJTgP7dq4KcwMEeBChj-E-ykiYpw0A3HufejwKwHyS8HpvOcWQOy4CF8-nxmx7BQM9KQi3J1sGnbklqi2j0GaM82icjyRub8Lo1dyNTZizX-JEuK2-UyqnQuxpt33FToMfSV2-qZKM8jGtWHiuFoAGYlJPmhsjUyxW2TiXH4dDGLO22Y04_9gTrSCp5j33gdDW_6TrndaF2o04y5K7ytOmDiVDsWRZOAIqvOQ_Mih5axWzTuFT1fLEIFg5lD27IG0l_NYM1cT1qTwmGv4ewSBeMEgNeoiUBhh7ZOr59uvqGiKUlRysZKGkE7V2SjXgNGHrtJ_3m_dDqMPIlKNH-QwbMdxyQAc74cl7eXg1jehNLLJmGLQ8dz4R-IBo8Iq--oPLm1bIKug6-TvBknCef1eGnR6zK4HlF_tz6RGUVhVukBNe31AA=w592-h446-no" alt="Algo le paso a la imagen :'v" ondrag="return false">
 <div class="real-container exp-all">
            <div class="row exp-all">
                <div id="container" class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3 col-offset-sm-3 col-offset-md-4 col-offset-lg-4dot5 col-offset-xl-4dot5">
            <div style="border-bottom: 2px solid #000000;" class="">
              <a href="02_puntointeres.jsp"><span class="icon-arrow-left2" id="atras" onclick=""></span></a>
            </div><br>
            <div id="listapi">
                <p style="color:#ffffff;">Agrega tu punto de interés!</p>
                <br><br>
                <form id="agrpunint" method="get">
                <div class="set-ic-in">
                    <span class="icon-map"></span>
                    <input type="text" placeholder="Número de la zona" id="nzi" required class="i-form">           
                </div>
                <br><br><br>
            <input type="submit" value="Agregar" id="send">
            <br><br>
                </form>
        </div>
    </div>
</div>
</div>
<script src="js/jquery.js"></script>
<script src="js/bootstrap.min.js"></script>
</body>
</html>
