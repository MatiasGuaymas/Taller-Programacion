package Parciales.Parcial9;

public class Butaca {
    private String descriptor;
    private double precio;
    private boolean ocupado;
    
    public Butaca(){
        this.descriptor = "";
        this.precio = 0.0;
        this.ocupado = false;
    }
    
    public void calcularPrecio(int n){
        this.precio = 800 + (100 * n);
    }
    
    public void descripcion(int n, int m){
        this.descriptor = "BUTACA: "+ (n+1) + "  "  + (m+1);
    }
    
    public void ocupar(){
        this.ocupado = true;
    }
    
    public void desocupar(){
        this.ocupado = false;
    }
    
    public String getDescriptor() {
        return descriptor;
    }

    public void setDescriptor(String descriptor) {
        this.descriptor = descriptor;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public boolean isOcupado() {
        return ocupado;
    }

    public void setOcupado(boolean ocupado) {
        this.ocupado = ocupado;
    }
@Override
    public String toString(){
        String aux = this.descriptor + "  "+ this.precio + "  " +this.ocupado;
        return aux;
    }
}
