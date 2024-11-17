package Parciales.Parcial8;

public class Alumno2 {
    private int dni;
    private String nombre;
    private int asistencias;
    private int autoEvaluaciones;

    public Alumno2(int d, String nom){
        this.dni = d;
        this.nombre = nom;
        this.asistencias = 0;
        this.autoEvaluaciones = 0;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public void setAsistencias(int asistencias) {
        this.asistencias = asistencias;
    }

    public void setAutoEvaluaciones(int autoEvaluaciones) {
        this.autoEvaluaciones = autoEvaluaciones;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public String getNombre() {
        return nombre;
    }

    public int getAsistencias() {
        return asistencias;
    }

    public int getAutoEvaluaciones() {
        return autoEvaluaciones;
    }
    
    public void incAsistencia(){
        this.asistencias++;
    }
    
    public void incAutoEvaluacion(){
        this.autoEvaluaciones++;
    }
}
