package bd;

import identidad.Pin;
import identidad.Usuario;
import identidad.ZonaInteres;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.logging.Level;
import java.util.logging.Logger;
import static javax.ws.rs.client.Entity.xml;

public class Consultar extends Conexion
{
    public Consultar()
    {
        super();
    }

    public int ObIdRep(String cat){
    if ("Broma".equals(cat)){
        return 1;
    }
    if ("Contenido inapropiado".equals(cat)){
        return 2;
    }
    if ("Lenguaje Vulgar".equals(cat)){
        return 3;
    }
    if ("Otros".equals(cat)){
        return 4;
    }
    
    return 0;
 }
    
    public int obIdCat(String cat){
    if ("Violación".equals(cat)){
        return 1;
    }
    if ("Robo(carterismo)".equals(cat)){
        return 2;
    }
    if ("Asalto".equals(cat)){
        return 3;
    }
    if ("Robo".equals(cat)){
        return 4;
    }
    if ("Homicidio".equals(cat)){
        return 5;
    }
    if ("Reunion maliciosa".equals(cat)){
        return 6;
    }
    if ("Acoso".equals(cat)){
        return 7;
    }
        return 0;
    }
    
     
            
    public int AsigZona (double lat, double lon){
    if( lat>=19.455862 && lat<=19.467085){
        if (lon<=-99.152793 && lon>= -99.165177) {
            return 1;
        }
        if (lon<=-99.140409 && lon>= -99.152794) {
            return 2;
        }
        if (lon<=-99.128025 && lon>= -99.140411) {
            return 3;
        }
        if (lon<=-99.121999 && lon>= -99.128024) {
            return 4;
        }
    }
    if( lat>=19.444639 && lat<=19.455862){
        if (lon<=-99.152793 && lon>= -99.165677) {
            return 5;
        }
        if (lon<=-99.140409 && lon>= -99.152794) {
            return 6;
        }
        if (lon<=-99.128025 && lon>= -99.140411) {
            return 7;
        }
        if (lon<=-99.121999 && lon>= -99.128024) {
            return 8;
        }
    }
    if( lat>=19.422194 && lat<=19.444638){
        if (lon<=-99.152793 && lon>= -99.165177) {
            return 9;
        }
        if (lon<=-99.140409 && lon>= -99.152794) {
            return 10;
        }
        if (lon<=-99.128025 && lon>= -99.140411) {
            return 11;
        }
        if (lon<=-99.121999 && lon>= -99.128024) {
            return 12;
        }
        if (lon<=-99.165177 && lon>= -99.178861) {
            return 21;
        }
        
    }
    if( lat>=19.410971 && lat<=19.422193){
        if (lon<=-99.165177 && lon>= -99.177561) {
            return 23;
        }
        if (lon<=-99.152793 && lon>= -99.165177) {
            return 13;
        }
        if (lon<=-99.140409 && lon>= -99.152794) {
            return 14;
        }
        if (lon<=-99.128025 && lon>= -99.140411) {
            return 15;
        }
        if (lon<=-99.121999 && lon>= -99.128024) {
            return 16;
        }
    }
    if( lat>=19.399748 && lat<=19.410971){
        if (lon<=-99.152793 && lon>= -99.165177) {
            return 17;
        }
        if (lon<=-99.140409 && lon>= -99.152794) {
            return 18;
        }
        if (lon<=-99.128025 && lon>= -99.140411) {
            return 19;
        }
        if (lon<=-99.121999 && lon>= -99.128024) {
            return 20;
        }
        if (lon<=-99.165178 && lon>= -99.177561) {
            return 22;
        }
    }
    if( lat>=19.404971 && lat<=19.419193){
        if (lon<=-99.177561 && lon>= -99.186861) {
            return 24;
        }
    }
    return 0;
    }
    
