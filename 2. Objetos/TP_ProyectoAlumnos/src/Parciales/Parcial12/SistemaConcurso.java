/* https://cdn.discordapp.com/attachments/731327190914039852/1193307858687766599/image.png?ex=65ac3d8c&is=6599c88c&hm=fd0217b64390440832693da52e5d539af1d06474225b8ef47d9d2545f80069eb& */

package Parciales.Parcial12;
import PaqueteLectura.GeneradorAleatorio;
import PaqueteLectura.Lector;

public class SistemaConcurso {
    public static void main(String[] args){
        GeneradorAleatorio.iniciar();
        
        int cantCategorias = 3;
        int cantCanciones = 5;
        
        Concurso concurso = new Concurso(cantCategorias, cantCanciones);
        
        Cancion can1 = new Cancion("Caraluna", "Bacilos", 1);
        Cancion can2 = new Cancion("Giving Up", "Linkin Park", 2);
        Cancion can3 = new Cancion("Take me somewhere", "Drove", 3);
        Cancion can4 = new Cancion("Turning Page", "Sydney Rose", 4);
        Cancion can5 = new Cancion("Glimp of Us", "Joji", 5);
        
        concurso.agregarCancion(can1, 0);
        concurso.agregarCancion(can2, 1);
        concurso.agregarCancion(can3, 1);
        concurso.agregarCancion(can4, 2);
        concurso.agregarCancion(can5, 2);
        
        double puntaje;
        int id = GeneradorAleatorio.generarInt(6)+1;
        int cant = 0;
        while(id != 0 && cant != 20){
            //System.out.println("Ingrese Nombre, Apellido y DNI respectivamente:");
            Estudiante estudiante = new Estudiante(
                GeneradorAleatorio.generarString(7),//Lector.leerString(),
                GeneradorAleatorio.generarString(7),//Lector.leerString(),
                GeneradorAleatorio.generarInt(8)//Lector.leerInt()
            );
            puntaje = GeneradorAleatorio.generarDouble(10);
            concurso.interpretarCancion(id, estudiante, puntaje);
            id = GeneradorAleatorio.generarInt(6)+1;
            cant++;
        }
        
        System.out.println(concurso.toString());
        
        System.out.println("Ingrese id de canciones agregadas: 1, 2, 3, 4 o 5");
        id = Lector.leerInt();
        Estudiante ganador = concurso.obtenerGanador(id);
        if(ganador != null)
            System.out.println(ganador.toString());
        else
            System.out.println("Nadie");
        
        System.out.println("---------------------");
        for (int i = 0; i < cantCategorias; i++) {
            System.out.println(concurso.cancionMayorPuntaje(i).toString());
        }
        
        
        
    }
}
