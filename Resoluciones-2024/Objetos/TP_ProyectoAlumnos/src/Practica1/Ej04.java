/* 4- Un edificio de oficinas está conformado por 8 pisos (1..8) y 4 oficinas por piso
(1..4). Realice un programa que permita informar la cantidad de personas que
concurrieron a cada oficina de cada piso. Para esto, simule la llegada de personas al
edificio de la siguiente manera: a cada persona se le pide el nro. de piso y nro. de
oficina a la cual quiere concurrir. La llegada de personas finaliza al indicar un nro.
de piso 9. Al finalizar la llegada de personas, informe lo pedido. */

import PaqueteLectura.*;

public class Ej04 {
    public static void main(String[] args) {
         GeneradorAleatorio.iniciar();
         int dimPiso = 8;
         int dimOficina = 4;
         int [][] edificio = new int [dimPiso][dimOficina];
         int i, j;
         //Java inicializa la matriz de int automaticamente, pero lo hago igual.
         for(i = 0; i < dimPiso; i++) {
             for(j = 0; j < dimOficina; j++) {
                 edificio[i][j] = 0;
             }
         }
         //System.out.println("Ingrese el numero de piso: ");
         //int piso = Lector.leerInt();
         int piso = GeneradorAleatorio.generarInt(9)+1;
         while(piso != 9) {
             //System.out.println("Ingrese el numero de oficina: ");
             int oficina = GeneradorAleatorio.generarInt(4)+1;
             //System.out.println((piso-1) + " " + (oficina-1));
             edificio[piso-1][oficina-1]++;
             //System.out.println("Ingrese el numero de piso: ");
             piso = GeneradorAleatorio.generarInt(9)+1; 
         }
         for (i=0; i<dimPiso; i++) {
             System.out.println("-------------");
             for(j=0; j<dimOficina; j++)
                  System.out.print(edificio[i][j] + " | ");
        }     
    }
}
