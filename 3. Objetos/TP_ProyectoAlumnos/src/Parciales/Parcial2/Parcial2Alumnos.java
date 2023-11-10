//Una escuela de música necesita un sistema para realizar un concurso entre sus alumnos. El concurso está
//dividido en cinco géneros musicales y en cada género se pueden inscribir hasta N alumnos como máximo. De
//cada alumno registra su nombre, edad, el instrumento que toca y puntaje obtenido.
//1- Genere las clases necesarias. Implemente constructores para iniciar el concurso sin alumnos inscriptos,
//recibiendo N (el máximo de alumnos por género musical). Los alumnos deben instanciarse dando valor a todos
//sus atributos y con puntaje -1.
//2- Implemente métodos en las clases que corresponda para permitir:
//a. Dado un alumno y un género musical válido, inscriba al alumno en dicho género. Asuma que hay lugar.
//b. Dado un puntaje y un nombre de alumno, asigne el puntaje a dicho alumno. NOTA: El alumno podría no
//estar inscripto en el concurso.
//c. Devolver el género musical con más alumnos inscriptos.
//3- Realice un programa que instancie un concurso con un máximo de 20 alumnos por género. Instancie 5
//alumnos e inscriba a cada uno en algún género musical. Asigne puntaje a cada uno. Imprima el resultado de la
//consulta pedida.

package Parciales.Parcial2;

import PaqueteLectura.*;
public class Parcial2Alumnos {

    public static void main(String[] args) {
        Concurso con;
        Concursante alu;
        GeneradorAleatorio.iniciar();
        
        con = new Concurso(20);
        
        int i = 0;
        for(i=0; i<19; i++){
            alu = new Concursante(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarInt(20), GeneradorAleatorio.generarString(10));
            con.agregarConcursante(alu, GeneradorAleatorio.generarInt(5));
        }
        System.out.println(con.toString());
    }
}
