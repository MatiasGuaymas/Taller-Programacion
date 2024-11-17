/* 3-A- Defina una clase para representar estantes. Un estante almacena a lo sumo 20 libros.
Implemente un constructor que permita iniciar el estante sin libros. Provea métodos para:
(i) devolver la cantidad de libros que almacenados (ii) devolver si el estante está lleno
(iii) agregar un libro al estante (iv) devolver el libro con un título particular que se recibe.
B- Realice un programa que instancie un estante. Cargue varios libros. A partir del estante,
busque e informe el autor del libro “Mujercitas”.
C- Piense: ¿Qué modificaría en la clase definida para ahora permitir estantes que
almacenen como máximo N libros? ¿Cómo instanciaría el estante? */

package tema3;

import PaqueteLectura.*;

public class Ejercicio3 {
    
    public static void main(String[] args) {
        Estanteria estante1 = new Estanteria();
        GeneradorAleatorio.iniciar();
            
        int i;
        for(i=0;i<10;i++){
            Autor unAutor = new Autor(GeneradorAleatorio.generarString(8), GeneradorAleatorio.generarString(10), GeneradorAleatorio.generarString(5));
            Libro libro = new Libro(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarString(4),GeneradorAleatorio.generarInt(4), unAutor ,GeneradorAleatorio.generarString(4),GeneradorAleatorio.generarDouble(6));
            if(i == 5){
                libro.setTitulo("mujercitas");
            }
            estante1.agregarLibro(libro);
        }
        System.out.println(estante1.getCantLibros());
        System.out.println(estante1.estaLleno());
        System.out.println(estante1.devolverTitulo("mujercitas").getPrimerAutor().getNombre());
    }
    
}
