package Practica5;

public class Persona {
    private String nombre;
    private int dni;
    
    public Persona(String nombre, int dni) {
        setNombre(nombre);
        setDni(dni);
    }

    public String getNombre() {
        return nombre;
    }

    private void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    private void setDni(int dni) {
        this.dni = dni;
    }
    
    
    @Override
    public String toString() {
        return "Nombre=" + this.nombre + " DNI=" + this.dni;
    }
}
