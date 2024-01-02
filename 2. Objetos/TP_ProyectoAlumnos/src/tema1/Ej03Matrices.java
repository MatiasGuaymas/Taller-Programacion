/* 3- Escriba un programa que defina una matriz de enteros de tamaño 5x5. Inicialice
la matriz con números aleatorios entre 0 y 30.
Luego realice las siguientes operaciones:
- Mostrar el contenido de la matriz en consola.
- Calcular e informar la suma de los elementos de la fila 1
- Generar un vector de 5 posiciones donde cada posición j contiene la suma
de los elementos de la columna j de la matriz. Luego, imprima el vector.
- Lea un valor entero e indique si se encuentra o no en la matriz. En caso de
encontrarse indique su ubicación (fila y columna) en caso contrario
imprima “No se encontró el elemento”.
NOTA: Dispone de un esqueleto para este programa en Ej03Matrices.java */

package tema1;

//Paso 1. importar la funcionalidad para generar datos aleatorios
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class Ej03Matrices {

    public static void main(String[] args) {
	//Paso 2. iniciar el generador aleatorio     
	 GeneradorAleatorio.iniciar();
        //Paso 3. definir la matriz de enteros de 5x5 e iniciarla con nros. aleatorios 
        int dim = 5;
        int [][] matriz = new int [dim][dim];
        int i, j;
        for (i=0; i<5;i++)
            for(j=0; j <5; j++)
                matriz[i][j] = GeneradorAleatorio.generarInt(31);
        //Paso 4. mostrar el contenido de la matriz en consola
        for(i=0; i<5; i++) {
            System.out.println("-------------");
            for (j=0; j<5; j++)
                System.out.print(matriz[i][j] + " | ");
        }
        //Paso 5. calcular e informar la suma de los elementos de la fila 1
        int suma= 0;
        
        for (j=0; j< 5; j++) {
            suma+= matriz[1][j];
        }
        System.out.println("-------------");
        System.out.println(suma);
        
        
        //Paso 6. generar un vector de 5 posiciones donde cada posición j contiene la suma de los elementos de la columna j de la matriz. 
        //        Luego, imprima el vector.
        
        int[]vec = new int[dim];
        
        for(j=0; j < 5; j++){
            int suma2 = 0;
            for (i=0; i<5; i++)
                suma2 += matriz[i][j];
            vec[j] = suma2;
        }
        System.out.println("-------------");
        for(j=0; j<5; j++)
             System.out.print(vec[j] + " | ");

        //Paso 7. lea un valor entero e indique si se encuentra o no en la matriz. En caso de encontrarse indique su ubicación (fila y columna)
        //   y en caso contrario imprima "No se encontró el elemento".
        System.out.println("-------------");
        System.out.println("Ingrese un valor entero a buscar");
        int valor = Lector.leerInt();
        
        int a,b;
        a = 0;
        b = 0;
        boolean encontrado = false;
        
        while ((a < 5) && (!encontrado)){
            while((b < 5) && (matriz[a][b] != valor ))
                b++;
            if(b == 5){
                b = 0;
                a++;
            } else {
                encontrado = true;
            }
        }
        
        if(encontrado)
            System.out.println("Fila: "+ a + " Columna: "+ b);
        else
           System.out.println("No se encontro el elemento");
    }
}