    public ArrayList<Pin> pines()
    {   
        ArrayList<Pin> array=new ArrayList<Pin>();
        try
        {
            ps = con.prepareStatement("select id_pin, cox_pin, coy_pin, des_pin, fec_pin, id_zon, id_usu, id_cat, nom_cat from pin natural join catpin");
            rs = ps.executeQuery();
            while(rs.next()){
                Pin pin=new Pin();
                pin.setId(rs.getInt(1));
                pin.setLat(rs.getDouble(2));
                pin.setLon(rs.getDouble(3));
                pin.setDes(rs.getString(4));
                pin.setFecha(rs.getString(5));
                pin.setZona(rs.getInt(6));
                pin.setIdusu(rs.getInt(7));
                pin.setCat(rs.getInt(8));
                pin.setNomcat(rs.getString(9));
                array.add(pin);
                System.out.println("pin"+pin.getId());
            }
            con.close();
        }
        
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar la consulta de pines");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }   
    
       return array;
    }

    public ArrayList<Pin> pines(String zona)
    {
        ArrayList<Pin> arrayPines = new ArrayList<Pin>();
        return arrayPines;
    }

    public ArrayList<Usuario> usuarios()
    {
        ArrayList<Usuario> array = new ArrayList<Usuario>();
        
        try
        {
            ps = con.prepareStatement("select * from usuario");
            rs = ps.executeQuery();
            while(rs.next())
            {
                Usuario usuario=new Usuario();
                
                usuario.setId(rs.getInt(1));
                usuario.setNombre(rs.getString(2));
                usuario.setContraseña(rs.getString(3));
                usuario.setCorreo(rs.getString(4));
                usuario.setTipoUsuario(rs.getInt(5));
                
                array.add(usuario);
                System.out.println("usuario con id#"+usuario.getId());
            }
            con.close();
        }
        
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar la consulta de usuarios");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }   
    
        return array;
        
    }
    
