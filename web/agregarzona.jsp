<%@page import="bd.Consultar"%>
<%@page import="bd.Agregar"%>
<!DOCTYPE html>

    <%
           
        HttpSession sesion = request.getSession();
        if (sesion.getAttribute("nombre") != null && sesion.getAttribute("tipousuario") != "2")
        {
            String idusu = (String) (sesion.getAttribute("id"));
            int idusuario= Integer.parseInt(idusu);
            int zona=Integer.parseInt(request.getParameter("zona"));
            
            System.out.println(idusuario+" "+zona);
            
            Consultar consultar = new Consultar();
            
            if(consultar.zonaExist(idusuario, zona))
            {
                %>
                    <script>
                        location.replace("02_puntointeres.jsp");
                        alert("La zona ya fue agregada");
                    </script>
                <%
            }
            else
            {
                //array = consultar.zonas()
                
                Agregar ag= new Agregar();
                ag.zona(zona, idusuario);
                response.sendRedirect("02_puntointeres.jsp");
            }
        }   
        
        else
        {
           response.sendRedirect("02_puntointeres.jsp");
        }
    %>