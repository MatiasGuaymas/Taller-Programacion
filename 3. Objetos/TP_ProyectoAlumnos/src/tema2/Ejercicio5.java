/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema2;

/**
 *
 * @author Matute
 */

import PaqueteLectura.*;

public class Ejercicio5 {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
       GeneradorAleatorio.iniciar();
       Partido vec [] = new Partido [20];
       int j,i,golL, golV;
       String nomL, nomV;
       
       i = 0;
    
       nomV = GeneradorAleatorio.generarString(3);
       while((!nomV.equals("ZZZ")&&(i < 20))){
           //nomL = GeneradorAleatorio.generarString(5);
           nomL = Lector.leerString();
           vec[i] = new Partido(nomL, nomV , golL = GeneradorAleatorio.generarInt(7), golV = GeneradorAleatorio.generarInt(7));
           i++;
           nomV = GeneradorAleatorio.generarString(3);
       }
       
       int cant = 0,cantGoles = 0;
       
       for(j=0; j < i; j++){
           System.out.println(vec[j].getLocal() + " "+ vec[j].getGolesLocal()+ " VS " + vec[j].getVisitante() + " " + vec[j].getGolesVisitante());
           if(vec[j].getGanador().equals("River"))
               cant++;
           if(vec[j].getLocal().equals("Boca"))
               cantGoles = cantGoles + vec[j].getGolesLocal();
       }
    
       System.out.println("River gano: "+ cant + " partidos y boca metio: " + cantGoles + " de Local");
    }
    
}
