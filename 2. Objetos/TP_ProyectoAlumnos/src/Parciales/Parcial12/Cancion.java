package Parciales.Parcial12;

public class Cancion {
    private String nombre;
    private String nombreCompositor;
    private int id;
    private Estudiante ganador;
    private double puntaje;

    public Cancion(String nombre, String nombreCompositor, int id) {
        this.nombre = nombre;
        this.nombreCompositor = nombreCompositor;
        this.id = id;
        this.puntaje = 0;
        this.ganador = null;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getNombreCompositor() {
        return nombreCompositor;
    }

    public void setNombreCompositor(String nombreCompositor) {
        this.nombreCompositor = nombreCompositor;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Estudiante getGanador() {
        return ganador;
    }

    public void setGanador(Estudiante ganador) {
        this.ganador = ganador;
    }

    public double getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(double puntaje) {
        this.puntaje = puntaje;
    }

    @Override
    public String toString() {
        return "Cancion=" + nombre + " Compositor=" + nombreCompositor + " Puntaje=" + Math.round(puntaje*100.0)/100.0;
    }
    
    
}
