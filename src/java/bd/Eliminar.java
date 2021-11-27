package bd;

import java.sql.SQLException;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;

public class Eliminar extends Conexion
{
    public Eliminar()
    {
        super();
    }
    
    public void pin(int id)
    {
        int i = 0;
        try 
        {
            System.out.println(i);
            ps = con.prepareStatement("delete from pin where id_pin = ? limit 1");
            ps.setInt(1, id);
            i = ps.executeUpdate();
            System.out.println(i);
            System.out.println("Se ha eliminado el pin " + id);
            
            con.close();
        } 
        catch (SQLException ex) 
        {
            System.out.println("Error al liminar pin");
            System.out.println(ex.getMessage());
            ex.printStackTrace();
            Logger.getLogger(Eliminar.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void usuario(int id)
    {
        int conteo = 0;
        try
        {
            ps = con.prepareStatement("delete from usuario where id_usu = ?");
            ps.setInt(1,id);

            conteo = ps.executeUpdate();

            System.out.println("Usuario eliminado");

            con.close();
        }
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar la eliminacion del usuario");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }
    }
    
    public void zona(int idUsu, int zona)
    {
        int conteo = 0;
        try
        {
            ps = con.prepareStatement("delete from relazu where id_usu = ? and id_zon = ?");
            ps.setInt(1, idUsu);
            ps.setInt(2, zona);

            conteo = ps.executeUpdate();

            System.out.println("zona "+ zona +" eliminada para " + idUsu);

            con.close();
        }
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar la eliminacion de la zona");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }
    }
}