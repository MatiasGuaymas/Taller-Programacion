package Parciales.Parcial4;

public class Participante {
    private int dni;
    private String nombre;
    private int edad;
    
    public Participante (int unDni, String unNombre, int unaEdad){
        this.dni=unDni;
        this.nombre=unNombre;
        this.edad=unaEdad;
    }
    public int getDni() {
        return dni;
    }
    public String getNombre() {
        return nombre;
    }
    public int getEdad() {
        return edad;
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    @Override
    public String toString() {
        return this.nombre;
    }
}

