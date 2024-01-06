/* https://cdn.discordapp.com/attachments/963569430112129025/1160602359517434056/Parcial_2022_Turno_D_1.jpg?ex=6535422d&is=6522cd2d&hm=c726ab9cbcff23be1a61b4fbc7112e47b7dab5767d517ff45010d9734b05b7df&
ESE ES LINK CON LA FOTO DEL PARCIAL */

package Parciales.Parcial8;

import PaqueteLectura.*;

public class Parcial8 {

    public static void main(String[] args) {
       CursoADistancia c1;
       CursoPresencial c2;
       Alumno2 a, a2;
       
       c1 = new CursoADistancia("399084", 2023, 25);
       c2 = new CursoPresencial(5, 2023, 20);
       
       int aux = 0;
       
       while(aux != 10){
           a = new Alumno2(aux, GeneradorAleatorio.generarString(6));
           a2 = new Alumno2(aux, GeneradorAleatorio.generarString(6));
           aux++;
           c1.agregarAlumno(a);
           c2.agregarAlumno(a2);
       }
       
       int i,j;
       for(i=0;i<10;i++){
           for(j=0;j<3;j++){
               if(i!=3){ //O sea el alumno 3 no va a aprobar, 9 aprobados en total.
                c1.aproboPrueba(i);
                c2.aproboPrueba(i);
                c1.incAsistenciaDni(i);
                c2.incAsistenciaDni(i);
                }
       }
    }
       System.out.println("La cantidad de alumnos que pueden rendir en el curso a distancia es de: " + c1.cantAlumnosRendir() + " alumnos");
       System.out.println("La cantidad de alumnos que pueden rendir en el curso presencial es de: " + c2.cantAlumnosRendir() + " alumnos");
}
}
