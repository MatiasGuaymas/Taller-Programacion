// Representar Salas de PCs. Una Sala de PC tiene espacios (numerados de 1 a N) para N PCs. De las PCs
// se conoce: estado (que indica si está encendida o apagada) y su consumo por hora.
// a) Genere las clases necesarias. Provea constructores para iniciar: las PCs en apagado y a partir de un
// consumo por hora; la sala con espacio para N PCs (N se recibe; inicialmente los espacios están vacíos).
// b) Implemente los métodos necesarios, en las clases adecuadas, para permitir:
// i- Dado un nro. de espacio válido y una PC, incluir la PC en ese espacio de la sala.
// ii- Encender la PC apagada con menor consumo por hora.
// iii- Obtener un string con los números de espacio que ocupan las PCs encendidas
// c) Realice un programa que instancie una sala de PC con espacio para 5 PCs. Incluya 3 PCs a la sala, en
// distintos espacios. Encienda las 2 PCs de la sala que menos consumen por hora. Imprimir el valor obtenido
// del inciso iii).

package Parciales.Parcial11;

import PaqueteLectura.*;

public class Parcial11 {

    public static void main(String[] args) {
       Sala s1;
       PC pc1;
       GeneradorAleatorio.iniciar();
       s1 = new Sala(5);
       int i, j;
       for(i=1;i<6;i++){
           for(j=1;j<4;j++){
               pc1 = new PC(GeneradorAleatorio.generarDouble(400));
               s1.agregarPC(i, j, pc1);
           }
       }
       
       s1.encenderPc();
       s1.encenderPc();
       
       System.out.println(s1.concatenador());
       
//El motivo por el que siempre obtienes los mismos valores al llamar a s1.concatenador()
//se debe al funcionamiento de tu método encenderPc(). En este método, estás
//recorriendo la matriz de PCs y encendiendo la PC con el menor consumo en cada iteración. 
//Sin embargo, si hay varias PCs con el mismo consumo mínimo, solo se encenderá la primera 
//que encuentre, lo que puede llevar a resultados consistentes en la misma ubicación.
    }
    
}