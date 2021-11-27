package identidad;

public class Pin
{
    int id, cat, zona, idusu, hora;
    double lat, lon;
    String des, fecha, nomcat;

    
    public Pin(){
        id=0;
        cat=0;
        lat=0;
        lon=0;
        des="";
        fecha="";
        zona=0;
        idusu=0;
        nomcat="";
    }

    public int getHora() {
        return hora;
    }

    public void setHora(int hora) {
        this.hora = hora;
    }

    public int getId() 
    {
        return id;
    }

    public void setId(int id) 
    {
        this.id = id;
    }

    public int getCat() {
        return cat;
    }

    public void setCat(int cat) 
    {
        this.cat = cat;
    }

    public double getLat() 
    {
        return lat;
    }

    public void setLat(double lat) 
    {
        this.lat = lat;
    }

    public double getLon() 
    {
        return lon;
    }

    public void setLon(double lon) 
    {
        this.lon = lon;
    }

    public String getDes() 
    {
        return des;
    }

    public void setDes(String des) 
    {
        this.des = des;
    }

    public String getFecha() 
    {
        return fecha;
    }

    public void setFecha(String fecha) 
    {
        this.fecha = fecha;
    }

    public int getZona() 
    {
        return zona;
    }

    public void setZona(int zona) 
    {
        this.zona = zona;
    }

    public int getIdusu() 
    {
        return idusu;
    }

    public void setIdusu(int idusu) 
    {
        this.idusu = idusu;
    }

    public String getNomcat() 
    {
        return nomcat;
    }

    public void setNomcat(String nomcat) 
    {
        this.nomcat = nomcat;
    }
}



