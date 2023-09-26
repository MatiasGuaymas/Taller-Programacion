/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
import PaqueteLectura.*;

/**
 *
 * @author Matute
 */
public class Ejercicio1 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Persona per = new Persona();
        System.out.println("Ingrese un nombre: ");
        per.setNombre(Lector.leerString());
        System.out.println("Ingrese un DNI: ");
        per.setDNI(Lector.leerInt());
        System.out.println("Ingrese una edad: ");
        per.setEdad(Lector.leerInt());
        System.out.println(per.toString());
    }
    
}
