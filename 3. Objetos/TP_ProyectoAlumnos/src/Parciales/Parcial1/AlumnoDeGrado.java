package Parciales.Parcial1;

public class AlumnoDeGrado extends Alumno {
    private String carrera;

    
    public AlumnoDeGrado(String Ca, int dni, String nom, int max){
        super(dni, nom, max);
        this.carrera = Ca;
    }
    public String getCarrera() {
        return carrera;
    }

    public void setCarrera(String Carrera) {
        this.carrera = Carrera;
    }
    
@Override
    public String toString(){
        String aux;
        aux = super.toString() + " Carrera: "+ this.getCarrera() + " | ";
        return aux;
    }
    
}
