package tema3;

import PaqueteLectura.*;

public class Ejercicio1 {

    public static void main(String[] args) {
        Triangulo triangulo1 = new Triangulo();
        String color;
        GeneradorAleatorio.iniciar();
        triangulo1.setLado1(GeneradorAleatorio.generarDouble(50));
        triangulo1.setLado2(GeneradorAleatorio.generarDouble(50));
        triangulo1.setLado3(GeneradorAleatorio.generarDouble(50));
        System.out.println("Ingrese color de relleno");
        color = Lector.leerString();
        triangulo1.setColorRelleno(color);
        System.out.println("Ingrese color de borde");
        color = Lector.leerString();
        triangulo1.setColorLinea(color);
        
        System.out.println(triangulo1.calcularPerimetro());
        
        System.out.println(triangulo1.calcularArea());
    }
    
}
