package Practica5;

import PaqueteLectura.*;
public class EJ2 {
    public static void main(String[] args) {
        Estacionamiento est1;
        Auto a;
        est1 = new Estacionamiento("Lavadero Estanislao", "Calle cumpleanito");
        int i, j;
        /*for(i=0;i<5;i++){
            for(j=0;j<10;j++){
                System.out.print(" | " + est1.getMatriz()[i][j].getNombreDueno() + " | ");
            }
         System.out.println(" ");
        }*/
    
        String aux = "Ok";
        
        for(i=0;i<5;i++){
            for(j=0;j<5;j++){
                if((i == 2)&&(j==3)){
                a = new Auto("MATI SE LAS TRAGA", aux);
                est1.agregarAuto(a, i , j);
                }
                else{
                    a= new Auto(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarString(7));
                    est1.agregarAuto(a, i, j);
                }
            }
        }
    
        System.out.println(est1.toString());
        System.out.println(est1.autosXPlaza(6));
        System.out.println(est1.buscarAuto(aux));
    }
    
    
    
}
