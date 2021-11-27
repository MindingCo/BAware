
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
   
        <div id="map"></div>
        <div id="real-container">
            <div id="logo">
                B-Aware
            </div>
            <a href="index.jsp">
                <div id="log-out">
                    <span class="icon-back iconLogOut"></span>
                    <input class="logOut" type="button">
                </div>
            </a>
            <div id="bottom-panel">
                    <span class="icon-info icon"></span>
            </div>
        </div>
        <div id="nomenclatura">
            <iframe id="frame-nomenclatura" src="nomenclatura.jsp" frameborder="0"></iframe>
        </div>
            <script>
      <% double lat= 19.432156;
      double lon=-99.147093;
      int i=0;
      
   %> 
   var minZoomLevel = 13;    
   var markers=[];
   var infows= [];
 
    function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
     zoom: minZoomLevel,
     <% out.println("center: new google.maps.LatLng("+lat+","+lon+"),");%>
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      mapTypeControl: false
     });  
     
   var src = 'http://31.220.62.87/maps/Cuau.kmz';
       var kmlLayer = new google.maps.KmlLayer(src, {
          suppressInfoWindows: true,
          preserveViewport: true,
          map: map
        });
        var n = 'http://31.220.62.87/maps/df.kmz';
       var cuau = new google.maps.KmlLayer(n, {
              
        suppressInfoWindows: true,
          preserveViewport: true,
          map: map
        });
       var a = 'http://31.220.62.87/maps/Estados.kml';
       var es = new google.maps.KmlLayer(a, {
          suppressInfoWindows: true,
          preserveViewport: true,
          map: map
        });
      

      
    
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
          out.println("var des='"+p.getDes()+"';");
          out.println("var idp='"+p.getId()+"   ';");
          out.println("var infoWindow = new google.maps.InfoWindow;");
          out.println("var infowincontent = document.createElement('div');");
           out.println("var id = document.createElement('strong');");
          out.println("id.textContent = idp");
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
      
            
    var src = 'http://31.220.62.87/maps/Cuau.kmz';
       var kmlLayer = new google.maps.KmlLayer(src, {
          suppressInfoWindows: true,
          preserveViewport: true,
          map: map
        });
        var n = 'http://31.220.62.87/maps/Cua.kmz';
       var cuau = new google.maps.KmlLayer(n, {
              
        suppressInfoWindows: true,
          preserveViewport: true,
          map: map
        });
      

      cuau.addListener('click', function(e) {
         placeMarkerAndPanTo(e.latLng, map);
         });
         
        var strictBounds = new google.maps.LatLngBounds(
    new google.maps.LatLng(19.4652525347, -99.121952503), 
    new google.maps.LatLng(19.4572514930, -99.132055651)
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
        
    </script>
    </body>
</html>