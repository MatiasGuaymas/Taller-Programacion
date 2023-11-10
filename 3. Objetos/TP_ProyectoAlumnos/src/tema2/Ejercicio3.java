/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;
import PaqueteLectura.*;
/**
 *
 * @author Matute
 */
public class Ejercicio3 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        int dia = 5;
        int entrevistas = 8;
        Persona [][] entrevistado = new Persona[dia][entrevistas];
        GeneradorAleatorio.iniciar();
        int i=0; int j= 0;
        String nom = GeneradorAleatorio.generarString(5);
        
        //Empiezo dia 0
        while(!nom.equals("ZZZ")&&(i<dia)) {
            j=0; //Empieza desde la entrevista 0
            while(!nom.equals("ZZZ")&&(j<entrevistas)) {
                entrevistado[i][j] = new Persona();
                entrevistado[i][j].setNombre(nom);
                nom = GeneradorAleatorio.generarString(5);//HAGO ESTO PORQUE SI NO TODOS LOS STRINGS DEL DIA 0 SON LOS MISMOS
                entrevistado[i][j].setDNI(GeneradorAleatorio.generarInt(30));
                entrevistado[i][j].setEdad(GeneradorAleatorio.generarInt(100));
                j++;
            }
            i++; // Paso a otro dia
            nom = GeneradorAleatorio.generarString(5);
        }
        System.out.println(i + " " + j);
        
        int a= 0; int b = 0;
        
        while(a < i ) {
            while(b < j && entrevistado[a][b] != null) {
                System.out.println(entrevistado[a][b].toString());
                b++; //Paso al turno siguiente
            }
            a++; //Paso al dia siguiente
            b=0; //Reinicio para la siguiente fila
        }
    }
    
}
