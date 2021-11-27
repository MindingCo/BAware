package bd;

import identidad.Usuario;
import java.sql.SQLException;
import java.util.Arrays;

public class Modificar extends Conexion
{
    public Modificar()
    {
        super();
    }

    public void usuario (Usuario usuario)
    {
        int conteo = 0;
        try
        {
            ps = con.prepareStatement("update usuario set pas_usu = ?, ema_usu = ? where id_usu = ?");
            ps.setString(1,usuario.getContraseña());
            ps.setString(2,usuario.getCorreo());
            ps.setInt(3,usuario.getId());

            conteo = ps.executeUpdate();

            System.out.println("Datos Acttualizados");

            con.close();
        }
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar el cambio de datos del usuario");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }
    }
    public void usuarioContraseña (Usuario usuario)
    {
        int conteo = 0;
        try
        {
            ps = con.prepareStatement("update usuario set pas_usu = ? where id_usu = ?");
            ps.setString(1,usuario.getContraseña());
            ps.setInt(2,usuario.getId());

            conteo = ps.executeUpdate();

            System.out.println("Contraseña actualizada");

            con.close();
        }
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar el cambio de contraseña del usuario");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }
    }
    public void usuarioCorreo (Usuario usuario)
    {
        int conteo = 0;
        try
        {
            ps = con.prepareStatement("update usuario set ema_usu = ? where id_usu = ?");
            ps.setString(1,usuario.getCorreo());
            ps.setInt(2,usuario.getId());

            conteo = ps.executeUpdate();

            System.out.println("Correo actualizado");

            con.close();
        }
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar el cambio de correo del usuario");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }
    }
}