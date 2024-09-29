package Practica5.Ejercicio2;

public class Auto {
    private String nombreDueno;
    private String patente;
    
    public Auto(String str, String i){
        this.nombreDueno = str;
        this.patente = i;
    }
    
    public String getNombreDueno() {
        return nombreDueno;
    }

    public void setNombreDueno(String nombreDueno) {
        this.nombreDueno = nombreDueno;
    }

    public String getPatente() {
        return patente;
    }

    public void setPatente(String patente) {
        this.patente = patente;
    }
    
    public String toString() {
        return this.nombreDueno + " " + this.patente;
    }
}
