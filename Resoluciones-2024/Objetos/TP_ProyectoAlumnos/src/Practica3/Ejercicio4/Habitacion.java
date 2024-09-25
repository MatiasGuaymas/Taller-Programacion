package Practica3.Ejercicio4;

import PaqueteLectura.*;

public class Habitacion {
    private double costo;
    private boolean ocupada;    
    private Cliente cliente;
    
    public Habitacion() {
        costo = GeneradorAleatorio.generarDouble(6001)+2000;
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

    public void ocupar(Cliente c){
        this.cliente = c;
        this.ocupada = true;
    }
    
    public Cliente getCliente() {
        return cliente;
    }

    public void setCliente(Cliente cliente) {
        this.cliente = cliente;
    }
    
    public void aumentarPrecio(double n) {
        costo += n;
    }
    
    @Override
    public String toString(){
        String aux = "Costo="+costo+" Estado="+ ocupada;
        if(ocupada) {
            aux+= cliente.toString();
        }
        return aux;
    }
}
