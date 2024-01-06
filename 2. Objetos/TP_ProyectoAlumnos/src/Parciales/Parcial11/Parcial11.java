/* Representar Salas de PCs. Una Sala de PC tiene espacios (numerados de 1 a N) para N PCs. De las PCs
se conoce: estado (que indica si está encendida o apagada) y su consumo por hora.
a) Genere las clases necesarias. Provea constructores para iniciar: las PCs en apagado y a partir de un
consumo por hora; la sala con espacio para N PCs (N se recibe; inicialmente los espacios están vacíos).
b) Implemente los métodos necesarios, en las clases adecuadas, para permitir:
i- Dado un nro. de espacio válido y una PC, incluir la PC en ese espacio de la sala.
ii- Encender la PC apagada con menor consumo por hora.
iii- Obtener un string con los números de espacio que ocupan las PCs encendidas
c) Realice un programa que instancie una sala de PC con espacio para 5 PCs. Incluya 3 PCs a la sala, en
distintos espacios. Encienda las 2 PCs de la sala que menos consumen por hora. Imprimir el valor obtenido
del inciso iii). */

package Parciales.Parcial11;

import PaqueteLectura.*;

public class Parcial11 {

    public static void main(String[] args) {
       GeneradorAleatorio.iniciar();
       Sala s1;
       PC pc1, pc2, pc3;
       
       s1 = new Sala(5);
       pc1 = new PC(GeneradorAleatorio.generarDouble(60));
       pc2 = new PC(GeneradorAleatorio.generarDouble(60));
       pc3 = new PC(GeneradorAleatorio.generarDouble(60));
       s1.agregarPC(1, pc1);
       s1.agregarPC(3, pc2);
       s1.agregarPC(5, pc3);
       
       System.out.println(s1.concatenador());
       
       s1.encenderPc();
       s1.encenderPc();
       
       System.out.println("---------------");
       
       System.out.println(s1.concatenador());
       
    }
    
}