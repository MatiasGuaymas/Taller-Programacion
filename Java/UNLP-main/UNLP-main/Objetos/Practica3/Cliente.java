package Practica3;
public class Cliente {
    String nombre;
    int dni;
    int edad;

    
   public Cliente(){
       
   }
    
    
   public Cliente(String nom1, int dni1, int edxd){
       nombre = nom1;
       dni = dni1;
       edad = edxd;
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

    public int getEdad() {
        return edad;
    }

    public void setEdad(int edad) {
        this.edad = edad;
    }
    
    
   
}
