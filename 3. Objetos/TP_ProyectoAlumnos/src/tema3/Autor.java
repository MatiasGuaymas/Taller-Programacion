package tema3;

public class Autor {
    private String nombre;
    private String biografia;
    private String origen;
    
    public Autor() {
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getBiografia() {
        return biografia;
    }

    public void setBiografia(String biografia) {
        this.biografia = biografia;
    }

    public String getOrigen() {
        return origen;
    }

    public void setOrigen(String origen) {
        this.origen = origen;
    }

    @Override
    public String toString() {
        return "El autor se llama" + nombre + " es de origen " + origen + " y su biografia es " + biografia;
    }
}
