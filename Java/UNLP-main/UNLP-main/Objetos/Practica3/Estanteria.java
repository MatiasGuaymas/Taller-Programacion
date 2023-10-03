/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica3;

/**
 *
 * @author Alumno
 */
public class Estanteria {
   private int cantLibros = 0;
   private int maximo = 20;
   private Libro [] libros;
    
   
   public Estanteria(){
      libros = new Libro [maximo];
   }
   
   public Estanteria(int n){
       maximo = n;
       libros = new Libro [n];
   }
   public int getCantLibros(){
       return cantLibros;
   }
   
   public boolean estaLleno(){
       return maximo == cantLibros;
   }
   //este modulo asume que se checkeo que no este llena la estanteria con el modulo estaLleno
   public boolean agregarLibro(Libro libro1){
       if(!estaLleno()){
           libros[cantLibros++] = libro1;
           return true;
       }
       return false;
   }
   
   public Libro devolverTitulo(String titulo1){
       int aux = 0;
       while((aux < cantLibros) && (titulo1 != this.libros[aux].getTitulo())){
          aux++;
       }
      if(aux < cantLibros){
          return libros[aux];
      }
      else
           return null;
   }
   
   
}