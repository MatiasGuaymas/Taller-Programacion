package Practica5;

import PaqueteLectura.*;
public class EJ1 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Proyecto project1;
        Investigador inv1, inv2, inv3;
        //Subsidios sub1, sub2;
        
        project1 = new Proyecto(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarInt(10), GeneradorAleatorio.generarString(5));
        
        inv1 = new Investigador(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarInt(10), GeneradorAleatorio.generarString(5));
        
        inv2 = new Investigador(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarInt(10), GeneradorAleatorio.generarString(5));
    
        inv3 = new Investigador(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarInt(10), GeneradorAleatorio.generarString(5));
    
        //sub1 = new Subsidios(100.0, GeneradorAleatorio.generarString(5));
                
        //sub2 = new Subsidios(GeneradorAleatorio.generarDouble(1000), GeneradorAleatorio.generarString(5));
        
        project1.agregarInvestigador(inv1);
        project1.agregarInvestigador(inv2);
        project1.agregarInvestigador(inv3);
        
        int i;
        for(i=0; i<3; i++){
            project1.getInvest()[i].agregarSubsidio(100.0, GeneradorAleatorio.generarString(5));
            project1.getInvest()[i].agregarSubsidio(100.0, GeneradorAleatorio.generarString(5));
        }
        
        System.out.println(project1.toString());
    
    }
    
}
