package Parciales.Parcial6;

public class Paciente {
    private String nombre;
    private boolean obraSocial;
    private double costoAbono;

    public Paciente(String nombre, boolean obraSocial, double costoAbono){
        this.nombre = nombre;
        this.obraSocial = obraSocial;
        this.costoAbono = costoAbono;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public boolean isObraSocial() {
        return obraSocial;
    }

    private void setObraSocial(boolean obraSocial) {
        this.obraSocial = obraSocial;
    }

    public double getCostoAbono() {
        return costoAbono;
    }

    public void setCostoAbono(double costoAbono) {
        this.costoAbono = costoAbono;
    }
    
    
}
