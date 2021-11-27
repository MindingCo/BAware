<%-- 
    Document   : pr
    Created on : 7/05/2018, 11:27:03 PM
    Author     : usuario1
--%>

<%@page import="identidad.Reporte"%>
<%@page import="bd.Consultar"%>
<%@page import="bd.Agregar"%>
<%@page import="identidad.Pin"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" href="css/grid.css">
        <link rel="stylesheet" href="css/panelStyle.css">
        <link rel="stylesheet" href="image/icons.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat|Roboto" rel="stylesheet">
        <link href="https://fonts.googleapis.com/css?family=Lobster" rel="stylesheet">
    </head>
    
    
    <body onpaste="return false" ondrop="return false"  style="height: 100%">
        <%
             
         HttpSession sesion = request.getSession();
         if ((sesion.getAttribute("nombre") != null) && (Integer.parseInt(String.valueOf(sesion.getAttribute("tipousuario"))) == 2))
            {
            String val=request.getParameter("idp");
              String va="";
              char a;
              for (int i = 0; i < val.length(); i++) {
                  a=val.charAt(i); 
                  if (a!=1 || a!=2 || a!=3 || a!=4 || a!=5 || a!=6 || a!=7 || a!=8 || a!=9 || a!=0) {
                              va+=a;
                          }
                  else{
                      va="Valor incorrecto";
                      break ;
                  }
           }
            if (va!="Valor incorrecto") {
                    
                
            Reporte rep= new Reporte();
            Agregar ag= new Agregar();
            Consultar con=new Consultar();
            String descripcion="";
            String cat="";
            int pin=Integer.parseInt(request.getParameter("idp"));
            
           cat=request.getParameter("cate");
           int idcat=0;
           idcat=con.ObIdRep(cat);
           descripcion= request.getParameter("descrip");
          
           rep.setIdp(pin);
           rep.setIdcat(idcat);
           rep.setDes(descripcion);
           System.out.println("antes");
           ag.reporte(rep);
           System.out.println("despues");
           //response.sendRedirect("formulario-reporte.jsp");
      %>
      <div class="real-container exp-all">
             <div class="row exp-all">
                 <div id="container" class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3 col-offset-sm-3 col-offset-md-4 col-offset-lg-4dot5 col-offset-xl-4dot5">
                     <label>Reporte envíado.</label>
                     <br>
                     <div>
                     <a href="formulario-reporte.jsp" style="background-color: white">Continuar</a>
                </div>
                 </div>
             </div>
         </div>    
      <%      
      } 
            else {%>
             <div class="real-container exp-all">
             <div class="row exp-all">
                 <div id="container" class="col-xs-12 col-sm-6 col-md-4 col-lg-3 col-xl-3 col-offset-sm-3 col-offset-md-4 col-offset-lg-4dot5 col-offset-xl-4dot5">
                     <label>Valor de pin no válido.</label>
                     <br>
                     <div>
                     <a href="formulario-reporte.jsp" style="background-color: white">Volver</a>
                </div>
                 </div>
             </div>
         </div>   
            <%}
      
    }
            else
            {
        %>
            <script>
                location.replace('formulario.reporte.jsp');
                alert("Tipo de usuario <%=sesion.getAttribute("tipousuario")%> no permitido en esta pagina");
            </script>
        <%
            }
        %>
     
    </body>
</html>
