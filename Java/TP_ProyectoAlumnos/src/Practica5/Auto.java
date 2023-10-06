package Practica5;

public class Auto {
    private String nombreDueno;
    private String patente;

    public Auto(){
        this.nombreDueno = "ninguno";
        this.patente = "0";
    }
    
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
}
