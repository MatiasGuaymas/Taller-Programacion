//Representar alumnos de una facultad. De cualquier alumno se conoce: DNI, nombre y sus materias aprobadas (como
//máximo N). De las materias aprobadas se registra: nombre, nota y fecha. Además de los alumnos de grado se tiene la
//carrera, mientras que de los alumnos de doctorado el título universitario y universidad de origen.
//1- Genere las clases necesarias. Provea constructores para iniciar las materias aprobadas y los alumnos a partir de la
//información necesaria (estos para un máximo de N materias aprobadas y sin materias aprobadas inicialmente).
//2- Implemente los métodos necesarios, en las clases que corresponda, para:
//a) Dada una materia aprobada, agregarla a las materias aprobadas del alumno.
//b) Determinar si el alumno está graduado, teniendo en cuenta que para ello deben tener un total de N materias
//aprobadas y deben tener aprobada la materia “Tesis”.
//c) Obtener un String que represente al alumno siguiendo el ejemplo:
//Ej. alumnos de grado “DNI; Nombre; Materias aprobadas: nombre, nota y fecha de c/u; Está graduado: ...; Carrera”
//Ej. alumnos de doctorado “DNI; Nombre; Materias aprobadas: nombre, nota y fecha de c/u; Está graduado: ...; Título;
//Universidad de Origen”
//3- Realice un programa que instancie un alumno de cada tipo. Cargue información de materias aprobadas a cada
//uno. Informe en consola el resultado del inciso c).

package Parciales.Parcial1;

import PaqueteLectura.*;
public class Parcial1Alumos {
    
    public static void main(String[] args) {
        AlumnoDeGrado alu1;
        AlumnoDoctorado alu2;
        Materia mat;
        
        alu1 = new AlumnoDeGrado("Diplomatura en Esports", 777,"Estanislao Andres", 37);
        alu2 = new AlumnoDoctorado("Tecnico Analista en casos de violencia Pediatricas", "Universidad del este", 657,"Matias Julian Guaymas", 20);
        
        
        /*while(matigay != 5){
            mat = new Materia(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarDouble(10), GeneradorAleatorio.generarInt(24));
            matigay = GeneradorAleatorio.generarInt(6);
            alu1.agregarMateria(mat);
        }
        
        int matigay2 = 0;
        while(matigay2 != 5){
            mat = new Materia(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarDouble(10), GeneradorAleatorio.generarInt(24));
            matigay2 = GeneradorAleatorio.generarInt(6);
            alu2.agregarMateria(mat);
        }*/
        
        int i;
        for(i=0;i<alu1.getCantMax();i++){
            mat = new Materia(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarDouble(10), GeneradorAleatorio.generarInt(24));
            if(i==5){
                mat.setNombre("Tesis");
            }
            alu1.agregarMateria(mat);
        }
        
         for(i=0;i<alu1.getCantMax();i++){
            mat = new Materia(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarDouble(10), GeneradorAleatorio.generarInt(24));
            if(i==5){
                mat.setNombre("Tesis");
            }
            alu2.agregarMateria(mat);
        }
        
        
        
        System.out.println(alu1.toString());
        System.out.println(alu2.toString());

    }
    
}
