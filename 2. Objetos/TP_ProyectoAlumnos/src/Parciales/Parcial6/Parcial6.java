/* Un psicólogo necesita un sistema para organizar su agenda semanal. El sistema mantiene para c/u de los 5 días
de atención y c/u de los 6 turnos (horarios) del día, la información del paciente que tomó el turno. De los
pacientes guarda: nombre, si tiene obra social y costo a abonar por la sesión.
a) Genere las clases necesarias. Implemente constructores para iniciar: el sistema sin pacientes; los pacientes
a partir de toda su información.
b) Lea atentamente y luego implemente métodos que permitan:
- Agendar al paciente P en un día D y turno T. Asuma que el turno está libre. D y T son válidos.
- Dado el nombre de un paciente, liberar todos sus turnos.
- Dado un día D y el nombre de un paciente, devolver si el paciente tiene agendado un turno ese día. Asuma
que D es válido.
c) Realice un programa que instancie el sistema. Cargue varios pacientes al sistema. Libere turnos agendados.
Para finalizar, imprima el resultado del inciso b.iii. */

package Parciales.Parcial6;

import PaqueteLectura.*;

public class Parcial6 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Sistema sist = new Sistema();
       
        Paciente pac1 = new Paciente("Pepe", true, 100.0);
        Paciente pac2 = new Paciente("Ro", GeneradorAleatorio.generarBoolean(), 200.0);
        
        sist.agregarPaciente(pac1, 0, 1);
        sist.agregarPaciente(pac1, 0, 2);
        sist.agregarPaciente(pac1, 1, 0);
        sist.agregarPaciente(pac2, 1, 4);
        sist.agregarPaciente(pac2, 0, 5);
        
        System.out.println(sist.tieneTurno(0, "Pepe"));
        sist.liberarTurno("Pepe");
        System.out.println(sist.tieneTurno(1, "Pepe"));

        System.out.println(sist.tieneTurno(1, "Ro"));
       
    }
    
}
