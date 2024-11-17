package Parciales.Parcial14;

public class Director extends Trabajador {
    private double montoViaticos;
    
    public Director (String nombre, int dni, int ingreso, double sueldo, double montoViaticos) {
        super(nombre, dni, ingreso, sueldo);
        this.montoViaticos = montoViaticos;
    }

    public double getMontoViaticos() {
        return montoViaticos;
    }

    public void setMontoViaticos(double montoViaticos) {
        this.montoViaticos = montoViaticos;
    }
    
    @Override
    public double obtenerSueldo() {
        return super.obtenerSueldo() + montoViaticos;
    }
}
