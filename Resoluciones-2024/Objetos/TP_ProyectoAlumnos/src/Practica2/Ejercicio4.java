/* 4- Sobre un nuevo programa, modifique el ejercicio anterior para considerar que:
a) Durante el proceso de inscripción se pida a cada persona sus datos (nombre, DNI, edad)
y el día en que se quiere presentar al casting. La persona debe ser inscripta en ese día, en el
siguiente turno disponible. En caso de no existir un turno en ese día, informe la situación.
La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los 40 cupos
de casting.
Una vez finalizada la inscripción:
b) Informar para cada día: la cantidad de inscriptos al casting ese día y el nombre de la
persona a entrevistar en cada turno asignado. */

import PaqueteLectura.*;

public class Ejercicio4 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dia = 5;
        int entrevistas = 8;
        int entrevistados = 0;
        
        Persona [][] entrevistado = new Persona[dia][entrevistas];
        int [] vecDiml = new int[dia];
        
        int i;
        for (i = 0; i < dia; i++) {
            vecDiml[i] = 0;
        }
        
        String nom = GeneradorAleatorio.generarString(3);
        
        while(!nom.equals("ZZZ")&&(entrevistados < (dia * entrevistas))) {
            System.out.println("Ingrese dia para anotarse: ");
            int diaSelec = Lector.leerInt();
            if(vecDiml[diaSelec] < entrevistas) {
                entrevistado[diaSelec][vecDiml[diaSelec]++] = new Persona(nom, GeneradorAleatorio.generarInt(30), GeneradorAleatorio.generarInt(100));
                entrevistados++;
            } else
                System.out.println("No hay mas turnos disponibles para el dia " + diaSelec);
            nom = GeneradorAleatorio.generarString(3);
        }
        
        for(int a = 0; a < dia; a++) {
            for(int b = 0; b < vecDiml[a]; b++) {
                System.out.println("Dia " + a + " entrevista " + b + " es de la persona: " + entrevistado[a][b].getNombre());
            }
            System.out.println("Para el dia " + a + " hubo " + vecDiml[a] + " inscriptos al casting");
        }
    }
}