    public ArrayList<Usuario> logueados()
    {
        ArrayList<Usuario> array = new ArrayList<Usuario>();
        
        try
        {
            ps = con.prepareStatement("select * from vlogeado");
            rs = ps.executeQuery();
            while(rs.next())
            {
                Usuario usuario=new Usuario();
                
                usuario.setId(rs.getInt(1));
                usuario.setNombre(rs.getString(2));
                usuario.setCorreo(rs.getString(3));
                
                array.add(usuario);
                System.out.println("usuario con id#"+usuario.getId());
            }
            con.close();
        }
        
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar la consulta de usuarios");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }   
    
        return array;
        
    }
    public int obHora(String Hora){
        String obh="";
        for (int i = 0; i < 2; i++) {
            obh+=Hora.charAt(i);
        }
        int h=Integer.parseInt(obh);
        if (h>=0 && h<=2) {
            return 1;
        }
        if (h>2 && h<=4) {
            return 2;
        }
        if (h>4 && h<=6) {
            return 3;
        }
        if (h>6 && h<=8) {
            return 4;
        }
        if (h>8 && h<=10) {
            return 5;
        }
        if (h>10 && h<=12) {
            return 6;
        }
        if (h>12 && h<=14) {
            return 7;
        }
        if (h>14 && h<=16) {
            return 8;
        }
        if (h>16 && h<=18) {
            return 9;
        }
        if (h>18 && h<=20) {
            return 10;
        }
        if (h>20 && h<=22) {
            return 11;
        }
        if (h>22 && h<=24) {
            return 12;
        }
        return 0;
    }
    
    
    public boolean zonaExist(int idU, int idZ)
    {
        boolean exist = true;
        try 
        {
            System.out.println("1");
            ps = con.prepareStatement("select count(id_zon) from relazu where id_usu = ? and id_zon = ?");
            ps.setInt(1,idU);
            ps.setInt(2,idZ);
            System.out.println("2");
            rs = ps.executeQuery();
            System.out.println("3");
            rs.next();
            System.out.println(rs.getInt("count(id_zon)"));
            if ( rs.getInt(1) == 0 )
            {
                exist = false;
            }
        }
        catch (SQLException ex) 
        {
            Logger.getLogger(Consultar.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println("4");
        return exist;
    }
    
    public ArrayList<ZonaInteres> zonasInteres(int idusu)
    {
        ArrayList<ZonaInteres> array = new ArrayList<ZonaInteres>();
        
        try
        {
            ps = con.prepareStatement("select id_zon from relazu where id_usu = ? and act_rzu = 1");
            ps.setInt(1,idusu);
            rs = ps.executeQuery();
            while(rs.next())
            {
                ZonaInteres zonainteres = new ZonaInteres();
                
                zonainteres.setId(rs.getInt(1));
                
                array.add(zonainteres);
                System.out.println("zona "+zonainteres.getId());
            }
            con.close();
        }
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar la consulta de usuarios");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }
    
        return array;
    }
    
    public Pin pin (int id)
    {
        Pin pin = new Pin();
        return pin;
    }
    
    public ResultSet zonasInteresByUser(int id)
    {
        ResultSet rsAlt = null;
        try 
        {
            ps = con.prepareStatement("select id_zon from relazu where id_usu = ?");
            ps.setInt(1, id);
            rsAlt = ps.executeQuery();
            System.out.println("Zona encontradas");
        } 
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar la Zonas de interes por usuarios");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }
        
        return rsAlt;
    }
    
    public ArrayList<Pin> pinesByUser(int id)
    {
        ArrayList<Pin> array = new ArrayList<Pin>();
        
        try
        {
            ResultSet rsAlt = zonasInteresByUser(id);
            while(rsAlt.next())
            {
                int idTemp = rsAlt.getInt(1);
                
                ps = con.prepareStatement("select id_pin, cox_pin, coy_pin, des_pin, fec_pin, id_zon, id_usu, id_cat, nom_cat from pin natural join catpin where id_zon = ?");
                ps.setInt(1,idTemp);
                rs = ps.executeQuery();
                while(rs.next())
                {
                    Pin pin=new Pin();
                    pin.setId(rs.getInt(1));
                    pin.setLat(rs.getDouble(2));
                    pin.setLon(rs.getDouble(3));
                    pin.setDes(rs.getString(4));
                    pin.setFecha(rs.getString(5));
                    pin.setZona(rs.getInt(6));
                    pin.setIdusu(rs.getInt(7));
                    pin.setCat(rs.getInt(8));
                    pin.setNomcat(rs.getString(9));

                    array.add(pin);

                    System.out.println("pin"+pin.getId()+" parte de usuario");

                }
            }
            con.close();
        }
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar la consulta de Pines");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }
        return array;
    }
    
    public  Usuario usuario (int id)
    {
        Usuario usuario = new Usuario();
        try
        {
            ps = con.prepareStatement("select * from  usuario where id_usu = ?");
            ps.setInt(1,id);

            rs = ps.executeQuery();
            while(rs.next())
            {
                usuario.setId(rs.getInt(1));
                usuario.setNombre(rs.getString(2));
                usuario.setContraseña(rs.getString(3));
                usuario.setCorreo(rs.getString(4));
                usuario.setTipoUsuario(rs.getInt(5));
            }
                System.out.println("Usuario encontrado");
            con.close();
        }
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar la busqueda de usuario");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }
        return usuario;
    }
    public  Usuario usuario (String nombre, String contraseña)
    {
        Usuario usuario = new Usuario();
        try
        {
            ps = con.prepareStatement("select * from usuario where nom_usu = ? and pas_usu = ?");
            ps.setString(1,nombre);
            ps.setString(2,contraseña);

            rs = ps.executeQuery();
            while(rs.next())
            {
                usuario.setId(rs.getInt(1));
                usuario.setNombre(rs.getString(2));
                usuario.setContraseña(rs.getString(3));
                usuario.setCorreo(rs.getString(4));
                usuario.setTipoUsuario(rs.getInt(5));
            }
            if(usuario.getTipoUsuario() == 0)
            {
                System.out.println("Usuario no registrado");
                usuario = null;
            }
            else
            {
                System.out.println("Usuario encontrado");
            }
            con.close();
        }
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar la busqueda de usuario");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }

        return usuario;
    }
    public  Usuario usuario (String nombre)
    {
        Usuario usuario = new Usuario();
        try
        {
            ps = con.prepareStatement("select * from usuario where nom_usu = ?");
            ps.setString(1,nombre);

            rs = ps.executeQuery();
            while(rs.next())
            {
                usuario.setId(rs.getInt(1));
                usuario.setNombre(rs.getString(2));
                usuario.setContraseña(rs.getString(3));
                usuario.setCorreo(rs.getString(4));
                usuario.setTipoUsuario(rs.getInt(5));
            }
            if(usuario.getTipoUsuario() == 0)
            {
                System.out.println("Usuario no registrado");
                usuario = null;
            }
            else
            {
                System.out.println("Usuario encontrado");
            }
            con.close();
        }
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar la busqueda de usuario");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }
        return usuario;
    }
    public  Usuario usuarioByCorreo (String correo)
    {
        Usuario usuario = new Usuario();
        try
        {
            ps = con.prepareStatement("select * from usuario where ema_usu = ?");
            ps.setString(1,correo);

            rs = ps.executeQuery();
            while(rs.next())
            {
                usuario.setId(rs.getInt(1));
                usuario.setNombre(rs.getString(2));
                usuario.setContraseña(rs.getString(3));
                usuario.setCorreo(rs.getString(4));
                usuario.setTipoUsuario(rs.getInt(5));
            }
            if(usuario.getTipoUsuario() == 0)
            {
                System.out.println("Usuario no registrado");
                usuario = null;
            }
            else
            {
                System.out.println("Usuario encontrado");
            }
            con.close();
        }
        catch(SQLException d)
        {
            System.out.println("Sin poder procesar la busqueda de usuario");
            System.out.println(d.getMessage());
            System.out.println(Arrays.toString(d.getStackTrace()));
        }
        return usuario;
    }
    
    public ZonaInteres zonainteres(int id)
    {
        ZonaInteres zonaInteres = new ZonaInteres();
        return zonaInteres;
    }
    
    public String arch(){
    ArrayList<String> columnas = new ArrayList<String>();
    String xml="";    
    try {
            String tabla="pin";
            ps = con.prepareStatement("describe pin");
            rs = ps.executeQuery();
                columnas.clear();
                while (rs.next()) {
                    columnas.add(rs.getString("Field"));
            }                
            xml+="<"+tabla+">\n";
            String c4 = "SELECT * FROM " + tabla;
            ps = con.prepareStatement(c4);
            rs = ps.executeQuery();
            while (rs.next()) {
                xml+="\t<"+tabla.substring(0,tabla.length()-1)+">\n";
                for (int i = 0; i < columnas.size(); i++) {
                    xml+="\t\t<"+columnas.get(i)+">"+rs.getObject(i+1)+"</"+columnas.get(i)+">\n";
                }
                xml+="\t</"+tabla.substring(0,tabla.length()-1)+">\n";
            }
            xml+="</"+tabla+">\n";
            System.out.println(xml);
            return xml;
        } catch (SQLException ex) {
           ex.printStackTrace();
        }
        return xml;
    }
    public String obColor(String cat){
    String aqua="http://93.188.165.24/maps/maker/icon-aqua.png";
    String azul="http://93.188.165.24/maps/maker/icon-blue.png";
    String cafe="http://93.188.165.24/maps/maker/icon-brown.png";
    String verde="http://93.188.165.24/maps/maker/icon-gren.png";
    String naranja="http://93.188.165.24/maps/maker/icon-orange.png";
    String rojo="http://93.188.165.24/maps/maker/icon-red.png";
    String blanco="http://93.188.165.24/maps/maker/icon-white.png";
    String amarillo="http://93.188.165.24/maps/maker/icon-yellow.png";
    if ("Violacion".equals(cat)){
        return aqua;
    }
    if ("Carterismo".equals(cat)){
        return azul;
    }
    if ("Asalto".equals(cat)){
        return cafe;
    }
    if ("Robo".equals(cat)){
        return verde;
    }
    if ("Homicidio".equals(cat)){
        return naranja;
    }
    if ("Reunion maliciosa".equals(cat)){
        return rojo;
    }
    if ("Acoso".equals(cat)){
        return amarillo;
    }
        return "";
    }
    
}