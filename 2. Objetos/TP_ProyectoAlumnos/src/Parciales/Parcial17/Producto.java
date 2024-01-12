package Parciales.Parcial17;

public class Producto {
    private int codigo;
    private String descripcion;
    private double precioUni;
    private int cant;
    
    public Producto(int codigo, String desc, double precio, int cant){
        this.codigo = codigo;
        this.descripcion = desc;
        this.precioUni = precio;
        this.cant = cant;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public double getPrecioUni() {
        return precioUni;
    }

    public void setPrecioUni(double precioUni) {
        this.precioUni = precioUni;
    }

    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }
    
    public double obtenerTotal() {
        return this.cant * this.precioUni;
    }
    
    @Override
    public String toString() {
        return "Codigo=" + this.codigo + " Descripcion=" + this.descripcion + " Total=" + this.obtenerTotal();
    }
}
