
package tema1;

//Paso 1: Importar la funcionalidad para lectura de datos
import PaqueteLectura.Lector;

public class Ej02Jugadores {

  
    public static void main(String[] args) {
        int DIMF= 5;
        //Paso 2: Declarar la variable vector de double 
        double[] jugadores;
        //Paso 3: Crear el vector para 15 double 
        jugadores = new double[DIMF];
        //Paso 4: Declarar indice y variables auxiliares a usar
        int i;
         double suma = 0;
        //Paso 6: Ingresar 15 numeros (altura), cargarlos en el vector, ir calculando la suma de alturas
        for(i=0; i<= 4; i++){
            System.out.print("Ingrese una altura: ");
            jugadores[i] = Lector.leerDouble();
            suma += jugadores [i];
        }
        
        //Paso 7: Calcular el promedio de alturas, informarlo
        suma=(suma/DIMF);
         System.out.println("El promedio de las alturas de los jugadores es de: " + suma);
        //Paso 8: Recorrer el vector calculando lo pedido (cant. alturas que están por encima del promedio)
        int cant= 0;
        for(i=0; i<= 4; i++) 
            if(jugadores[i] > suma)
                cant++;
        //Paso 9: Informar la cantidad.
        System.out.println("La cantidad de jugadores que superan el promedio es de: " + cant);
    }
    
}
