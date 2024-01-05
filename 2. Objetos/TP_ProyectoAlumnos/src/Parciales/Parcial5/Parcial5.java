/* Un psicólogo necesita un sistema para organizar su agenda semanal. El sistema mantiene para c/u de los 5 días
de atención y c/u de los 6 turnos (horarios) del día, la información del paciente que tomó el turno. De los
pacientes guarda: nombre, si tiene obra social y costo a abonar por la sesión.
a) Genere las clases necesarias. Implemente constructores para iniciar: el sistema sin pacientes; los pacientes
a partir de toda su información.
b) Lea atentamente y luego implemente métodos que permitan:
- Agendar al paciente P en un día D y turno T. Asuma que el turno está libre. D y T son válidos.
- Dado un día D, liberar los turnos de todos los pacientes agendados en ese día (los 6 turnos). Retornar un
string con los nombres de los pacientes para avisar de la cancelación. Asuma que D es válido.
- Calcular y devolver el costo total que recaudará el psicólogo en la atención semanal.
c) Realice un programa que instancie el sistema. Cargue varios pacientes al sistema. Libere turnos agendados.
Para finalizar, imprima el resultado del inciso b.iii. */

package Parciales.Parcial5;

import PaqueteLectura.*;

public class Parcial5 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Sistema sist = new Sistema();
       
        Paciente pac1 = new Paciente("Jorge", GeneradorAleatorio.generarBoolean(), 100.0);
        Paciente pac2 = new Paciente("Pedro", GeneradorAleatorio.generarBoolean(), 200.0);
        Paciente pac3 = new Paciente("Juan", GeneradorAleatorio.generarBoolean(), 300.0);
        Paciente pac4 = new Paciente(GeneradorAleatorio.generarString(4), GeneradorAleatorio.generarBoolean(), 200.0);
        Paciente pac5 = new Paciente(GeneradorAleatorio.generarString(4), GeneradorAleatorio.generarBoolean(), 100.0);
        
        sist.agregarPaciente(pac1, 0, 1);
        sist.agregarPaciente(pac2, 0, 2);
        sist.agregarPaciente(pac3, 0, 3);
        sist.agregarPaciente(pac4, 1, 0);
        sist.agregarPaciente(pac5, 2, 0);
        
        System.out.println(sist.liberarTurnos(0));
        
        System.out.println("El costo recaudado durante la semana es de: " + sist.retornarCosto());
    }
    
}
