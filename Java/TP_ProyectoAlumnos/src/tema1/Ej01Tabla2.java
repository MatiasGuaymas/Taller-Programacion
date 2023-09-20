/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema1;

import PaqueteLectura.GeneradorAleatorio;

public class Ej01Tabla2 {

    /**
     * Carga un vector que representa la tabla del 2
     */
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DF=15;  
        int [] tabla2 = new int[DF]; // indices de 0 a 14
        int i;
        int num = GeneradorAleatorio.generarInt(15);
        for (i=0;i<DF;i++) 
            tabla2[i]=2*i;
        
        while (num != 11)
            {
            System.out.println("2x" + num + "=" + tabla2[num]); // Mostrar el resultado de 2xnum
            num = GeneradorAleatorio.generarInt(15); // Generar un nuevo número aleatorio entre 0 y 14
            }
        System.out.println(num);//Aca pruebo que realmente el 11 corte mi while
    }
}
