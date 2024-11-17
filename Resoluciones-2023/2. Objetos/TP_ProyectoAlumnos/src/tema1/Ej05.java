/* 5- El dueño de un restaurante entrevista a cinco clientes y les pide que califiquen
(con puntaje de 1 a 10) los siguientes aspectos: (0) Atención al cliente (1) Calidad
de la comida (2) Precio (3) Ambiente.
Escriba un programa que lea desde teclado las calificaciones de los cinco clientes
para cada uno de los aspectos y almacene la información en una estructura. Luego
imprima la calificación promedio obtenida por cada aspecto. */

package tema1;

import PaqueteLectura.Lector;
import PaqueteLectura.GeneradorAleatorio;

public class Ej05 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int [][] restaurante = new int [5][4];
        int i, j;
        //System.out.println("Clasifique los aspectos según su código del 1 al 10: 0) Atención al cliente. 1) Calidad de la comida. 2) Precio. 3) Ambiente.");
        
        for (i=0; i<5; i++)
            for (j=0; j<4; j++) {
                //System.out.println("Clasifique el aspecto : " + j);
                //restaurante [i][j]= Lector.leerInt();
                restaurante[i][j] = (GeneradorAleatorio.generarInt(10)+1);
            }
        for (i=0; i<5; i++) {
             System.out.println("-------------");
             for(j=0; j<4; j++)
                  System.out.print(restaurante[i][j] + " | ");
        }     
        
        double [] promedio = new double [4];
        for (j=0; j<4; j++) {
            double prom = 0;
            for(i=0; i<5; i++)
                prom+= restaurante[i][j];
            prom = prom/5;
            promedio[j] = prom;
    }
        System.out.println("-------------");
        for (i=0; i<4; i++)
            System.out.println("El promedio del aspecto " + i+ " es: " + promedio[i]);
    }
}
