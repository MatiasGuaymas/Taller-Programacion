package Parciales.Parcial13;

public class Surtidor {
    private boolean enServicio;
    private Venta [] ventas;
    private int cantVentas = 0;
    private int cantMax;
    
    public Surtidor(int capacidad) {
        this.enServicio = true;
        this.cantMax = capacidad;
        this.ventas = new Venta[cantMax];
        for(int i = 0; i<capacidad; i++) {
            this.ventas[i] = null;
        }
    }
    
    public boolean isEnServicio() {
        return enServicio;
    }

    public void setEnServicio(boolean enServicio) {
        this.enServicio = enServicio;
    }

    private Venta[] getVentas() {
        return ventas;
    }

    private void setVentas(Venta[] ventas) {
        this.ventas = ventas;
    }
    
    private boolean hayEspacio() {
        return cantVentas < cantMax;
    }
    
    public void agregarVenta(Venta v) {
        if(hayEspacio()) {
            this.ventas[cantVentas++] = v;
        }
    }
    
    private int calcularCantidad() {
        int cant=0;
        for(int j=0; j < cantVentas; j++) {
            cant+= this.ventas[j].getCant();
        }
        return cant;
    }
    
    public void actualizarServicio(int x) {
        if(calcularCantidad() < x) {
            this.enServicio = false;
        }
    }
    
    public Venta calcularMax() {
        double max = -1;
        Venta venMax = null;
        for(int k=0; k < cantVentas; k++) {
            if(this.ventas[k].getMonto() > max) {
                max = this.ventas[k].getMonto();
                venMax = this.ventas[k];
            }
        }
        return venMax;
    }
    
    private String verificarServicio() {
        if(this.enServicio) {
            return " Esta en servicio ";
        }
        else
            return " Esta fuera de servicio ";
    }
    
    private String concatenador() {
        String aux = "";
        for(int m=0; m < cantVentas; m++) {
            aux= aux+ " | " + this.ventas[m].toString() + " | ";
        }
        return aux;
    }
    
    @Override
    public String toString() {
        String aux = this.verificarServicio() + " Ventas: "+ this.concatenador();
        return aux;
    }
}
