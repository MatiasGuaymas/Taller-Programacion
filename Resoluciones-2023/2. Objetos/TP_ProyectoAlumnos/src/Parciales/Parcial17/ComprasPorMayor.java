package Parciales.Parcial17;

public class ComprasPorMayor extends Compra{
    private ConsumidorFinal consu;
    
    public ComprasPorMayor(int numero, Fecha fecha, int cant, ConsumidorFinal consu) {
        super(numero, fecha, cant);
        this.consu = consu;
    }

    public ConsumidorFinal getConsu() {
        return consu;
    }

    public void setConsu(ConsumidorFinal consu) {
        this.consu = consu;
    }
    
    @Override
    public void agregarProducto(Producto prod) {
        if(prod.getCant() > 6) {
            super.agregarProducto(prod);
        }
    }
    
    @Override
    public double obtenerPrecio() {
        double aux = super.obtenerPrecio();
        return aux - (aux*0.21);
    }
    
}
