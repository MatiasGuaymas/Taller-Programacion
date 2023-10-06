package Parciales.Parcial3;

import PaqueteLectura.*;


public abstract class Compra {
    private int nro;
    private Producto[] prod;
    private int cantProductos;
    private int cantMaxProd;
    
    public Compra(int cantMax, int cantProductos, int nro) {
        this.cantMaxProd = cantMax;
        this.prod = new Producto[this.cantMaxProd];
        this.nro = nro;
        this.cantProductos = cantProductos;
        for(int i = 0; i < this.cantProductos; i++) {
            this.getProd()[i] = new Producto(GeneradorAleatorio.generarInt(30), GeneradorAleatorio.generarDouble(50)+500.0, GeneradorAleatorio.generarString(4)); 
        }
    }

    public int getNro() {
        return nro;
    }

    public void setNro(int nro) {
        this.nro = nro;
    }

    public int getCantProductos() {
        return cantProductos;
    }

    public void setCantProductos(int cantProductos) {
        this.cantProductos = cantProductos;
    }

    public Producto[] getProd() {
        return prod;
    }

    public int getCantMaxProd() {
        return cantMaxProd;
    }
    
    
    public boolean hayEspacio(){
        return this.getCantProductos() < this.getCantMaxProd();
    }
    
    public void agregarProducto(Producto p){ 
        if(this.hayEspacio()){
            this.getProd()[this.cantProductos++] = p;
        }
    }
    
    public double getMonto() {
        double aux = 0;
        for(int i = 0; i < this.getCantProductos(); i++) {
            aux += this.getProd()[i].getPrecio();
        }
        return (aux + aux*0.21);
    }
    
    public String concatenador(){
        String aux = "";
        int i;
        for (i=0;i<this.getCantProductos();i++){
            aux += "Codigo " + this.getProd()[i].getCodigo() +  " Precio: " + this.getProd()[i].getPrecio() + " Descripcion: " + this.getProd()[i].getDescripcion() + "\n";
        }
    return aux;
    }
    
    public String toString() {
        String aux;
        aux = "Nro: " + this.getNro() + " Lista de productos: " + this.concatenador() + " Precio a pagar: " + this.getMonto();
        return aux;
    }
}
