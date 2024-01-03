/* 2-A- Modifique la clase Libro.java (carpeta tema3) para ahora considerar que el primer
autor es un objeto instancia de la clase Autor.
Implemente la clase Autor, sabiendo que se caracterizan por nombre, biografía y origen
y que deben permitir devolver/modificar el valor de sus atributos y devolver una
representación String formada por nombre, biografía y origen.
Luego realice las modificaciones necesarias en la clase Libro.
B- Modifique el programa Demo01Constructores (carpeta tema3) para instanciar los
libros con su autor, considerando las modificaciones realizadas. Luego, a partir de uno de
los libros instanciados, obtenga e imprima la representación del autor de ese libro. */

package tema3;

import PaqueteLectura.*;

public class Ejercicio2 {
    
    public static void main(String[] args) {
        
       Autor unAutor = new Autor(GeneradorAleatorio.generarString(8), GeneradorAleatorio.generarString(10), GeneradorAleatorio.generarString(5));
       Autor unAutor2 = new Autor(GeneradorAleatorio.generarString(8), GeneradorAleatorio.generarString(10), GeneradorAleatorio.generarString(5));
       
       Libro libro1= new  Libro( "Java: A Beginner's Guide", "Mcgraw-Hill", 2014, unAutor, "978-0071809252", 21.72);
       Libro libro2= new Libro("Learning Java by Building Android Games",  
                              "CreateSpace Independent Publishing", unAutor2, "978-1512108347");
        System.out.println(libro1.toString());
        System.out.println(libro2.toString());
        System.out.println("Precio del libro2: " +libro2.getPrecio());
        System.out.println("Año edición del libro2: " +libro2.getAñoEdicion());
        System.out.println(libro1.getPrimerAutorBiografia());
        System.out.println(libro1.getPrimerAutorNombre());
        System.out.println(libro1.getPrimerAutorOrigen());
        System.out.println(libro2.getPrimerAutorBiografia());
        System.out.println(libro2.getPrimerAutorNombre());
        System.out.println(libro2.getPrimerAutorOrigen());
    }
    
}
