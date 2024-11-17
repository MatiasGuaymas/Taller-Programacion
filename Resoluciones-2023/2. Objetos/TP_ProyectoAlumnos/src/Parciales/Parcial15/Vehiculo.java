package Parciales.Parcial15;

public class Vehiculo {
    private int patente;
    private int cantHoras;
    private String marca;
    private String modelo;
    
    public Vehiculo(int patente, int cantHoras, String marca, String modelo) {
        this.patente = patente;
        this.cantHoras = cantHoras;
        this.marca = marca;
        this.modelo = modelo;
    }

    public int getPatente() {
        return patente;
    }

    public void setPatente(int patente) {
        this.patente = patente;
    }

    public int getCantHoras() {
        return cantHoras;
    }

    public void setCantHoras(int cantHoras) {
        this.cantHoras = cantHoras;
    }

    public String getMarca() {
        return marca;
    }

    public void setMarca(String marca) {
        this.marca = marca;
    }

    public String getModelo() {
        return modelo;
    }

    public void setModelo(String modelo) {
        this.modelo = modelo;
    }
    
    @Override
    public String toString() {
        return "Patente=" + this.patente + " Marca=" + this.marca + " Modelo=" + this.modelo + " Horas=" + this.cantHoras;
    }
}
