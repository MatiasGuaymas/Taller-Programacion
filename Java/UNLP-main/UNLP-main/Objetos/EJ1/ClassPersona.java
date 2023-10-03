/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practicasjava.EJ1;

/**
 *
 * @author Francisco
 */
public class ClassPersona {
    private String nombre;
    private int DNI;
    private int edad;
    
    public ClassPersona(String unNombre, int unDni, int unaEdad){
        nombre = unNombre;
        DNI = unDni;
        edad = unaEdad;
                
    }
     
    public ClassPersona(){
}
    
    public int getDni(){
        return DNI;
    }
    
     public int getEdad(){
        return edad;
    }
     
      public String getnombre(){
        return nombre;
    }
      
     public void setDni(int unDni){
        DNI = unDni;
    }
     
     
    public void setEdad(int unaEdad){
        edad = unaEdad;
    }
    
    
    public void setNombre(String unNombre){
        nombre = unNombre;
    }

    
     public String toString(){
        String aux; 
        aux = "Mi nombre es " + nombre + ", mi DNI es " + DNI + " y tengo " + edad + " años.";
        return aux;
    }
}
