/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4v2;

import PaqueteLectura.*;
public class EJ1 {
    public static void main(String[] args) {
        Circulo circulo1;
        Triangulo triangulo1;
        
        circulo1 = new Circulo(Lector.leerDouble(), Lector.leerString(), Lector.leerString());
        triangulo1 = new Triangulo(Lector.leerInt(), Lector.leerInt(), Lector.leerInt(), Lector.leerString(), Lector.leerString());
     
        
        System.out.println(circulo1.ToString());
        System.out.println(triangulo1.ToString());
        
        triangulo1.despintar();
        System.out.println(triangulo1.getColorLinea());
        System.out.println(triangulo1.getColorRelleno());
        triangulo1.setColorLinea("xd");
        System.out.println(triangulo1.getColorLinea());
    }
    
    
}
