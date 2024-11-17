package Parciales.Parcial13;

import PaqueteLectura.*;

public class Parcial13 {
    public static void main(String[] args) {
        Estacion est = new Estacion("La Plata", 500.0, 5);
        est.generarVenta(1, 1, 2, "Credito");
        est.generarVenta(1, 2, 4, "Debito");
        est.generarVenta(2, 3, 6, "Credito");
        est.generarVenta(3, 4, 8, "Credito");
        est.generarVenta(3, 5, 10, "Efectivo");
        est.generarVenta(4, 6, 12, "Debito");
        est.generarVenta(5, 7, 14, "Credito");
        est.generarVenta(6, 8, 16, "Efectivo");
        
        System.out.println(est.toString());
        
        System.out.println("-----------");
        System.out.println(est.ventaMax().toString());
        System.out.println("-----------");
        
        est.servicio(7);
        System.out.println(est.toString());
        
    }
    
}
