package identidad;



public class Usuario
{
    private String nombre, contraseña, correo;
    private int id, tipoUsuario;

    public void setUsuario(int id, String nombre, String contraseña, String correo, int tipoUsuario)
    {
        this.id = id;
        this.nombre = nombre;
        this.contraseña = contraseña;
        this.correo = correo;
        this.tipoUsuario = tipoUsuario;
    }

    public String getNombre()
    {
        return nombre;
    }
    public void setNombre(String nombre)
    {
        this.nombre = nombre;
    }

    public String getContraseña()
    {
        return contraseña;
    }
    public void setContraseña(String contraseña)
    {
        this.contraseña = contraseña;
    }

    public String getCorreo()
    {
        return correo;
    }
    public void setCorreo(String correo)
    {
        this.correo = correo;
    }

    public int getId()
    {
        return id;
    }
    public void setId(int id)
    {
        this.id = id;
    }

    public int getTipoUsuario()
    {
        return tipoUsuario;
    }
    public void setTipoUsuario(int tipoUsuario)
    {
        this.tipoUsuario = tipoUsuario;
    }
}