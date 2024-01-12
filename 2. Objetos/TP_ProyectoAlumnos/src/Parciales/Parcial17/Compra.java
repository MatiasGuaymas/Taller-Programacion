package Parciales.Parcial17;

public class Compra {
    private int numero;
    private Fecha fecha;
    private Producto[] productos;
    private int cantMax;
    private int cantProductos = 0;
    private int i;
    
    public Compra(int numero, Fecha fecha, int cant) {
        this.numero = numero;
        this.fecha = fecha;
        this.cantMax = cant;
        this.productos = new Producto[cantMax];
        for(i=0; i<cantMax; i++) {
            this.productos[i] = null;
        }
    }

    public int getNumero() {
        return numero;
    }

    public Fecha getFecha() {
        return fecha;
    }

    public void setNumero(int numero) {
        this.numero = numero;
    }

    public void setFecha(Fecha fecha) {
        this.fecha = fecha;
    }

    public int getCantProductos() {
        return cantProductos;
    }
    
    public void agregarProducto(Producto prod) {
        this.productos[cantProductos++] = prod;
    }
    
    public double obtenerPrecio() {
        double aux = 0.0;
        for(i=0; i<cantProductos; i++){
            aux+= this.productos[i].obtenerTotal();
        }
        return Math.round(aux*100)/100;
    }
    
    public String resumenCompra() {
        String aux="";
        for(i=0; i<cantProductos; i++) {
            aux+= i + ". " + "Numero=" + this.numero + " Fecha=" + this.fecha.toString() + " " + this.productos[i].toString() + "\n";
        }
        aux+= "Total de la compra: " + this.obtenerPrecio();
        return aux;
    }
    
    public boolean abonableCuotas() {
        return this.obtenerPrecio() > 100000.0;
    }
}
