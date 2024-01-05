/* 1. Representar un concurso de baile. El concurso tiene a lo sumo N parejas. Cada pareja tiene 2
participantes y un estilo de baile. De los participantes se tiene dni, nombre, edad.
a) Genere las clases necesarias. Provea constructores para iniciar: el concurso para un máximo de N
parejas (inicialmente sin parejas cargadas); las parejas y los participantes a partir de toda su información.
b) Implemente métodos en las clases adecuadas para permitir:
- Agregar una pareja al concurso. Asuma que hay lugar.
- Obtener la diferencia de edad de la pareja.
- Obtener la pareja con más diferencia de edad del concurso-
2. Realice un programa que instancie un concurso, cargue 2 parejas y a partir del concurso muestre: los
nombres de los participantes de la pareja con más diferencia de edad. */

package Parciales.Parcial4;

import PaqueteLectura.GeneradorAleatorio;

public class Programa {

    public static void main(String[] args) {
        Concurso con=new Concurso(10);
        GeneradorAleatorio.iniciar();
        
        Participante part1 = new Participante(111, "Matias", 18);
        Participante part2 = new Participante(222, "Victoria", 20);
        Participante part3 = new Participante(333, "Pepe", 30);
        Participante part4 = new Participante(444, "Rosina", 22);
        Parejas par1 = new Parejas(part1, part2, "Tango");
        Parejas par2 = new Parejas(part3, part4, "Hip");
        
        con.agregarPareja(par1);
        con.agregarPareja(par2);
        
        System.out.println(con.toString());
    }
    
}
