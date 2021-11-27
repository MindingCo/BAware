<%@page import="java.util.regex.Pattern"%>
<%@page import="identidad.Usuario"%>
<%@page import="bd.Consultar"%>
<%@page session="true"%>
<!DOCTYPE html>
<html>
    <head>

        <title>
            Iniciando sesion...
        </title>
    </head>
    <body>
        <%
            if(request.getParameter("nombre") == null)
            {
                %>
                <script>
                    alert("Pon un usuario");
                    location.replace("index.jsp");
                </script>
                <%
            }
            else if(request.getParameter("contrasena") == null)
            {
                %>
                <script>
                    alert("Pon una contraseña");
                    location.replace("index.jsp");
                </script>
                <%
            }
            else
            {
                String nombre, contraseña;

                nombre = String.valueOf(request.getParameter("nombre"));
                contraseña = String.valueOf(request.getParameter("contrasena"));
                
                
                Usuario usuario = new Usuario();
                Consultar consultar = new Consultar();

                usuario = consultar.usuario(nombre, contraseña);
                //        usuario.setUsuario(2,nombre, contraseña,"gustavopdzz0@gmail.com",1);
                if (usuario == null)
                {
                    response.sendRedirect("error-usuario_inexistente.jsp");
                }
                else
                {
                    HttpSession sesion = request.getSession(true);
                    sesion.setAttribute("id", String.valueOf(usuario.getId()));
                    sesion.setAttribute("nombre", usuario.getNombre());
                    sesion.setAttribute("contraseña", usuario.getContraseña());
                    sesion.setAttribute("correo", usuario.getCorreo());
                    sesion.setAttribute("tipousuario", String.valueOf(usuario.getTipoUsuario()));
                    %>
                    <input type="hidden" name="IniciarSesion" value="true"/>
                    <%
                   response.sendRedirect("0"+String.valueOf(sesion.getAttribute("tipousuario"))+"_home.jsp");
                }
            }
        %>
    </body>
</html>
