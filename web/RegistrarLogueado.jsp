<%@page import="java.util.Iterator"%>
<%@page import="bd.Consultar"%>
<%@page import="java.util.ArrayList"%>
<%@page import="identidad.Usuario"%>
<%@page import="bd.Agregar"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Registrando Usuario</title>
    </head>
    <body>
        <%
            ArrayList <Usuario> array = new ArrayList<Usuario>();
            Consultar consultar = new Consultar();
            boolean coincidencian = true, coincidenciac = true;
            
            array = consultar.logueados();
            
            Iterator<Usuario> iterator = array.iterator();
            while(iterator.hasNext())
            {
                coincidenciac = true;
                coincidencian = true;
                
                Usuario usuariobd = new Usuario();
                usuariobd = iterator.next();
                char[] tempc, tempbdc;
                System.out.println("comparacion con usuario");
                tempc = request.getParameter("nombre").toCharArray();
                tempbdc = usuariobd.getNombre().toCharArray();
                int i = 0;
                while(i < tempc.length && i < tempbdc.length)
                {
                    System.out.println(tempc[i] +" "+ tempbdc[i]);
                    if(tempc[i] != tempbdc[i])
                    {
                        coincidencian = false;
                        break;
                    }
                    i++;
                }
                System.out.println("comparacion con correo");
                tempc = request.getParameter("correo").toCharArray();
                tempbdc = usuariobd.getCorreo().toCharArray();
                i = 0;
                while(i < tempc.length && i < tempbdc.length)
                {
                    System.out.println(tempc[i] +" "+ tempbdc[i]);
                    if(tempc[i] != tempbdc[i])
                    {
                        coincidenciac = false;
                        break;
                    }
                    i++;
                }
                System.out.println(coincidencian + " " + coincidenciac);
                if(coincidenciac || coincidencian)
                    break;
                
            }
            if(coincidenciac || coincidencian)
            {
                response.sendRedirect("error-usuario_existente.jsp");
            }
            else
            {
                Usuario usuario = new Usuario();
                Agregar agregar = new Agregar();


                usuario.setNombre(request.getParameter("nombre"));
                usuario.setContraseña(request.getParameter("contrasena"));
                usuario.setCorreo(request.getParameter("correo"));

                System.out.println(usuario.getNombre()+request.getParameter("contrasena")+usuario.getCorreo());

                agregar.usuarioLogeado(usuario);
                response.sendRedirect("successful-registro_logeado.jsp");
                
            }
        %>
    </body>
</html>
