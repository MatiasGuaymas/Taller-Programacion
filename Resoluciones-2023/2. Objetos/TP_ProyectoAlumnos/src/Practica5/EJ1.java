/* 1- La UNLP desea administrar sus proyectos, investigadores y subsidios. Un proyecto
tiene: nombre, código, nombre completo del director y los investigadores que participan
en el proyecto (50 como máximo). De cada investigador se tiene: nombre completo,
categoría (1 a 5) y especialidad. Además, cualquier investigador puede pedir hasta un
máximo de 5 subsidios. De cada subsidio se conoce: el monto pedido, el motivo y si fue
otorgado o no.
i) Implemente el modelo de clases teniendo en cuenta:
a. Un proyecto sólo debería poder construirse con el nombre, código, nombre del
director.
b. Un investigador sólo debería poder construirse con nombre, categoría y
especialidad.
c. Un subsidio sólo debería poder construirse con el monto pedido y el motivo.
Un subsidio siempre se crea en estado no-otorgado.
ii) Implemente los métodos necesarios (en las clases donde corresponda) que permitan:
a. void agregarInvestigador(Investigador unInvestigador);
// agregar un investigador al proyecto.
b. void agregarSubsidio(Subsidio unSubsidio);
// agregar un subsidio al investigador.
c. double dineroTotalOtorgado();
//devolver el monto total otorgado en subsidios del proyecto (tener en cuenta
todos los subsidios otorgados de todos los investigadores)
d. void otorgarTodos(String nombre_completo);
//otorgar todos los subsidios no-otorgados del investigador llamado
nombre_completo
e. String toString();
// devolver un string con: nombre del proyecto, código, nombre del director, el
total de dinero otorgado del proyecto y la siguiente información de cada
investigador: nombre, categoría, especialidad, y el total de dinero de sus
subsidios otorgados.
iii) Escriba un programa que instancie un proyecto con tres investigadores. Agregue dos
subsidios a cada investigador y otorgue los subsidios de uno de ellos. Luego imprima
todos los datos del proyecto en pantalla. */

package Practica5;

import PaqueteLectura.*;
public class EJ1 {

    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        Proyecto project1;
        Investigador inv1, inv2, inv3;
        Subsidios sub1, sub2;
        
        project1 = new Proyecto(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarInt(10), GeneradorAleatorio.generarString(5));
        
        inv1 = new Investigador("Pepe", GeneradorAleatorio.generarInt(5)+1, GeneradorAleatorio.generarString(5));
        
        inv2 = new Investigador(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarInt(5)+1, GeneradorAleatorio.generarString(5));
    
        inv3 = new Investigador(GeneradorAleatorio.generarString(5), GeneradorAleatorio.generarInt(5)+1, GeneradorAleatorio.generarString(5));
        
        project1.agregarInvestigador(inv1);
        project1.agregarInvestigador(inv2);
        project1.agregarInvestigador(inv3);
        
        int i;
        for(i=0; i<3; i++){
            sub1 = new Subsidios(100.0, GeneradorAleatorio.generarString(5));       
            sub2 = new Subsidios(GeneradorAleatorio.generarDouble(1000), GeneradorAleatorio.generarString(5));
            project1.getInvest()[i].agregarSubsidio(sub1);
            project1.getInvest()[i].agregarSubsidio(sub2);
        }
        
        System.out.println(project1.getInvest()[0].getCantSub());
        //System.out.println(project1.getInvest()[1].getCantSub());
        //System.out.println(project1.getInvest()[2].getCantSub());
        project1.otorgarTodos("Pepe");
        System.out.println(project1.getInvest()[0].getCantSub());
        System.out.println(project1.toString());
    
    }
    
}
