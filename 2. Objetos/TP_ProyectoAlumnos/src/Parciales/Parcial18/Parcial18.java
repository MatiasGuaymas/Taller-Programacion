package Parciales.Parcial18;

import PaqueteLectura.GeneradorAleatorio;

public class Parcial18 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Estacion est = new Estacion("La Plata");
        Surtidor surt1 = new Surtidor("Super", 300.0, 500);
        Surtidor surt2 = new Surtidor("Ultra Diesel", 200.0, 400);
        
        est.agregarSurtidor(surt1);
        est.agregarSurtidor(surt2);
        
        est.generarVenta(1, GeneradorAleatorio.generarInt(30)+1, GeneradorAleatorio.generarInt(50)+100, "Debito");
        est.generarVenta(1, GeneradorAleatorio.generarInt(30)+1, GeneradorAleatorio.generarInt(50)+100, "Credito");
        est.generarVenta(2, GeneradorAleatorio.generarInt(30)+1, GeneradorAleatorio.generarInt(50)+100, "Debito");
        est.generarVenta(2, GeneradorAleatorio.generarInt(30)+1, GeneradorAleatorio.generarInt(50)+100, "Efectivo");
        est.generarVenta(2, GeneradorAleatorio.generarInt(30)+1, GeneradorAleatorio.generarInt(50)+100, "Debito");
        
        System.out.println(est.toString());
        System.out.println("El numero del surtidor que recaudo el mayor monto total es: " + est.mayorRecaudado());
    }
    
}
