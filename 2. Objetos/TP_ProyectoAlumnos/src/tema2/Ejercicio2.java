/* 2- Utilizando la clase Persona. Realice un programa que almacene en un vector a lo sumo
15 personas. La información (nombre, DNI, edad) se debe generar aleatoriamente hasta
obtener edad 0. Luego de almacenar la información:
 - Informe la cantidad de personas mayores de 65 años.
 - Muestre la representación de la persona con menor DNI. */

package tema2;
import PaqueteLectura.*;

public class Ejercicio2 {
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        int DF=15;  
        Persona [] vecPersona = new Persona[DF];
        int edad = GeneradorAleatorio.generarInt(100);
        int diml = 0;
        while(edad != 0 && diml < 15) {
            String nombre = GeneradorAleatorio.generarString(5);
            int dni = GeneradorAleatorio.generarInt(40);
            vecPersona[diml] = new Persona(nombre, dni, edad);
            System.out.println(vecPersona[diml].toString());
            diml++;
            edad = GeneradorAleatorio.generarInt(100);
        }
        int contador = 0;
        int min = 999;
        Persona menor = null;
        for (int i = 0; i < diml; i ++) {
            if(vecPersona[i].getEdad() > 65)
                contador++;
            if(vecPersona[i].getDNI() < min) {
                min = vecPersona[i].getDNI();
                menor = vecPersona[i];
        }}
        System.out.println("CANT PERSONAS MAYORES DE 65 ANIOS: " + contador);
        System.out.println(menor.toString());
    }
}
