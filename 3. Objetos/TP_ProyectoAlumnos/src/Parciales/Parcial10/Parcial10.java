//Representar fechas de parcial tomadas por una cátedra. Una fecha de parcial guarda información de las N
//salas en las que se distribuyeron los alumnos. Cada sala almacena información de los alumnos que rindieron
//en ella (como máximo M). De los alumnos registra: nombre, DNI y nro. de tema asignado.
//1- Genere las clases necesarias. Provea constructores para iniciar: las fechas de parcial para N salas y un
//máximo de M alumnos por sala (inicialmente sin alumnos); los alumnos a partir de DNI y nombre (inicialmente
//con nro. de tema indefinido -1).
//2- Implemente los métodos necesarios, en las clases que corresponda, para:
//a. Agregar un alumno a la sala X de la fecha. Asuma que X es válido y que hay lugar para el alumno.
//b. Asignar un tema a todos los alumnos de la fecha, de la siguiente manera: a los alumnos de una misma
//sala se le asignan temas al azar (entre 1 y M).
//c. Obtener un String con la información de los alumnos (nombre, DNI) que rinden el tema T.
//3- Realice un programa que instancie una fecha de parcial para 2 salas y 4 alumnos por sala. Agregue
//alumnos a la fecha, asigne temas a todos los alumnos y luego muestre la información obtenida del inciso c.

package Parciales.Parcial10;

import PaqueteLectura.*;
public class Parcial10 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        FechaParcial fp1;
        Estudiante e;
        
        fp1 = new FechaParcial(2, 4);
        
        int i, j;
        for(i=0;i<2;i++){
            for(j=0;j<4;j++){
                e = new Estudiante(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarInt(20));
                fp1.agregarEstudiante(e, i);
            }
        }
        
        fp1.temas(1);
        System.out.println(fp1.concatenador(1));
    }
}