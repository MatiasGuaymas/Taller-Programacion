package Parciales.Parcial15;

import PaqueteLectura.GeneradorAleatorio;

public class Parcial15 {
    public static void main(String[] args) {
        Estacionamiento est = new Estacionamiento("La Plata", 200.0, 3, 5);
        
        Vehiculo vec1 = new Vehiculo(GeneradorAleatorio.generarInt(30)+100, GeneradorAleatorio.generarInt(5)+3, "Exclusive", "Fiat");
        Vehiculo vec2 = new Vehiculo(GeneradorAleatorio.generarInt(30)+100, GeneradorAleatorio.generarInt(5)+3, GeneradorAleatorio.generarString(4), "Renault");
        Vehiculo vec3 = new Vehiculo(GeneradorAleatorio.generarInt(30)+100, GeneradorAleatorio.generarInt(5)+3, "Exclusive", "Fiat");
        Vehiculo vec4 = new Vehiculo(GeneradorAleatorio.generarInt(30)+100, GeneradorAleatorio.generarInt(5)+3, GeneradorAleatorio.generarString(4), "China");
        Vehiculo vec5 = new Vehiculo(GeneradorAleatorio.generarInt(30)+100, GeneradorAleatorio.generarInt(5)+3, "Not Exclusive", "Fiat");
        Vehiculo vec6 = new Vehiculo(GeneradorAleatorio.generarInt(30)+100, GeneradorAleatorio.generarInt(5)+3, GeneradorAleatorio.generarString(4), "Pep");  
        
        est.agregarVehiculo(vec1, 1, 1); 
        est.agregarVehiculo(vec2, 1, 3); 
        est.agregarVehiculo(vec3, 1, 4); 
        est.agregarVehiculo(vec4, 2, 2);
        est.agregarVehiculo(vec5, 3, 4);
        est.agregarVehiculo(vec6, 3, 5);
        
        System.out.println(est.toString());
        System.out.println(est.liberarMarca("Exclusive", 1));
        System.out.println();
        System.out.println(est.toString());
        System.out.println("El sector que mas recaudo es el " + est.sectorMax());
    }
    
}
