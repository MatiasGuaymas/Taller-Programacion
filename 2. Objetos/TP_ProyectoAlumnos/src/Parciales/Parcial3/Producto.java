package Parciales.Parcial3;

public class Producto {
    private int codigo;
    private double precio;
    private String descripcion;

    public Producto(int codigo, double precio, String descrip){
        this.codigo = codigo;
        this.precio = precio;
        this.descripcion = descrip;
    }
    
    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public double getPrecio() {
        return precio;
    }

    public void setPrecio(double precio) {
        this.precio = precio;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    @Override
    public String toString(){
        return "Codigo " + this.codigo +  " Precio: " + this.precio + " Descripcion: " + this.descripcion + "\n";
    }
    
}
