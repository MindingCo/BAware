package bd;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Conexion
{
    private static final String url = "jdbc:mysql://localhost/baware";
    private static final String username = "root";
    private static final String password = "n0m3l0";

    protected Connection con;
    protected PreparedStatement ps;
    protected ResultSet rs;

    public Conexion()
    {
        try
        {   
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,username,password);
            System.out.println("Se conecto la base de datos");
        }
        catch(ClassNotFoundException | SQLException e)
        {
            System.out.println("No se ha establecido conexion con la BD de B-Aware");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
    }

    public Connection getConexion()
    {
        try
        {   
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(url,username,password);
            System.out.println("Se conecto la base de datos");
        }
        catch(ClassNotFoundException | SQLException e)
        {
            System.out.println("No se ha establecido conexion con la BD de B-Aware");
            System.out.println(e.getMessage());
            System.out.println(e.getStackTrace());
        }
        return con;
    }
}