package Parciales.Parcial18;

public class Surtidor {
    private String nombreCombustible;
    private double precioLitro;
    private Venta [] ventas;
    private int cantVentas = 0;
    private int maxVentas;
    private int i;
    
    public Surtidor(String nombre, double precio, int cant) {
        this.nombreCombustible = nombre;
        this.precioLitro = precio;
        this.maxVentas = cant;
        this.ventas = new Venta[maxVentas];
        for(i=0; i<maxVentas; i++) {
            this.ventas[i] = null;
        }
    }

    public String getNombreCombustible() {
        return nombreCombustible;
    }

    public void setNombreCombustible(String nombreCombustible) {
        this.nombreCombustible = nombreCombustible;
    }

    public double getPrecioLitro() {
        return precioLitro;
    }

    public void setPrecioLitro(double precioLitro) {
        this.precioLitro = precioLitro;
    }

    public int getCantVentas() {
        return cantVentas;
    }
    
    public void generarVen(int dni, int cantLitros, String pago) {
        if(cantVentas < maxVentas) {
            double monto = precioLitro * cantLitros;
            Venta ven = new Venta(dni, cantLitros, monto, pago);
            this.ventas[cantVentas++] = ven;
        }
    }
    
    public double getTotal() {
        double aux = 0.0;
        for(i=0; i<cantVentas; i++){
            aux+= this.ventas[i].getMonto();
        }
        return aux;
    }
    
    private String concatenador() {
        String aux = "";
        for(i=0; i<cantVentas; i++) {
            aux+= this.ventas[i].toString();
        }
        return aux;
    }
    
    @Override
    public String toString() {
        return "Combustible=" + this.nombreCombustible + " Precio por Litro=" + this.precioLitro + " Ventas: " + this.concatenador();
    }
}
