/* 4- Una escuela de música arma coros para participar de ciertos eventos. Los coros poseen
un nombre y están formados por un director y una serie de coristas. Del director se
conoce el nombre, DNI, edad y la antigüedad (un número entero). De los coristas se conoce
el nombre, DNI, edad y el tono fundamental (un número entero). Asimismo, hay dos tipos
de coros: coro semicircular en el que los coristas se colocan en el escenario uno al lado
del otro y coro por hileras donde los coristas se organizan en filas de igual dimensión.
a. Implemente las clases necesarias teniendo en cuenta que los coros deberían crearse
con un director y sin ningún corista, pero sí sabiendo las dimensiones del coro.
b. Implemente métodos (en las clases donde corresponda) que permitan:
 agregar un corista al coro.
o En el coro semicircular los coristas se deben ir agregando de izquierda
a derecha
o En el coro por hileras los coristas se deben ir agregando de izquierda a
derecha, completando la hilera antes de pasar a la siguiente.
 determinar si un coro está lleno o no. Devuelve true si el coro tiene a todos sus
coristas asignados o false en caso contrario.
 determinar si un coro (se supone que está lleno) está bien formado. Un coro
está bien formado si:
o En el caso del coro semicircular, de izquierda a derecha los coristas
están ordenados de mayor a menor en cuanto a tono fundamental.
o En el caso del coro por hileras, todos los miembros de una misma hilera
tienen el mismo tono fundamental y además todos los primeros
miembros de cada hilera están ordenados de mayor a menor en cuanto
a tono fundamental.
 devolver la representación de un coro formada por el nombre del coro, todos
los datos del director y todos los datos de todos los coristas.
c. Escriba un programa que instancie un coro de cada tipo. Lea o bien la cantidad de
coristas (en el caso del coro semicircular) o la cantidad de hileras e integrantes por
hilera (en el caso del coro por hileras). Luego cree la cantidad de coristas necesarios,
leyendo sus datos, y almacenándolos en el coro. Finalmente imprima toda la
información de los coros indicando si están bien formados o no. */

package Practica5;

import PaqueteLectura.*;
public class EJ4 {
    public static void main(String[] args) {
        
        Director direc1 = new Director("Matias", 555, 18,3);
        CoroSemicircular corosemic = new CoroSemicircular(direc1, 3, "CoroSemic");
        Corista corista1 = new Corista("Pepe", 333, 3);
        Corista corista2 = new Corista("Juan", 444, 2);
        Corista corista3 = new Corista("Rocio", 666, 1);
        corosemic.agregarCorista(corista1);
        corosemic.agregarCorista(corista2);
        corosemic.agregarCorista(corista3);
        System.out.println(corosemic.toString()); 
        System.out.println(corosemic.CoroLleno());
        System.out.println(corosemic.estaBienFormado());
        
        System.out.println("-------------------");
        
        Director direc2 = new Director("Lucio", 222, 21,2);
        CoroHileras corohil = new CoroHileras(direc2, 4, "CoroHileras", 2, 3);
        Corista corista4 = new Corista("Gonzalo", 542, 3);
        Corista corista5 = new Corista("Veronica", 324, 3);
        Corista corista6 = new Corista("Laura", 675, 3);
        Corista corista7 = new Corista("Eduardo", 338, 1);
        Corista corista8 = new Corista("Victoria", 427, 1);
        Corista corista9 = new Corista("Cecilia", 926, 1);
        corohil.agregarCorista(corista4);
        corohil.agregarCorista(corista5);
        corohil.agregarCorista(corista6);
        corohil.agregarCorista(corista7);
        corohil.agregarCorista(corista8);
        corohil.agregarCorista(corista9);
        System.out.println(corohil.toString());
        System.out.println(corohil.estaLleno());
        System.out.println(corohil.estaBienFormado());
        
    }
    
}