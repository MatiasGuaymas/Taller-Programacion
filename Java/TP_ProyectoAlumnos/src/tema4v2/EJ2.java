/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4v2;
import PaqueteLectura.*;
public class EJ2 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Entrenador entrenador1;
        Jugador jugador1;
        jugador1 = new Jugador(10, 25, "carlitos prrrum", 1000, 4);
        entrenador1 = new Entrenador(8, "Sabello", 2000, 10);
   
        System.out.println(jugador1.ToString());
        System.out.println(entrenador1.ToString());
    }
    
}
