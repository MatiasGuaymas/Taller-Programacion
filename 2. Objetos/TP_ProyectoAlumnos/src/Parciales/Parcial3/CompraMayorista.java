package Parciales.Parcial3;

public class CompraMayorista extends Compra {
    private int cuit;
    
    public CompraMayorista(int cantMax, int nro, int cuit){
        super(cantMax, nro);
        this.cuit = cuit;
    }

    public int getCuit() {
        return cuit;
    }

    public void setCuit(int cuit) {
        this.cuit = cuit;
    }

    @Override
    public String toString() {
        String aux = super.toString() + " CUIT" + this.getCuit();
        return aux;
    }
}
