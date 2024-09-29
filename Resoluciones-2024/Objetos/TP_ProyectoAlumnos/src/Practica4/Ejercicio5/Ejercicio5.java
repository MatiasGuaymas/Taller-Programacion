/* 5 A- Queremos representar dibujos. Un dibujo guarda su título y las figuras
que lo componen (círculos, triángulos, cuadrados, rectángulos, etc). Piense,
con lo visto hasta ahora (no es necesario implementar):
i- ¿Dónde almacenará las figuras que componen el dibujo?. ¿Cuántas
estructuras se necesitarán?. 
Las figuras se almacenan en un vector de Figuras, la manera incorrecta seria declarar
un vector por cada Figura.
ii- ¿Cómo agregará las distintas figuras al dibujo?. ¿Cuántos métodos agregar
necesita implementar?
Se recibe como parametro una Figura f, y se agrega, la manera incorrecta seria declarar
metodos de agregar figura para cada figura
iii- ¿Qué problema surge a medida que aumentan las posibles figuras en la
jerarquía?
Mientras mas figuras haya, la escabilidad en la solucion erronea es nula, mas metodos
por figura. En cambio con la solucion de agregar por medio de Figura, la escabilidad
es total
B- Implemente la clase Dibujo usando un array genérico de Figuras. Dicho array puede
guardar objetos creados a partir de cualquier subclase de Figura. Siga el molde mostrado.
B- Analice y ejecute programa MainDibujos. Responda: ¿Qué imprime? ¿Por qué?
Piense: ¿qué ventaja tiene esta implementación a medida que aumentan las posibles
figuras en la jerarquía? ¿cuál es la ventaja del polimorfismo? ¿dónde se observa en
este ejercicio? 
A medida que se agreguen figuras, no van a ser necesarios los cambios gracias al poliformismo, 
se observa a medida que se agregan figuras, y no ocurren errores, y todo imprime bien */

package Practica4.Ejercicio5;

public class Ejercicio5 {

    public static void main(String[] args) {
        Dibujo d = new Dibujo("un dibujo");
        Cuadrado c1 = new Cuadrado(10,"Violeta","Rosa");
        Rectangulo r = new Rectangulo(20,10,"Azul","Celeste");
        Cuadrado c2 = new Cuadrado(30,"Rojo","Naranja");
        d.agregar (c1);
        d.agregar (r);
        d.agregar (c2);
        d.mostrar();
    }
    
}
