package Parciales.Parcial14;

public class Empresa {
    private String nombre;
    private String direccion;
    private Director director;
    private Encargado [] encargados;
    private int cantEncargados;
    
    public Empresa(String nombre, String direccion, Director director, int cant) {
        this.nombre = nombre;
        this.direccion = direccion;
        this.director = director;
        this.cantEncargados = cant;
        this.encargados = new Encargado[this.cantEncargados];
        for(int i =0; i < cantEncargados; i++) {
            this.encargados[i] = null;
        }
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public Director getDirector() {
        return director;
    }

    public void setDirector(Director director) {
        this.director = director;
    }

    private Encargado[] getEncargados() {
        return encargados;
    }

    private void setEncargados(Encargado[] encargados) {
        this.encargados = encargados;
    }

    private int getCantEncargados() {
        return cantEncargados;
    }

    private void setCantEncargados(int cantEncargados) {
        this.cantEncargados = cantEncargados;
    }
    
    public void agregarEncargado(int x, Encargado encargado) {
        this.encargados[x-1] = encargado;
    }
    
    private String concatenador() {
        String aux = "";
        for(int k=0; k < cantEncargados; k++){
            if(this.encargados[k] == null) {
                aux+= (k+1) + ". No hay encargado asignado" + "\n";
            } else {
                aux+= (k+1) + ". "+this.encargados[k].toString() + "\n";
            }
        }
        return aux;
    }
    
    @Override
    public String toString() {
        return "Nombre=" + this.nombre + " Direccion=" + this.direccion + " Director: " + this.director.toString() + " \n" + this.concatenador();
    }
}
