package Parciales.Parcial14;

public class Encargado extends Trabajador {
    private int cantEmpleados;
    
    public Encargado (String nombre, int dni, int ingreso, double sueldo, int cant) {
        super(nombre, dni, ingreso, sueldo);
        this.cantEmpleados = cant;
    }

    public int getCantEmpleados() {
        return cantEmpleados;
    }

    public void setCantEmpleados(int cantEmpleados) {
        this.cantEmpleados = cantEmpleados;
    }
    
    @Override
    public double obtenerSueldo() {
        return super.obtenerSueldo() + (cantEmpleados*1000);
    }
}
