/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package practicasjava.EJ1;
import PaqueteLectura.GeneradorAleatorio;
//import PaqueteLectura.Lector;
//import java.util.HashSet;
//import java.util.Set;
public class Ej3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        ClassPersona matriz [][] = new ClassPersona [5][8];
        int i, j, edad, dni;
        String nom;
        GeneradorAleatorio.iniciar();
        
        
       i = 0;
       edad = 0;
       dni = 0;
       nom = GeneradorAleatorio.generarString(5);
       while((!nom.equals("ZZZ")) && (i<5)){
           j = 0;
           while((!nom.equals("ZZZ")) && (j < 8)){
               matriz[i][j] = new ClassPersona(nom, GeneradorAleatorio.generarInt(dni), GeneradorAleatorio.generarInt(edad));
               nom = GeneradorAleatorio.generarString(5);
               j++;
           }
           i++;
           nom = GeneradorAleatorio.generarString(5);
       }
       
       
   int a= 0; int b = 0;
        while(a < i ) {
            while(b < j && matriz[a][b] != null) {
                System.out.println(matriz[a][b].toString());
                b++; //Paso al turno siguiente
            }
            a++; //Paso al dia siguiente
            b=0; //Reinicio para la siguiente fila
        }
    }
    
}

