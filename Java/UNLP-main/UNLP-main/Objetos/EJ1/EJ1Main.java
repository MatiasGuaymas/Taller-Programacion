/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practicasjava.EJ1;


//import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector; 
//import java.util.HashSet;
//import java.util.Set;
public class EJ1Main {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int unDni,unaEdad;
        String unNombre;
        
        System.out.println("ingrese Dni:");
        unDni=Lector.leerInt();
        System.out.println("ingrese Nombre:");
        unNombre = Lector.leerString();
        System.out.println("ingrese Edad:");
        unaEdad = Lector.leerInt();
        
      ClassPersona persona = new ClassPersona();
        
      persona.setDni(unDni);
      persona.setNombre(unNombre);
      persona.setEdad(unaEdad);
      
      System.out.println(persona.toString());
        
    }
    
}
