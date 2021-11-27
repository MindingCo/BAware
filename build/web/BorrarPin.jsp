<%@page import="bd.Eliminar"%>
<!DOCTYPE html>
<html>
    <head>
        <title>
            Borrando pin...
        </title>
    </head>
    <body>
        <%
            String val=request.getParameter("idPin");
            String al="";
            
            for (int i = 0; i < val.length(); i++) {
                if(i!=0){
                    al+=val.charAt(i);
                }
            }
            int idPin=Integer.parseInt(al);
            //int idPin = Integer.parseInt(request.getParameter("idPin"));
            System.out.println(idPin);
            
            try
            {
                Eliminar eliminar = new Eliminar();
                eliminar.pin(idPin);
                
                System.out.println("el jsp de eliminar pin completado");
                response.sendRedirect("01_catalogopines.jsp");
            }
            catch(Exception e)
            {
                System.out.println("Error en jsp de eliminar pin");
                System.out.println(e.getMessage());
                e.printStackTrace();
            }
        %>
    </body>
</html>
