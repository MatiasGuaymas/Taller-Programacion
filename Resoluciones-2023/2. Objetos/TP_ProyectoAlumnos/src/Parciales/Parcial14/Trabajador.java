package Parciales.Parcial14;

public abstract class Trabajador {
    private String nombre;
    private int dni;
    private int ingreso;
    private double sueldo;
    
    public Trabajador(String nombre, int dni, int ingreso, double sueldo) {
        this.nombre = nombre;
        this.dni = dni;
        this.ingreso = ingreso;
        this.sueldo = sueldo;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public int getIngreso() {
        return ingreso;
    }

    public void setIngreso(int ingreso) {
        this.ingreso = ingreso;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }
    
    public double obtenerSueldo() {
        double aux = 0.0;
        if((2023 - ingreso) > 20) {
            aux = this.sueldo * 0.10;
        }
        return aux + this.sueldo;
    }
    
    @Override
    public String toString() {
        return "Nombre=" + this.nombre + " DNI=" + this.dni + " Sueldo=" + Math.round(this.obtenerSueldo()*100)/100;
    }
}
