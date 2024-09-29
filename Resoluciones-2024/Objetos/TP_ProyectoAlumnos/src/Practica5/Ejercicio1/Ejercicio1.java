/* 1- La UNLP desea administrar sus proyectos, investigadores y subsidios. Un proyecto tiene:
nombre, código, nombre completo del director y los investigadores que participan en el
proyecto (50 como máximo). De cada investigador se tiene: nombre completo, categoría (1
a 5) y especialidad. Además, cualquier investigador puede pedir hasta un máximo de 5
subsidios. De cada subsidio se conoce: el monto pedido, el motivo y si fue otorgado o no.
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

package Practica5.Ejercicio1;

public class Ejercicio1 {

    public static void main(String[] args) {
        Proyecto p = new Proyecto("ARCOR", 111, "MatiasGuaymas");
        Investigador i1 = new Investigador("Leonardo", 1, "Dulces");
        Investigador i2 = new Investigador("Dolores", 2, "Dulces");
        Investigador i3 = new Investigador("Juan", 2, "Dulces");
        p.agregarInvestigador(i1);
        p.agregarInvestigador(i2);
        p.agregarInvestigador(i3);
        i1.agregarSubsidio(new Subsidio(1000, "Dolor"));
        i1.agregarSubsidio(new Subsidio(2000, "Lastimaduras"));
        i2.agregarSubsidio(new Subsidio(1000, "Dolor"));
        i2.agregarSubsidio(new Subsidio(2000, "Lastimaduras"));
        i3.agregarSubsidio(new Subsidio(1000, "Dolor"));
        i3.agregarSubsidio(new Subsidio(2000, "Lastimaduras"));
        p.otorgarTodos("Leonardo");
        System.out.println(p.toString());
    }
    
}
