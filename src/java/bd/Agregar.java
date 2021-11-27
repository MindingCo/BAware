package bd;

import identidad.Pin;
import identidad.Usuario;
import identidad.Reporte;
import java.sql.SQLException;
import java.util.Arrays;

public class Agregar extends Conexion
{
    public Agregar()
    {
        super();
    }
    
    public void reporte(Reporte reporte)
    {
        int conteo = 0;
        try
        {
            ps = con.prepareStatement("insert into reporte(des_rep, id_pin, id_ctr) values (?,?,?) ");
            ps.setString(1,reporte.getDes());
            ps.setInt(2,reporte.getIdp());
            ps.setInt(3,reporte.getIdcat());
            
            conteo = ps.executeUpdate();

            System.out.println("Reporte añadido");

            con.close();
        }
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar el reporte");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }
    }
    public void usuarioLogeado(Usuario usuario)
    {
        int conteo = 0;
        try
        {
            ps = con.prepareStatement("insert into usuario(nom_usu,pas_usu,ema_usu,id_tdu) values (?,?,?,?) ");
            ps.setString(1,usuario.getNombre());
            ps.setString(2,usuario.getContraseña());
            ps.setString(3,usuario.getCorreo());
            ps.setInt(4,2);

            conteo = ps.executeUpdate();

            System.out.println("Usuario "+usuario.getNombre()+" añadido como logeado");

            con.close();
        }
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar el registro del usuario");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }
    }
    public void usuarioAdministrador(Usuario usuario)
    {
        int conteo = 0;
        try
        {
            ps = con.prepareStatement("insert into usuario(nom_usu,pass_usu,ema_usu,tdu_usu) values (?,?,?,?) ");
            ps.setString(1,usuario.getNombre());
            ps.setString(2,usuario.getContraseña());
            ps.setString(3,usuario.getCorreo());
            ps.setInt(4,1);

            conteo = ps.executeUpdate();

            System.out.println("Usuario "+usuario.getNombre()+" añadido como administrador");

            con.close();
        }
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar el registro del usuario");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }
    }

    public void pin(Pin pin)
    {
         int conteo = 0;
        try
        {
            ps = con.prepareStatement("insert into pin(cox_pin,coy_pin,des_pin,fec_pin, id_hrs, id_zon, id_usu, id_cat) values (?,?,?,?,?,?,?,?) ");
            ps.setDouble(1,pin.getLat());
            ps.setDouble(2,pin.getLon());
            ps.setString(3,pin.getDes());
            ps.setString(4,pin.getFecha());
            ps.setInt(5,pin.getHora());
            ps.setInt(6,pin.getZona());
            ps.setInt(7,pin.getIdusu());
            ps.setInt(8,pin.getCat());
            conteo = ps.executeUpdate();

            System.out.println("Pin"+pin.getCat()+" añadido");

            con.close();
        }
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar el registro del pin");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }   
    }

    
    public void zona(int zona, int idusu)
    {
         int conteo=0;
         try
        {
            ps = con.prepareStatement("insert into relazu (id_usu, id_zon) values (?,?)");
            ps.setInt(1,idusu);
            ps.setInt(2,zona);
            conteo = ps.executeUpdate();
                con.close();
        }
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar el registro de zona");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }
    }

}