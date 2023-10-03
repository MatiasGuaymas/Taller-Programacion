package Practica3;
import PaqueteLectura.GeneradorAleatorio;
public class Habitacion {
    double costo;
    boolean ocupada;
    Cliente cliente;
    
    public Habitacion(){
        costo = GeneradorAleatorio.generarInt(8000);
        ocupada = false;
        cliente = null;
    }

    public double getCosto() {
        return costo;
    }

    public void setCosto(double costo) {
        this.costo = costo;
    }

    public boolean isOcupada() {
        return ocupada;
    }

    public void setOcupada(boolean ocupada) {
        this.ocupada = ocupada;
    }

    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    
}
