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
public class Ejercicio2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DF=15;  
        Persona [] vecPersona = new Persona[DF];
        int edad = PaqueteLectura.GeneradorAleatorio.generarInt(100);
        int diml = 0;
        while(edad != 0 && diml < 15) {
            String nombre = GeneradorAleatorio.generarString(5);
            int dni = GeneradorAleatorio.generarInt(40);
            vecPersona[diml] = new Persona(nombre, edad, dni);
            System.out.println(vecPersona[diml].toString());
            diml++;
            edad = GeneradorAleatorio.generarInt(100);
        }
        int contador = 0;
        int min = 999;
        Persona menor = null;
        for (int i = 0; i < diml; i ++) {
            if(vecPersona[i].getEdad() > 65)
                contador++;
            if(vecPersona[i].getDNI() < min) {
                min = vecPersona[i].getDNI();
                menor = vecPersona[i];
        }}
        System.out.println("CANT PERSONAS MAYORES DE 65 ANIOS: " + contador);
        System.out.println(menor.toString());
    }
    
}
