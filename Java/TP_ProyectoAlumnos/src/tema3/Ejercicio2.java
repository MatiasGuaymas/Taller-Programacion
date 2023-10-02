/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema3;

import PaqueteLectura.*;

public class Ejercicio2 {
    
    public static void main(String[] args) {
        
       Autor unAutor = new Autor();
       Autor unAutor2 = new Autor();
       unAutor.setBiografia(GeneradorAleatorio.generarString(10));
       unAutor.setOrigen(GeneradorAleatorio.generarString(10));
       unAutor.setNombre(GeneradorAleatorio.generarString(10));
       unAutor2.setBiografia(GeneradorAleatorio.generarString(10));
       unAutor2.setOrigen(GeneradorAleatorio.generarString(10));
       unAutor2.setNombre(GeneradorAleatorio.generarString(10));
       
       Libro libro1= new  Libro( "Java: A Beginner's Guide", "Mcgraw-Hill", 2014,unAutor, "978-0071809252", 21.72);
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
