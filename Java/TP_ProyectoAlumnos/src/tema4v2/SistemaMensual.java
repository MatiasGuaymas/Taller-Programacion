/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4v2;

/**
 *
 * @author Francisco
 */
public class SistemaMensual extends Sistema{
    
   private double [] vector;
   
   public double [] obtenerPromedio(){
       int i,j;
       for(i=0;i<12;i++){
           double aux = 0;
           for(j=0;j<this.getCantAnos();j++){
               aux =+ this.obtenerTemp(j, i);
           vector[j-1] = aux / this.getCantAnos();
           }
       }
    return vector;
   }
}
