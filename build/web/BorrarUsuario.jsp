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
            System.out.println("nani?");
            String usu=request.getParameter("idUsuario");
            System.out.println(usu);
            int idUsuario = Integer.parseInt(usu);
            System.out.println(idUsuario);
            
            try
            {
                Eliminar eliminar = new Eliminar();
                eliminar.usuario(idUsuario);
                
                System.out.println("el jsp de eliminar usuario completado");
                response.sendRedirect("01_catalogousuarios.jsp");
            }
            catch(Exception e)
            {
                System.out.println("Error en jsp de eliminar usuario");
                System.out.println(e.getMessage());
                e.printStackTrace();
            }
        %>
    </body>
</html>