/* 5-A- Definir una clase para representar círculos. Los círculos se caracterizan por su radio
(double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un círculo, le cargue información leída de teclado e
informe en consola el perímetro y el área.
NOTA: la constante PI es Math.PI */

package Practica3.Ejercicio5;

import PaqueteLectura.*;

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
