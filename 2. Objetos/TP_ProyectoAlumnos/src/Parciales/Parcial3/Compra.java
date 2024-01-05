package Parciales.Parcial3;

public abstract class Compra {
    private int nro;
    private Producto[] prod;
    private int cantProductos;
    private int cantMaxProd;
    
    public Compra(int cantMax, int nro) {
        this.cantMaxProd = cantMax;
        this.prod = new Producto[this.cantMaxProd];
        this.nro = nro;
        this.cantProductos = 0;
        for(int i = 0; i < this.cantMaxProd; i++) {
            this.getProd()[i] = null; 
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

    private Producto[] getProd() {
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
    
    private String concatenador(){
        String aux = "";
        int i;
        for (i=0;i<this.getCantProductos();i++){
            aux += this.prod[i].toString();
        }
    return aux;
    }
    
    @Override
    public String toString() {
        String aux;
        aux = "Nro: " + this.getNro() + " Lista de productos: " + this.concatenador() + " Precio a pagar: " + this.getMonto();
        return aux;
    }
}
