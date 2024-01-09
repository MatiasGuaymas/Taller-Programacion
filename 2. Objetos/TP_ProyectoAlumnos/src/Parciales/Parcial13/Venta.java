package Parciales.Parcial13;

public class Venta {
    private int dni;
    private int cant;
    private double monto;
    private String pago;
    private int cantVentas = 0;
    
    public Venta(int dni, int cant, double monto, String pago) {
        this.dni = dni;
        this.cant = cant;
        this.monto = monto;
        this.pago = pago;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getCant() {
        return cant;
    }

    public void setCant(int cant) {
        this.cant = cant;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getPago() {
        return pago;
    }

    public void setPago(String pago) {
        this.pago = pago;
    }
    
    @Override
    public String toString() {
        return " DNI=" + this.dni + " CANTM3=" + this.cant + " MONTO=" + this.monto + " PAGO=" + this.pago;
    } 
}
