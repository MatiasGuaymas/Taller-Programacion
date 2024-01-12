package Parciales.Parcial18;

public class Estacion {
    private String direccion; 
    private Surtidor [] surtidores;
    private int maxSurtidores = 6;
    private int cantSurtidores = 0;
    private int i;
    
    public Estacion(String direccion) {
        this.direccion = direccion;
        this.surtidores = new Surtidor[maxSurtidores];
        for(i=0; i < maxSurtidores; i++) {
            this.surtidores[i] = null;
        }
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public int getCantSurtidores() {
        return cantSurtidores;
    }
    
    public void agregarSurtidor(Surtidor surt) {
        if(cantSurtidores < maxSurtidores) {
            this.surtidores[cantSurtidores++] = surt;
        }
    }
    
    public void generarVenta(int num, int dni, int cantLitros, String pago) {
        this.surtidores[num-1].generarVen(dni, cantLitros, pago);
    }
    
    public int mayorRecaudado(){
        double max = -1;
        int surt = 0;
        for(i=0; i<cantSurtidores; i++) {
            double recaudado = this.surtidores[i].getTotal();
            if(recaudado > max) {
                max = recaudado;
                surt = i;
            }
        }
        return surt+1;
    }
    
    @Override
    public String toString() {
        String aux = "Estacion de servicio: " + this.direccion + " - " + this.cantSurtidores + " surtidores"+ "\n";
        for(i=0; i<cantSurtidores; i++) {
            aux+= "Surtidor " + (i+1) + ": " + this.surtidores[i].toString() + "\n";
        }
        return aux;
    }
}
