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
