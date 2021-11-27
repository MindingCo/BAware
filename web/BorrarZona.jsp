<%@page import="bd.Eliminar"%>
<!DOCTYPE html>
<html>
    <head>
        <title>
            Borrando usuario...
        </title>
    </head>
    <body>
        <%
            HttpSession sesion = request.getSession();
            
            String usu= sesion.getAttribute("id").toString();
            
            String zona=request.getParameter("idZon");
            System.out.println(usu +" "+ zona);
             
            int idUsuario = Integer.parseInt(usu);
            int idZona = Integer.parseInt(zona);
            
            System.out.println(idUsuario +" "+ idZona);
            
            try
            {
                Eliminar eliminar = new Eliminar();
                eliminar.zona(idUsuario, idZona);
                
                System.out.println("el jsp de eliminar zona completado");
                response.sendRedirect("02_puntointeres.jsp");
            }
            catch(Exception e)
            {
                System.out.println("Error en jsp de eliminar zona");
                System.out.println(e.getMessage());
                e.printStackTrace();
            }
        %>
    </body>
</html>