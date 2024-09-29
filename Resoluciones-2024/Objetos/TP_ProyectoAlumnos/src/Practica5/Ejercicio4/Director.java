package Practica5.Ejercicio4;

public class Director extends Persona{
    private int edad;
    private int antiguedad;
    
    public Director(String nombre, int dni, int edad, int antiguedad) {
        super(nombre, dni);
        this.setEdad(edad);
        this.setAntiguedad(antiguedad);
    }

    public int getEdad() {
        return edad;
    }

    private void setEdad(int edad) {
        this.edad = edad;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    private void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
    
    @Override
    public String toString() {
        return super.toString() + " EDAD=" + this.edad + " ANTIGUEDAD=" + this.antiguedad;
    }
    
}
