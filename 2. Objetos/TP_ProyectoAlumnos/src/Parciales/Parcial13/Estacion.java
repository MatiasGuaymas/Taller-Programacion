package Parciales.Parcial13;

public class Estacion {
    private String direccion;
    private double precio;
    private Surtidor [] surtidores;
    private int cantVentas;
    private int cantSurtidores = 6;
    
    public Estacion(String direccion, double precio, int cantV) {
        this.direccion = direccion;
        this.precio = precio;
        this.surtidores = new Surtidor[cantSurtidores];
        for(int i=0; i<cantSurtidores; i++) {
            this.surtidores[i] = new Surtidor(cantV);
        }
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    private Surtidor[] getSurtidores() {
        return surtidores;
    }

    private void setSurtidores(Surtidor[] surtidores) {
        this.surtidores = surtidores;
    }

    public int getCantVentas() {
        return cantVentas;
    }

    public void setCantVentas(int cantVentas) {
        this.cantVentas = cantVentas;
    }
    
    public void generarVenta(int numSurtidor, int dni, int cantM3, String pago) {
        Venta v = new Venta(dni, cantM3, (cantM3*precio), pago);
        this.surtidores[numSurtidor-1].agregarVenta(v);
    }
    
    public void servicio(int x) {
        for(int j=0; j < cantSurtidores; j++) {
            this.surtidores[j].actualizarServicio(x);
        }
    }
    
    public Venta ventaMax() {
        Venta venMax = null;
        Venta aux = null;
        double max = -1;
        for(int k = 0; k < cantSurtidores; k++) {
            aux = this.surtidores[k].calcularMax();
            if(aux != null && aux.getMonto() > max) {
                max = aux.getMonto();
                venMax = aux;
            }
        }
        return venMax;
    }
    
    private String concatenador() {
        String aux = "";
        for(int l=0; l < cantSurtidores; l++) {
            aux+= "Surtidor " + (l+1) + this.surtidores[l].toString() + "\n";
        }
        return aux;
    }
    
    public String toString() {
        return "Estacion de Servicio: "+ this.direccion+ "; Precio M3: "+ this.precio + "\n" + this.concatenador();
    }
}
