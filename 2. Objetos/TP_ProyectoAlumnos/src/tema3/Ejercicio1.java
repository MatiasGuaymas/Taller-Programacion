/* 1-A- Definir una clase para representar triángulos. Un triángulo se caracteriza por el
tamaño de sus 3 lados (double), el color de relleno (String) y el color de línea (String).
Provea un constructor que reciba todos los datos necesarios para iniciar el objeto.
Provea métodos para:
- Devolver/modificar el valor de cada uno de sus atributos (métodos get y set)
- Calcular el perímetro y devolverlo (método calcularPerimetro)
- Calcular el área y devolverla (método calcularArea)
B- Realizar un programa que instancie un triángulo, le cargue información leída desde
teclado e informe en consola el perímetro y el área.
NOTA: Calcular el área con la fórmula Área = √(s(s − a)(s − b)(s − c)) , donde a, b y c son
los lados y s = (a+b+c)/2 . La función raíz cuadrada es Math.sqrt(#) */

package tema3;

import PaqueteLectura.*;

public class Ejercicio1 {
    public static void main(String[] args) {
        Triangulo triangulo1 = new Triangulo(Lector.leerDouble(), Lector.leerDouble(), Lector.leerDouble(), Lector.leerString(), Lector.leerString());
        System.out.println(triangulo1.calcularPerimetro());
        System.out.println(triangulo1.calcularArea());
    }
}
