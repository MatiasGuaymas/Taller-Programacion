/*
 Programa que instancia un objeto libro e inicializa sus v.i.s enviando mensajes set#
 */
package tema3;

import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author vsanz
 */
public class Demo01Libro {

    /**
     * http://www.amazon.com/Java-Beginners-Guide-Herbert-Schildt/dp/0071809252/ref=sr_1_3?s=books&ie=UTF8&qid=1434108310&sr=1-3
     */
    public static void main(String[] args) {
        Libro libro = new Libro();
        libro.setTitulo("Java: A Beginner's Guide");
        libro.setEditorial("Mcgraw-Hill");
        libro.setAñoEdicion(2014);
        Autor unAutor = new Autor();
        unAutor.setBiografia(GeneradorAleatorio.generarString(10));
        unAutor.setOrigen(GeneradorAleatorio.generarString(10));
        unAutor.setNombre(GeneradorAleatorio.generarString(10));
        libro.setISBN("978-0071809252");
        libro.setPrecio(21.72);
        System.out.println(libro.toString());
       // System.out.println(libro); /* invoca automaticamente al metodo toString */

    }
    
}
