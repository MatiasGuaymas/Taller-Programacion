package Parciales.Parcial16;

public class Cuenta {
    private int cbu;
    private String alias;
    private int dni;
    private String moneda;
    private double monto;
    
    public Cuenta(int cbu, String alias, int dni, String moneda) {
        this.cbu = cbu;
        this.alias = alias;
        this.dni = dni;
        this.moneda = moneda;
        this.monto = 0.0;
    }

    public int getCbu() {
        return cbu;
    }

    public void setCbu(int cbu) {
        this.cbu = cbu;
    }

    public String getAlias() {
        return alias;
    }

    public void setAlias(String alias) {
        this.alias = alias;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public String getMoneda() {
        return moneda;
    }

    public void setMoneda(String moneda) {
        this.moneda = moneda;
    }

    public double getMonto() {
        return monto;
    }

    public void setMonto(double monto) {
        this.monto = monto;
    }
    
    public void incrementar(double mon) {
        this.monto += mon;
    }
}
