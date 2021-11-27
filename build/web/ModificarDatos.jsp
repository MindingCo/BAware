<%@page import="bd.Consultar"%>
<%@page import="identidad.Usuario"%>
<%@page import="bd.Modificar"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Guardando datos...</title>
    </head>
    <body>
        <%
            String new_pass, new_cpass, old_pass, new_ema, new_cema;
            
            HttpSession sesion = request.getSession();
            Usuario usuario = new Usuario();
            Modificar modificar = new Modificar();
            
            old_pass =(String) request.getParameter("old-pass");
            new_pass = request.getParameter("new-pass");
            new_cpass = request.getParameter("new-cpass");
            new_ema = request.getParameter("new-ema");
            new_cema = request.getParameter("new-cema");
            
            System.out.println(old_pass+" ,"+new_pass+" ,"+new_cpass+" ,"+new_ema+" ,"+new_cema);
            
            usuario.setId(Integer.parseInt(String.valueOf(sesion.getAttribute("id"))));
            
            if((old_pass != "" && new_pass != "" &&  new_cpass != "") && (new_ema != "" && new_cema != ""))
            {
                Usuario usuariobd = new Usuario();
                Consultar consultar = new Consultar();
                
                usuariobd = consultar.usuario(usuario.getId());
                
                String contraseñabd = usuariobd.getContraseña();
                
                // proceso confirmacion contraseña
                
                char [] cpasbd, cpas;
                boolean igual = true; 
                int i = 0;
                cpasbd = contraseñabd.toCharArray();
                cpas = old_pass.toCharArray();
                
                do
                {
                    if (cpasbd[i] != cpas[i])
                        igual = false;
                    i++;
                    System.out.println(igual);
                }while(i < cpasbd.length);
                
                // fin proceso bla bla bla
                
                
                if(igual)
                {
                    usuario.setContraseña(new_pass);
                    usuario.setCorreo(new_ema);
                    modificar.usuario(usuario);
                    %>
                        <script>
                            alert("Datos cambiados");
                        </script>
                    <%
                    response.sendRedirect("02_configuracion.jsp");
                }
                else
                {
                    response.sendRedirect("error-no_antigua_contrasena.jsp");
                }
            }
            else if((old_pass != "" && new_pass != "" &&  new_cpass != "") && (new_ema == "" && new_cema == ""))
            {
                Usuario usuariobd = new Usuario();
                Consultar consultar = new Consultar();
                
                usuariobd = consultar.usuario(usuario.getId());
                
                String contraseñabd = usuariobd.getContraseña();
                
                // proceso confirmacion contraseña
                
                char [] cpasbd, cpas;
                boolean igual = true; 
                int i = 0;
                cpasbd = contraseñabd.toCharArray();
                cpas = old_pass.toCharArray();
                
                do
                {
                    if (cpasbd[i] != cpas[i])
                        igual = false;
                    i++;
                    System.out.println(igual);
                }while(i < cpasbd.length);
                
                // fin proceso bla bla bla
                
                
                if(igual)
                {
                    usuario.setContraseña(new_pass);
                    modificar.usuario(usuario);
                    %>
                        <script>
                            alert("Contraseña cambiada");
                        </script>
                    <%
                    response.sendRedirect("02_configuracion.jsp");
                }
                else
                {
                    response.sendRedirect("error-no_antigua_contrasena.jsp");
                }
               
            }
            else if((old_pass == "" && new_pass == "" &&  new_cpass == "") && (new_ema != "" && new_cema != ""))
            {   
                usuario.setCorreo(new_ema);
                modificar.usuarioCorreo(usuario);
                %>
                    <script>
                        alert("Correo cambiado");
                    </script>
                <%
                response.sendRedirect("02_configuracion.jsp");
            }
        %>
    </body>
</html>
