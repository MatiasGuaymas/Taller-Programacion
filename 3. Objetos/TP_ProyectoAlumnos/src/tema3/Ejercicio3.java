package tema3;

import PaqueteLectura.*;

/**
 *
 * @author Pancho hizo este code, Mati miraba
 */
public class Ejercicio3 {
    
    public static void main(String[] args) {
        Estanteria estante1 = new Estanteria();
        GeneradorAleatorio.iniciar();
            
        int i;
        for(i=0;i<10;i++){
            Autor unAutor = new Autor();
            Libro libro = new Libro(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarString(4),GeneradorAleatorio.generarInt(4), unAutor ,GeneradorAleatorio.generarString(4),GeneradorAleatorio.generarDouble(6));
            if(i == 5){
                libro.setTitulo("mujercitas");
            estante1.agregarLibro(libro);
            }
        }
        estante1.devolverTitulo("mujercitas");
        System.out.println(estante1.devolverTitulo("mujercitas").getPrimerAutor().getNombre());
    }
    
}
