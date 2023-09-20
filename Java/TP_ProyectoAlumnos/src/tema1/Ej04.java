/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

/**
 *
 * @author Matute
 */
public class Ej04 {
    public static void main(String[] args) {
         GeneradorAleatorio.iniciar();
         int [][] edificio = new int [8][4];
         //System.out.println("Ingrese el numero de piso: ");
         //int piso = Lector.leerInt();
         int piso = GeneradorAleatorio.generarInt(9);
         while(piso != 8) { //seria piso != 9 en realidad
             //System.out.println("Ingrese el numero de oficina: ");
             int oficina = GeneradorAleatorio.generarInt(4);;
             edificio[piso][oficina]++;
             //System.out.println("Ingrese el numero de piso: ");
             piso = GeneradorAleatorio.generarInt(9); 
         }
         //System.out.println("-------------");
         System.out.println(piso);
         int i, j;
         for (i=0; i<8; i++) {
             System.out.println("-------------");
             for(j=0; j<4; j++)
                  System.out.print(edificio[i][j] + " | ");
        }     
    }
}
