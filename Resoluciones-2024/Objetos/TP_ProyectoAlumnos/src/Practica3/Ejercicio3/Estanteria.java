package Practica3.Ejercicio3;

import Practica3.Ejercicio2.Libro;

public class Estanteria {
  
   private int cantLibros;
   private int maximo = 20;
   private Libro [] libros;
    
   
   public Estanteria(){
       this.cantLibros = 0;
      libros = new Libro [maximo]; //Todas las posiciones del vector apuntaran a null gracias a Java, hasta que se hagan new Libro[pos]
   }
   
   public Estanteria(int n){
       this.cantLibros = 0;
       maximo = n;
       libros = new Libro [n];
   }
   
   public int getCantLibros(){
       return cantLibros;
   }
   
   public boolean estaLleno(){
       return maximo == cantLibros;
   }
   //Este modulo asume que se checkeo que no este llena la estanteria con el modulo estaLleno
   public boolean agregarLibro(Libro libro1){
       if(!estaLleno()){
           libros[cantLibros++] = libro1;
           return true;
       }
       return false;
   }
   
   public Libro devolverTitulo(String titulo1){
       int aux = 0;
       while((aux < cantLibros) && (!titulo1.equals(this.libros[aux].getTitulo()))){
          aux++;
       }
      if(aux < cantLibros){
          return libros[aux];
      }
      else
           return null;
   }
   
   
}

