/* https://cdn.discordapp.com/attachments/963569430112129025/1160600646215553104/Parcial_2022_Turno_B_1.jpg?ex=65354094&is=6522cb94&hm=36588fe4c21c2f75efc2fc4d728e7e81e45404f9ca7545caafe031bd27658f2a&
ESE ES LINK CON LA FOTO DEL PARCIAL */

package Parciales.Parcial7;

import PaqueteLectura.*;

public class Parcial7 {
    
    public static void main(String[] args) {
        Torneo t1;
        Goleador g1;
        GeneradorAleatorio.iniciar();
        t1 = new Torneo("TORNEO", 10, 11);
        
        int aux = 0;
        while(aux != 5){
            aux = GeneradorAleatorio.generarInt(10) + 1;
            g1 = new Goleador(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarString(6), GeneradorAleatorio.generarInt(20));
            t1.agregarGoleador(g1, aux);
        }
     
        System.out.println(t1.toString());
    }
    
}
