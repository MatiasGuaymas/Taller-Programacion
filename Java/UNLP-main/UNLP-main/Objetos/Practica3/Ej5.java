/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica3;

import PaqueteLectura.*;
public class Ej5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        Circulos circulo1;
        double radio;
        String color1, color2;
        System.out.println("Ingrese radio");
        radio = Lector.leerDouble();
        System.out.println("Ingrese color");
        color1 = Lector.leerString();
        System.out.println("Ingrese color");
        color2 = Lector.leerString();
        
        circulo1 = new Circulos(radio, color1, color2);
        
        System.out.println(circulo1.CalcularArea());
        System.out.println(circulo1.CalcularPerimetro());
    }
    
}
