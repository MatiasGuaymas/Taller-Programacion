/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practicasjava.EJ1;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;
public class EJ2 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       ClassPersona [] vec = new ClassPersona[15];
       int DF = 15;
       int DL = 1;
       int edad, dni, min;
       String nombre;
       int minpersona = 1, i,cant = 0;
       GeneradorAleatorio.iniciar();
       for(i=0;i<DF;i++){
           vec[i] = new ClassPersona();
       }
       
       edad = -1;
       while((DL < DF) && (edad != 0)){
           edad = GeneradorAleatorio.generarInt(70);
           nombre = GeneradorAleatorio.generarString(20);
           dni = GeneradorAleatorio.generarInt(100);
           vec[DL].setDni(dni);
           vec[DL].setEdad(edad);
           vec[DL].setNombre(nombre);
           DL++;
       }
       
       min = 200;
       
       for(i=0;i<DL;i++){
           if(vec[i].getEdad() >= 65)
               cant++;
           if(vec[i].getDni() < min){
               min = vec[i].getDni();
               minpersona = i;
           }          
        }  
 
       System.out.println("La cantidad de personas mayores a 65 es: "+cant);
       System.out.println(vec[minpersona].toString());
}
}