package Practica5;

import PaqueteLectura.*;
public class EJ3 {

    public static void main(String[] args) {
        EventoOcacional ev1;
        Gira gira1;
        Fecha f;
        
        f = new Fecha("La Plata" , 31);
        ev1 = new EventoOcacional("TV", "EL EVENTO DE PLAYBOI PANCHI", 12, "NEVER LACKING ALWAYS PACKING", 10, 15);
        
        gira1 = new Gira("LA GIRA PLAYBOI", "GORDO VOLVE", 10, 15, 20, 20);
        ev1.agregarTema("FEELS");
        gira1.agregarFecha(f);
        gira1.agregarTema("FEELS");
        gira1.agregarTema("VVS");
        gira1.agregarTema("FR FR");
        System.out.println(ev1.CalcularCosto());
        System.out.println(ev1.Actuar());
        System.out.println(gira1.CalcularCosto());
        System.out.println(gira1.Actuar());
        
        
    }
    
}
