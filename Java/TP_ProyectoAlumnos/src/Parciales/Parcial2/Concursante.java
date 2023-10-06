package Parciales.Parcial2;

public class Concursante {
    private String nombre;
    private int edad;
    private String instrumento;
    private double puntaje;

    
    public Concursante(String nom, int edad, String inst){
        this.edad = edad;
        this.instrumento = inst;
        this.nombre = nom;
        this.puntaje = -1;
    }
  
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }

    public String getInstrumento() {
        return instrumento;
    }

    public void setInstrumento(String instrumento) {
        this.instrumento = instrumento;
    }

    public double getPuntaje() {
        return puntaje;
    }

    public void setPuntaje(double puntaje) {
        this.puntaje = puntaje;
    }
    
    
}
