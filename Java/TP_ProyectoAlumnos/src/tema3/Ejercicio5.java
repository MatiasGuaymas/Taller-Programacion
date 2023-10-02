package tema3;

import PaqueteLectura.*;

/**
 *
 * @author Matute
 */
public class Ejercicio5 {
    
    public static void main(String[] args) {
        Circulo circulo1;
        double radio;
        String color1, color2;
        System.out.println("Ingrese radio");
        radio = Lector.leerDouble();
        System.out.println("Ingrese color");
        color1 = Lector.leerString();
        System.out.println("Ingrese color");
        color2 = Lector.leerString();
        
        circulo1 = new Circulo(radio, color1, color2);
        
        System.out.println("El perimetro de este circulo es igual a : " + circulo1.calcularPerimetro());
        System.out.println("El area de este circulo es igual a : " + circulo1.calcularArea());
        
    }
    
}
