/* 3- Se realizará un casting para un programa de TV. El casting durará a lo sumo 5 días y en
cada día se entrevistarán a 8 personas en distinto turno.
a) Simular el proceso de inscripción de personas al casting. A cada persona se le pide
nombre, DNI y edad y se la debe asignar en un día y turno de la siguiente manera: las
personas primero completan el primer día en turnos sucesivos, luego el segundo día y así
siguiendo. La inscripción finaliza al llegar una persona con nombre “ZZZ” o al cubrirse los
40 cupos de casting.
Una vez finalizada la inscripción:
b) Informar para cada día y turno asignado, el nombre de la persona a entrevistar.
NOTA: utilizar la clase Persona. Pensar en la estructura de datos a utilizar. Para comparar
Strings use el método equals. */

import PaqueteLectura.*;

public class Ejercicio3 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int dia = 5;
        int entrevistas = 8;
        int entrevistados = 0;
        int aux = 0;
        
        Persona [][] entrevistado = new Persona[dia][entrevistas];
        int [] vecDiml = new int[dia];
        
        int i;
        for (i = 0; i < dia; i++) {
            vecDiml[i] = 0;
        }
        
        String nom = GeneradorAleatorio.generarString(3);
        
        while(!nom.equals("ZZZ")&&(entrevistados < (dia * entrevistas))) {
            entrevistado[aux][vecDiml[aux]++] = new Persona(nom, GeneradorAleatorio.generarInt(30), GeneradorAleatorio.generarInt(100));
            if(vecDiml[aux] == entrevistas && aux < (dia-1)) 
                aux++; // Paso a otro dia
            nom = GeneradorAleatorio.generarString(3);
            entrevistados++;
        }
        
        for(int a = 0; a <= aux; a++) {
            for(int b = 0; b < vecDiml[a]; b++) {
                System.out.println("Dia " + a + " entrevista " + b + " es de la persona: " + entrevistado[a][b].getNombre());
            }
        }
    }
}