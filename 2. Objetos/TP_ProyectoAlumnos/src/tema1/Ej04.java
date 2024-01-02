/* 4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido. */

package tema1;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

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
