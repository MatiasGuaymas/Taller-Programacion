/* 5- Se dispone de la clase Partido (en la carpeta tema2). Un objeto partido representa un
encuentro entre dos equipos (local y visitante). Un objeto partido puede crearse sin
valores iniciales o enviando en el mensaje de creación el nombre del equipo local, el
nombre del visitante, la cantidad de goles del local y del visitante (en ese orden). Un objeto
partido sabe responder a los siguientes mensajes:

getLocal() retorna el nombre (String) del equipo local
getVisitante() retorna el nombre (String) del equipo visitante
getGolesLocal() retorna la cantidad de goles (int) del equipo local
getGolesVisitante() retorna la cantidad de goles (int) del equipo visitante
setLocal(X) modifica el nombre del equipo local al “String” X
setVisitante(X) modifica el nombre del equipo visitante al “String” X
setGolesLocal(X) modifica la cantidad de goles del equipo local al “int” X
setGolesVisitante(X) modifica la cantidad de goles del equipo visitante al “int” X
hayGanador() retorna un boolean que indica si hubo (true) o no hubo (false) ganador
getGanador() retorna el nombre (String) del ganador del partido (si no hubo retorna
un String vacío).
hayEmpate() retorna un boolean que indica si hubo (true) o no hubo (false) empate

Implemente un programa que cargue un vector con a lo sumo 20 partidos disputados en
el campeonato. La información de cada partido se lee desde teclado hasta ingresar uno con
nombre de visitante “ZZZ” o alcanzar los 20 partidos. Luego de la carga:
- Para cada partido, armar e informar una representación String del estilo:
{EQUIPO-LOCAL golesLocal VS EQUIPO-VISITANTE golesVisitante }
- Calcular e informar la cantidad de partidos que ganó River.
- Calcular e informar el total de goles que realizó Boca jugando de local. */

import PaqueteLectura.*;

public class Ejercicio5 {
    public static void main(String[] args) {
       GeneradorAleatorio.iniciar();
       Partido vec [] = new Partido [20];
       
       int diml = 0;
       String nomV = GeneradorAleatorio.generarString(3);
       
       while((!nomV.equals("ZZZ")&&(diml < 3))){
           //nomL = GeneradorAleatorio.generarString(5);
           vec[diml++] = new Partido(Lector.leerString(), nomV , GeneradorAleatorio.generarInt(7), GeneradorAleatorio.generarInt(7));
           nomV = GeneradorAleatorio.generarString(3);
       }
       
       int cant = 0, cantGoles = 0;
       
       for(int j=0; j < diml; j++){
           System.out.println(vec[j]);
           if(vec[j].getGanador().equals("River"))
               cant++;
           if(vec[j].getLocal().equals("Boca"))
               cantGoles += vec[j].getGolesLocal();
       }
    
       System.out.println("River gano: " + cant + " partidos y Boca metio: " + cantGoles + " goles de Local");
    }
    
}