package Parciales.Parcial5;

import PaqueteLectura.*;

public class Parcial5 {
    
    public static void main(String[] args) {
        GeneradorAleatorio.iniciar();
        
        Sistema sist = new Sistema();
       
        Paciente pac1 = new Paciente(GeneradorAleatorio.generarString(4), GeneradorAleatorio.generarBoolean(), 100.0);
        Paciente pac2 = new Paciente(GeneradorAleatorio.generarString(4), GeneradorAleatorio.generarBoolean(), 200.0);
        Paciente pac3 = new Paciente(GeneradorAleatorio.generarString(4), GeneradorAleatorio.generarBoolean(), 300.0);
        Paciente pac4 = new Paciente(GeneradorAleatorio.generarString(4), GeneradorAleatorio.generarBoolean(), 200.0);
        Paciente pac5 = new Paciente(GeneradorAleatorio.generarString(4), GeneradorAleatorio.generarBoolean(), 100.0);
        
        sist.agregarPaciente(pac1, 0, 1);
        sist.agregarPaciente(pac2, 0, 2);
        sist.agregarPaciente(pac3, 0, 3);
        sist.agregarPaciente(pac4, 1, 0);
        sist.agregarPaciente(pac5, 2, 0);
        
        sist.liberarTurnos(1);
        
        System.out.println("El costo recaudado durante la semana es de: " + sist.retornarCosto());
    }
    
}
