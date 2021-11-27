 
  var minZoomLevel = 13;
 
     
 function initMap() {
        var map = new google.maps.Map(document.getElementById('map'), {
      zoom: minZoomLevel,
      center: new google.maps.LatLng( 19.432156, -99.147093),
      mapTypeId: google.maps.MapTypeId.ROADMAP,
      mapTypeControl: false
     });  
     
  /* var color = {
        : {
          label: ''
        },
        : {
          label: ''
        }
      };
     var infoWindow = new google.maps.InfoWindow;
     downloadUrl('', function(dat) {
            var xml = dat.responseXML;
            var markers = xml.documentElement.getElementsByTagName('pin');
            Array.prototype.forEach.call(markers, function(markerElem) {
              var cat = markerElem.getAttribute('cat');
              var des = markerElem.getAttribute('des');
              var fecha = markerElem.getAttribute('fec');
              var ubic = new google.maps.LatLng(
                  parseFloat(markerElem.getAttribute('lat')),
                  parseFloat(markerElem.getAttribute('lng')));

              var infowincontent = document.createElement('div');
              var strong = document.createElement('strong');
              strong.textContent = cat
              infowincontent.appendChild(strong);
              infowincontent.appendChild(document.createElement('br'));

              var text = document.createElement('text');
              text.textContent = des
              infowincontent.appendChild(text);
              var icon = color[cat] || {};
              var marker = new google.maps.Marker({
                map: map,
                position: ubic,
                label: icon.label
              });
              marker.addListener('click', function() {
                infoWindow.setContent(infowincontent);
                infoWindow.open(map, marker);
              });
            });
          }); */
      var cooal = [
          {lat: 19.403642, lng: -99.171019},
          {lat: 19.399999, lng: -99.170418},
          {lat: 19.403925, lng: -99.156685},
          {lat: 19.403197, lng: -99.130592},
          {lat: 19.404522, lng: -99.125791},
          {lat: 19.413781, lng: -99.128333},
          {lat: 19.420641, lng: -99.127239},
          {lat: 19.423313, lng: -99.125952},
          {lat: 19.443144, lng: -99.122975},
          {lat: 19.447635, lng: -99.125909},
          {lat: 19.458116, lng: -99.123506},
          {lat: 19.459775, lng: -99.122304},
          {lat: 19.461596, lng: -99.127754},
          {lat: 19.465075, lng: -99.133548},
          {lat: 19.465780, lng: -99.141915},
          {lat: 19.463150, lng: -99.150627},
          {lat: 19.464081, lng: -99.158695},
          {lat: 19.460844, lng: -99.161313},
          {lat: 19.459185, lng: -99.162987},
          {lat: 19.449967, lng: -99.164273},
          {lat: 19.443654, lng: -99.165775},
          {lat: 19.424259, lng: -99.178033},
          //{lat: 19.423783, lng: -99.162987},
          {lat: 19.423176, lng: -99.175088},
          {lat: 19.407998, lng: -99.184357},
          {lat: 19.403642, lng: -99.171019}
        ];
     
        var alc = new google.maps.Polyline({
          path: cooal,
          geodesic: true,
          strokeColor: '#FF0000',
          strokeOpacity: 1.0,
          strokeWeight: 5
        });
        

        alc.setMap(map);
        //19.459411, -99.163033

        var rec1 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.399748,	
            south: 19.410971, 
            east: -99.121999,
            west: -99.128024
          }
        });
        var rec2 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.399748,	
            south: 19.410971, 
            east: -99.128025,
            west: -99.140411
          }
        });
        var rec3 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.399748,	
            south: 19.410971, 
            east: -99.140409,
            west: -99.152794
          }
        });
        var rec4 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.399748,	
            south: 19.410971, 
            east: -99.152793,
            west: -99.165177
          }
        });
        var rec5 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.410971,	
            south: 19.422193, 
            east: -99.121999,
            west: -99.128024
          }
        });
        var rec6 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.410971,	
            south: 19.422193, 
            east: -99.128025,
            west: -99.140411
          }
        });
        var rec7 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.410971,	
            south: 19.422193, 
            east: -99.140409,
            west: -99.152794
          }
        });
        var rec8 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.410971,	
            south: 19.422193, 
            east: -99.152793,
            west: -99.165177
          }
        });
        var rec9 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.422194,	
            south: 19.444638, 
            east: -99.121999,
            west: -99.128024
          }
        });
        var rec10 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.422194,	
            south: 19.444638, 
            east: -99.128025,
            west: -99.140411
          }
        });
        var rec11 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.422194,	
            south: 19.444638, 
            east: -99.140409,
            west: -99.152794
          }
        });
        var rec12 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.422194,	
            south: 19.444638, 
            east: -99.152793,
            west: -99.165177
          }
        });
        var rec13 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.444639,	
            south: 19.455862, 
            east: -99.121999,
            west: -99.128024
          }
        });
        var rec14 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.444639,	
            south: 19.455862, 
            east: -99.128025,
            west: -99.140411
          }
        });
        var rec15 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.444639,	
            south: 19.455862, 
            east: -99.140409,
            west: -99.152794
          }
        });
        var rec16 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.444639,	
            south: 19.455862, 
            east: -99.152793,
            west: -99.165677
          }
        });
        var rec17 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.455863,	
            south: 19.467085, 
            east: -99.121999,
            west: -99.128024
          }
        });
        
        var rec18 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.455862,	
            south: 19.467085, 
            east: -99.128025,
            west: -99.140411
          }
        });
        var rec19 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.455862,	
            south: 19.467085, 
            east: -99.140409,
            west: -99.152794
          }
        });
        var rec20 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.455862,	
            south: 19.467085, 
            east: -99.152793,
            west: -99.165177
          }
        });
         var rec21 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.422194,	
            south: 19.444638, 
            east: -99.165177,
            west: -99.178861
          }
        });
         var rec22 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.399748,	
            south: 19.410971, 
            east: -99.165177,
            west: -99.177561
          }
        });
        var rec23 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.422194,	
            south: 19.410971, 
            east: -99.165177,
            west: -99.177561
          }
        });
        var rec24 = new google.maps.Rectangle({
          strokeColor: '#FF0000',
          strokeOpacity: 0.8,
          strokeWeight: 3,
          fillColor: '#FF0000',
          fillOpacity: 0.35,
          map: map,
          bounds: {
            north: 19.419193,	
            south: 19.404971, 
            east: -99.177561,
            west: -99.186861
          }
        });
        var mark = new google.maps.Marker({
                map: map,
                position: {lat:19.432156 , lng: -99.147093}
        });
         rec1.addListener('click', function(e) {
             var nz=20;
             seccz(e.latLng, map, nz);
         });
         rec2.addListener('click', function(e) {
             var nz=19;
             seccz(e.latLng, map, nz);
         });
         rec3.addListener('click', function(e) {
             var nz=18;
             seccz(e.latLng, map, nz);
         });
         rec4.addListener('click', function(e) {
             var nz=17;
             seccz(e.latLng, map, nz);
         });
         rec5.addListener('click', function(e) {
             var nz=16;
             seccz(e.latLng, map, nz);
         });
         rec6.addListener('click', function(e) {
             var nz=15;
             seccz(e.latLng, map, nz);
         });
         rec7.addListener('click', function(e) {
             var nz=14;
             seccz(e.latLng, map, nz);
         });
         rec8.addListener('click', function(e) {
             var nz=13;
             seccz(e.latLng, map, nz);
         });
         rec9.addListener('click', function(e) {
             var nz=12;
             seccz(e.latLng, map, nz);
         });
         rec10.addListener('click', function(e) {
             var nz=11;
             seccz(e.latLng, map, nz);
         });
         rec11.addListener('click', function(e) {
             var nz=10;
             seccz(e.latLng, map, nz);
         });
         rec12.addListener('click', function(e) {
             var nz=9;
             seccz(e.latLng, map, nz);
         });
         rec13.addListener('click', function(e) {
             var nz=8;
             seccz(e.latLng, map, nz);
         });
         rec14.addListener('click', function(e) {
             var nz=7;
             seccz(e.latLng, map, nz);
         });
         rec15.addListener('click', function(e) {
             var nz=6;
             seccz(e.latLng, map, nz);
         });
         rec16.addListener('click', function(e) {
             var nz=5;
             seccz(e.latLng, map, nz);
         });
         rec17.addListener('click', function(e) {
             var nz=4;
             seccz(e.latLng, map, nz);
         });
         rec18.addListener('click', function(e) {
             var nz=3;
             seccz(e.latLng, map, nz);
         });
         rec19.addListener('click', function(e) {
             var nz=2;
             seccz(e.latLng, map, nz);
         });
         rec20.addListener('click', function(e) {
             var nz=1;
             seccz(e.latLng, map, nz);
         });
         rec21.addListener('click', function(e) {
             var nz=21;
             seccz(e.latLng, map, nz);
         });
         rec22.addListener('click', function(e) {
             var nz=22;
             seccz(e.latLng, map, nz);
         });
         rec23.addListener('click', function(e) {
             var nz=23;
             seccz(e.latLng, map, nz);
         });
         rec24.addListener('click', function(e) {
             var nz=24;
             seccz(e.latLng, map, nz);
         });
         
         
         
         
} 
      
      
       
      function seccz(latlng , map, n) {
         var marker = new google.maps.Marker({
          position: latlng,
          icon: 'http://maps.google.com/mapfiles/ms/icons/blue-dot.png',
          map: map,
          title: 'zona 20'
          }); 
          var contv='<div id="div1">'+
                '<h1 align="center">¿Deseas seguir esta zona?</h1>'+
                '<br>'+
                '<form method="post" action="agregarzona.jsp" name="datos">'+
                '<label>Zona:</label><input type="text" name="zona" id="zona" value="'+n+'" readonly>'+
                '<br><br>'+
                '<input type="button" value="Aceptar" onclick="mandar()">'+
                '</form>'+
                '</div>';
          var infowindow = new google.maps.InfoWindow({
          content: contv,
          });
          
        //map.panTo(latLng);
        infowindow.open(map, marker);
        //alert(latLng);
        
      }
      
      function mandar(){
          var zona
          zona=$("#zona").val();
          document.datos.submit()
      }
        /*function psp(){
            var s= document.getElementById("noc").value;
            alert(s);
        }*/

/*<input id="noc" value="" readonly style="background-color: black; color: white; ">*/