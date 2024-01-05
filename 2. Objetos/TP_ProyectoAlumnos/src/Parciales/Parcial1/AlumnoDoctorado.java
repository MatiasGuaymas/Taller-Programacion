package Parciales.Parcial1;

public class AlumnoDoctorado extends Alumno {
    private String titulo;
    private String universidad;

    public AlumnoDoctorado(String titulo, String uni, int dni, String nom, int max){
        super(dni, nom, max);
        this.titulo = titulo;
        this.universidad = uni;
    }
    
    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getUniversidad() {
        return universidad;
    }

    public void setUniversidad(String universidad) {
        this.universidad = universidad;
    }
@Override
    public String toString(){
        String aux;
        aux = super.toString()+ "  " + this.getTitulo() +" Universidad de Origen:  " +  this.getUniversidad();
        return aux;
    }
    
    
}
