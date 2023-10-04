package tema4v2;

/**
 *
 * @author Matute
 */

import PaqueteLectura.*;

public class Ej6 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Estacion2 est1 = new Estacion2("La Plata", 34.921, -57.955);
        Estacion2 est2 = new Estacion2("Villa Carlos Paz", 20.401, -57.500);
        
        SistAnual sistAnual = new SistAnual(2021, 7, est1);
        SistMensual sistMensual = new SistMensual(2020, 5, est2);
        
       System.out.println(sistAnual);
       System.out.println(sistAnual.mayorTemp());
       
       System.out.println(sistMensual);
       System.out.println(sistMensual.mayorTemp());
    }
    
}
