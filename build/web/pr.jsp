<%-- 
    Document   : pr
    Created on : 7/05/2018, 11:27:03 PM
    Author     : usuario1
--%>

<%@page import="bd.Consultar"%>
<%@page import="bd.Agregar"%>
<%@page import="identidad.Pin"%>
<!DOCTYPE html>
<html>
    <head>

        <title>JSP Page</title>
    </head>
    <body>
        <h1>Agregando pin...</h1>
        <%
             
         HttpSession sesion = request.getSession();
         if ((sesion.getAttribute("nombre") != null) && (Integer.parseInt(String.valueOf(sesion.getAttribute("tipousuario"))) == 2))
            {
             String idusu = (String)(sesion.getAttribute("id"));
           System.out.println(idusu);
           System.out.println("1");  
                
            int cat=0;
           String coords="";
           String fecha="";
           int zona=0;
           Pin pin= new Pin();
           Agregar ag= new Agregar();
           Consultar con=new Consultar();
           String descripcion="";
           String hora="";
           
           System.out.println("después d variables");
           
           String cats;
           
           int idusuario=0;
           idusuario= Integer.parseInt(idusu);
           System.out.println("2");
           cats=request.getParameter("cate");
           System.out.println("3");
           System.out.println(cats);
           coords=request.getParameter("coords");
           System.out.println("4");
           descripcion= request.getParameter("descrip");
           System.out.println("5");
           hora=request.getParameter("hora");
           System.out.println("6");
           fecha=request.getParameter("fecha");
           System.out.println("7");
           String sCadena = coords.substring(coords.indexOf("(") + 1, coords.indexOf(")"));
           String[] s =  sCadena.split(",");
           double latitude = Double.parseDouble(s[0]);
           double longitude = Double.parseDouble(s[1]);
           System.out.println("desp lanlat");
           zona=con.AsigZona(latitude, longitude);
           cat=con.obIdCat(cats);
           System.out.println(cat);
           System.out.println("desp zon");
           int h=con.obHora(hora);
           System.out.println(h);
           System.out.println("desp hora");
           System.out.println("después a variables");
            
            pin.setDes(descripcion);
            pin.setFecha(fecha);
            pin.setLat(latitude);
            pin.setLon(longitude);
            pin.setZona(zona);
            pin.setCat(cat);
            pin.setIdusu(idusuario);
            pin.setHora(h);
            System.out.println(h);
            System.out.println("Antes de agregar");
            //out.println("<p>"+pin.getCat()+"</p>");
            //pin.setCat(9);
            //out.println("<p>"+pin.getCat()+"</p>");
            ag.pin(pin);
            System.out.println("despues de agregar");
           response.sendRedirect("02_home.jsp");
        }
            else
            {
        %>
            <script>
                location.replace('index.jsp');
                alert("Tipo de usuario <%=sesion.getAttribute("tipousuario")%> no permitido en esta pagina");
            </script>
        <%
            }
        %>
        
    </body>
</html>
