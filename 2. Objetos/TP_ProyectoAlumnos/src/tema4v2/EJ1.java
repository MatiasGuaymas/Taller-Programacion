/* 1-A- Incluya la clase Triángulo a la jerarquía de figuras vista (carpeta tema4). Triángulo
debe heredar de Figura todo lo que es común y definir su constructor y sus atributos y
métodos propios. Además debe redefinir el método toString.
B- De igual manera, incluya la clase Círculo a la jerarquía de figuras.
C- Añada a la representación String el valor del perímetro. Piense ¿qué método toString
debe modificar: el de cada subclase o el de Figura?
D- Añada el método despintar que establece los colores de la figura a línea “negra” y
relleno “blanco”. Piense ¿dónde debe definir el método: en cada subclase o en Figura?
E- Realizar un programa que instancie un triángulo y un círculo. Muestre en consola la
representación String de cada uno. Pruebe el funcionamiento del método despintar. */

package tema4v2;

import PaqueteLectura.*;

public class EJ1 {
    public static void main(String[] args) {
        Circulo circulo1;
        Triangulo triangulo1;
        
        circulo1 = new Circulo(Lector.leerDouble(), Lector.leerString(), Lector.leerString());
        triangulo1 = new Triangulo(Lector.leerDouble(), Lector.leerDouble(), Lector.leerDouble(), Lector.leerString(), Lector.leerString());
     
        
        System.out.println(circulo1.ToString());
        System.out.println(triangulo1.ToString());
        
        triangulo1.despintar();
        System.out.println(triangulo1.getColorLinea());
        System.out.println(triangulo1.getColorRelleno());
    }
}
