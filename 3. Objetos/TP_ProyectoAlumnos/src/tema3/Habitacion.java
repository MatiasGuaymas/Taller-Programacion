package tema3;

import PaqueteLectura.*;

/**
 *
 * @author Matute
 */
public class Habitacion {
    private double costo;
    private boolean ocupada;    
    Cliente cliente;
    
    public Habitacion() {
    costo = GeneradorAleatorio.generarDouble(5000);
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
    
    public double aumentarPrecio(double n) {
        return costo + n;
    }
}
