<%@page import="java.util.Iterator"%>
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
        
    </head>
    <body onpaste="return false" ondrop="return false">
        <%
            HttpSession sesion = request.getSession();
            if ((sesion.getAttribute("nombre") != null) && (Integer.parseInt(String.valueOf(sesion.getAttribute("tipousuario"))) == 2))
            {
        %>
        <!--<script>
            function asidcat()
            {
                var x = document.getElementById("cate").value;
                if(x=="Asalto"){
                    document.getElementById("idcat").value=3;
                }
                if(x=="Violación"){
                    document.getElementById("idcat").value=1;
                }
                if(x=="Robo(carterismo)"){
                    document.getElementById("idcat").value=2;
                }
                if(x=="Robo"){
                    document.getElementById("idcat").value=4;
                }
                if(x=="Homicidio"){
                    document.getElementById("idcat").value=5;
                }
                if(x=="Reunión maliciosa"){
                    document.getElementById("idcat").value=6;
                }
                if(x=="Acoso"){
                    document.getElementById("idcat").value=7;
                }
            }
        </script>-->
        <div id="map"></div>
        <div id="real-container">
            <div id="logo">
                B-Aware
            </div>
            <div id="panel-lateral">
                <div>
                    <span class="icon-user icon"></span>
                </div>
                <div>
                    <span class="icon-notification icon"></span>
                </div>
                <div>
                    <span class="icon-map icon"></span>
                </div>
                <div>
                    <span class="icon-configuration icon"></span>
                </div>
            </div>
            <a href="CerrarSesion.jsp">
                <div id="log-out">
                    <span class="icon-exit iconLogOut"></span>
                    <input class="logOut" type="button">
                </div>
            </a>
            <div id="reportar">
                    <span class="icon-ban icon"></span>
            </div>
            <div id="bottom-panel">
                    <span class="icon-info icon"></span>
            </div>
            <div id="filtros">
                <form method="post" action="">
                    <select id="cate" name="cate" onchange="asidcat()">
                        <option value="Violación">Violación</option>
                        <option value="Robo(carterismo)">Robo(carterismo)</option>
                        <option value="Asalto">Asalto</option>
                        <option value="Robo">Robo</option>
                        <option value="Homicidio">Homicidio</option>
                        <option value="Reunión maliciosa">Reunión maliciosa</option>
                        <option value="Acoso">Acoso</option>
                    </select>
                    <select>
                        <option value="0:00-2:00"> 0:00-2:00 </option>
                        <option value="2:00-4:00"> 2:00-4:00 </option>
                        <option value="4:00-6:00"> 4:00-6:00 </option>
                        <option value="6:00-8:00"> 6:00-8:00 </option>
                        <option value="8:00-10:00"> 8:00-10:00 </option>
                        <option value="10:00-12:00"> 10:00-12:00 </option>
                        <option value="12:00-14:00"> 12:00-14:00 </option>
                        <option value="14:00-16:00"> 14:00-16:00 </option>
                        <option value="16:00-18:00"> 16:00-18:00 </option>
                        <option value="18:00-20:00"> 18:00-20:00 </option>
                        <option value="20:00-22:00"> 20:00-22:00 </option>
                        <option value="22:00-24:00"> 22:00-24:00 </option>
                    </select>
                </form>
            </div>
        </div>
        <div id="nomenclatura">
            <iframe id="frame-nomenclatura" src="nomenclatura.jsp" frameborder="0"></iframe>
        </div>
        <div id="panel">
            <iframe id="frame-panel" src="" frameborder="0"></iframe>
        </div>
        <div id="reporte">
            <iframe id="frame-reporte" src="formulario-reporte.jsp" frameborder="0"></iframe>
        </div>
        <script>
            
   <% double lat= 19.432156;
      double lon=-99.147093;
      int i=0;
      
   %> 
   var minZoomLevel = 13;    
   var markers=[];
   var infows= [];
   var pmark=[];
   var infowinds=[];
    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
     zoom: minZoomLevel,
     fullscreenControl: false,
     streetViewControl: false,
     <% out.println("center: new google.maps.LatLng("+lat+","+lon+"),");%>
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      mapTypeControl: false,
      
     });  
      var a = 'http://93.188.165.24/maps/estados.kml';
       var es = new google.maps.KmlLayer(a, {
          suppressInfoWindows: true,
          preserveViewport: true,
          map: map
        });
      
       var src = 'http://93.188.165.24/maps/dels.kml';
       var kmlLayer = new google.maps.KmlLayer(src, {
          suppressInfoWindows: true,
          preserveViewport: true,
          map: map
        });
        var n = 'http://93.188.165.24/maps/cua.kml';
       var cuau = new google.maps.KmlLayer(n, {
              
        suppressInfoWindows: true,
          preserveViewport: true,
          map: map
        });
      
      es.addListener('click', function(e){
          alert("Solo puedes agregar marcadores en la zona descolorida")
      });
      
      kmlLayer.addListener('click', function(e){
          alert("Solo puedes agregar marcadores en la zona descolorida")
      });
      
      cuau.addListener('click', function(e) {
          var i;
        for(i=0; i<infowinds.length; i++){
              infowinds[i].setMap(null);
              pmark[i].setMap(null);
        }  
         placeMarkerAndPanTo(e.latLng, map);
         });
        //19.459411, -99.163033
        
        <%
        Consultar con= new Consultar();
      ArrayList<Pin> lista= con.pines();
      Iterator<Pin> iter= lista.iterator();
      
      while(iter.hasNext()){
          Pin p=(Pin) iter.next();
          //out.println("Array.prototype.forEach.call(function() {");
          String color=con.obColor(p.getNomcat());
          out.println("var cat='"+p.getNomcat()+"';");
          out.println("var fec='"+p.getFecha()+"';");
          out.println("var hora='"+p.getHora()+"';");
          out.println("var des='"+p.getDes()+"';");
          out.println("var idp='"+p.getId()+"   ';");
          out.println("var infoWindow = new google.maps.InfoWindow;");
          out.println("var infowincontent = document.createElement('div');");
           out.println("var id = document.createElement('strong');");
          out.println("id.textContent ='#'+idp");
          out.println("infowincontent.appendChild(id);");
          
          out.println("var strong = document.createElement('strong');");
          out.println("strong.textContent = cat");
          out.println("infowincontent.appendChild(strong);");
          out.println("infowincontent.appendChild(document.createElement('br'));");
         
          out.println("var text= document.createElement('text');");
          out.println("text.textContent = des");
          out.println("infowincontent.appendChild(text);");
          
          out.println("infowincontent.appendChild(document.createElement('br'));");
          out.println("var fecha= document.createElement('text');");
          out.println("fecha.textContent = fec");
          out.println("infowincontent.appendChild(fecha);");
          
          
          
          
          out.println("var marker= new google.maps.Marker({map:map, position: {lat:"+p.getLat()+", lng:"+p.getLon()+"}, icon:'"+color+"'});");
          out.println("markers.push(marker)");
          out.println("infoWindow.setContent(infowincontent);");
          out.println("infows.push(infoWindow)");
          out.println("marker.addListener('click', function() {infows["+i+"].open(map, markers["+i+"]);});");
          
//out.println("});");
          i++;
          
    }
    %>
    
        
         
         var strictBounds = new google.maps.LatLngBounds(
    new google.maps.LatLng(19.381479, -99.204257), 
    new google.maps.LatLng(19.483303, -99.102633)
    );
    
    /* map.addListener('mousemove', function(e) {
        document.getElementById("noc").value=(e.latLng);              
         });*/
    
   google.maps.event.addListener(map, 'dragend', function() {
     if (strictBounds.contains(map.getCenter())) return;
 var c = map.getCenter(),
         x = c.lng(),
         y = c.lat(),
         maxX = strictBounds.getNorthEast().lng(),
         maxY = strictBounds.getNorthEast().lat(),
         minX = strictBounds.getSouthWest().lng(),
         minY = strictBounds.getSouthWest().lat();

     if (x < minX) x = minX;
     if (x > maxX) x = maxX;
     if (y < minY) y = minY;
     if (y > maxY) y = maxY;

    
    map.setCenter({lat:19.432156 , lng: -99.147093});       
  
    });  
            
   
  
   google.maps.event.addListener(map, 'zoom_changed', function() {
     if (map.getZoom() < minZoomLevel) map.setZoom(minZoomLevel);
   });
   
} 
       
      function placeMarkerAndPanTo(latLng, map) {
        
        var hoy = new Date();
          var mes = hoy.getMonth() +1;
          var mess;
          if (mes < 10)
          {
              mess = "0" + mes;
          }
          var hoys = hoy.getFullYear() + "-" + mess + "-" + hoy.getDate();
          
          var semana = new Date();
          semana.setDate(semana.getDate() - 7);
          var amess;
          if (mes < 10)
          {
              amess = "0" + mes;
          }
          
          var semanas = semana.getFullYear() + "-" + amess + "-" + semana.getDate();
        var marker = new google.maps.Marker({
          position: latLng,
          icon: 'http://93.188.165.24/maps/maker/icon-white.png',
          map: map
          });
          pmark.push(marker);
          
          var contv='<div id="div1" >'+
                '<h3 align="center">¿Hola usuario que sucedió?</h3>'+
                '<br>'+
                '<form method="post" action="pr.jsp" name="datos">'+
                '<select id="cate" name="cate" onchange="asidcat()">'+
                '<option value="Violación">Violación</option>'+
                '<option value="Robo(carterismo)">Robo(carterismo)</option>'+
                '<option value="Asalto">Asalto</option>'+
                '<option value="Robo">Robo</option>'+
                '<option value="Homicidio">Homicidio</option>'+
                '<option value="Reunión maliciosa">Reunión maliciosa</option>'+
                '<option value="Acoso" size="10">Acoso</option>'+
                '</select>'+
                '<br><br>'+
                '<label>Coordenadas:</label><input type="text" id="coords" name="coords" value="'+latLng+'" readonly size="20">'+
                '<br><br>'+
                '<textarea id="descrip" name="descrip" rows="6" cols="0" placeholder="Brinda más detalles" onkeypress="return inputText(event)"></textarea>'+
                '<br><br>'+
                '<input type="date" name="fecha" id="fecha" value="'+hoys+'" max="'+hoys+'" min="'+semanas+'">'+
                '<br>'+
                '<input type="time" id="hora" name="hora" required>'+
                '<br><br>'+
                '<input type="button" value="Envíar" onclick="mandar()">'+
                '</form>'+
                '</div>'+
                '<style>'+
                '#div1 {'+
                'width : 200px;'+
                '}'+
                '#coords {'+
                'border : none;'+
                '}'+
                '#descrip {'+
                'resize: none;'+
                '}'+
                '</style>';
          var infowindow = new google.maps.InfoWindow({
          content: contv,
          map: map
        
        });
        infowinds.push(infowindow);
        //map.panTo(latLng);
        infowindow.open(map, marker);
              //alert(latLng);
        
      }
      
        function inputText(event)
        {
            var teclado= (document.all) ? event.keyCode : event.which;
            if(teclado==8)
                return true;
            var patron = /[À-ÿ\w\u00f1\u00d1\d\+\,\.\_\- ]/;
            var tec    = String.fromCharCode(teclado);
            return patron.test(tec);
        }
      
      function getHoy() 
      {
          var hoy = Date();
          var hoys = hoy.getDate() + "/" + (hoy.getMonth() +1) + "/" + hoy.getFullYear();
          return hoys;
}
      
      function envrep(map){
        var idp="";
         idp = document.getElementById("idpin").innerHTML;
        var marker = new google.maps.Marker({
          position: {lat:19.432156, lng:-99.147093},
          icon: 'http://93.188.165.24/icon/maker/icon-white.png',
          map: map,
          
          });
        var contv='<div id="div1">'+
                '<h1 align="center">Brinde el motivo del reporte</h1>'+
                '<br>'+
                '<form method="post" action="rep.jsp" name="drep">'+
                '<select id="cat" name="cat" onchange="asidcatrep()">'+
                '<option value="Broma">Broma</option>'+
                '<option value="Contenido inadecuado">Contenido inadecuado</option>'+
                '<option value="Lenguaje Vulgar">Lenguaje Vulgar</option>'+
                '<option value="Otros">Otros</option>'+
                '</select>'+
                '<br><br>'+
                '<input type="text" name="idcat" id="idcat" value="1" readonly>'+
                '<br><br>'+
                '<textarea id="descrip" name="descrip" rows="6" cols="30"></textarea>'+
                '<br><br>'+
                '<input type="text" name="idpin" id="id´pin" value="'+idp+'">'+
                '<br><br>'+
                '<input type="button" value="Envíar" onclick="mandarep()">'+
                '</form>'+
                '</div>';
          var infowindow = new google.maps.InfoWindow({
          content: contv,
          map: map
        });
          
        //map.panTo(latLng);
        infowindow.open(map, marker);
              //alert(latLng);
        
      }
          
    
      
      function mandar(){
          var cat="";
          cat=$("#cate").val();
          var date="";
         date=$("#fecha").val();
          var des;
          des=$("#descrip").val();
          document.datos.submit()
   }
        
      function asidcat(){
           var x = document.getElementById("cate").value;
           if(x=="Asalto"){
               document.getElementById("idcat").value=3;
           }
           if(x=="Violación"){
               document.getElementById("idcat").value=1;
           }
           if(x=="Robo(carterismo)"){
               document.getElementById("idcat").value=2;
           }
           if(x=="Robo"){
               document.getElementById("idcat").value=4;
           }
           if(x=="Homicidio"){
               document.getElementById("idcat").value=5;
           }
           if(x=="Reunión maliciosa"){
               document.getElementById("idcat").value=6;
           }
           if(x=="Acoso"){
               document.getElementById("idcat").value=7;
           }
      }
       function mandarep(){
          var cat="";
          cat=$("#cat").val();
          var date="";
         date=$("#fecha").val();
          var des;
          des=$("#descrip").val();
        document.datos.submit()
        
         }
        
      function asidcatrep(){
           var x = document.getElementById("cat").value;
           if(x=="Broma"){
               document.getElementById("idcat").value=1;
           }
           if(x=="Contenido inadecuado"){
               document.getElementById("idcat").value=2;
           }
           if(x=="Lenguaje Vulgar"){
               document.getElementById("idcat").value=3;
           }
           if(x=="Otros"){
               document.getElementById("idcat").value=4;
           }
      }
      </script>
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