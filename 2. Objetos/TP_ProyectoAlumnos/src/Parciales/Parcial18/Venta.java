package Parciales.Parcial18;

public class Venta {
    private int dni;
    private int cantLitros;
    private double monto;
    private String pago;
    
    public Venta(int dni, int cant, double monto, String pago) {
        this.dni = dni;
        this.cantLitros = cant;
        this.monto = monto;
        this.pago = pago;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getCantLitros() {
        return cantLitros;
    }

    public void setCantLitros(int cantLitros) {
        this.cantLitros = cantLitros;
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
        return "DNI=" + this.dni + " CantLitros=" + this.cantLitros + " Monto=" + this.monto + " | ";
    }
}
