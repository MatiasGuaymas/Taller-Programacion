// Un psicólogo necesita un sistema para organizar su agenda semanal. El sistema mantiene para c/u de los 5 días
// de atención y c/u de los 6 turnos (horarios) del día, la información del paciente que tomó el turno. De los
// pacientes guarda: nombre, si tiene obra social y costo a abonar por la sesión.
// a) Genere las clases necesarias. Implemente constructores para iniciar: el sistema sin pacientes; los pacientes
// a partir de toda su información.
// b) Lea atentamente y luego implemente métodos que permitan:
// - Agendar al paciente P en un día D y turno T. Asuma que el turno está libre. D y T son válidos.
// - Dado un día D, liberar los turnos de todos los pacientes agendados en ese día (los 6 turnos). Retornar un
// string con los nombres de los pacientes para avisar de la cancelación. Asuma que D es válido.
// - Calcular y devolver el costo total que recaudará el psicólogo en la atención semanal.
// c) Realice un programa que instancie el sistema. Cargue varios pacientes al sistema. Libere turnos agendados.
// Para finalizar, imprima el resultado del inciso b.iii.

package Parciales.Parcial5;

public class Sistema {
    private Paciente [][] matriz;
    private int cantDias = 5;
    private int cantTurnos = 6;
    
    public Sistema() {
        this.matriz = new Paciente[cantDias][cantTurnos];
        for (int i=0; i < this.cantDias; i++ )
            for(int j = 0; j < this.cantTurnos; j++)
                matriz[i][j] = null; //Todo vacio, no tengo pacientes.
    }

    public int getCantDias() {
        return cantDias;
    }

    public int getCantTurnos() {
        return cantTurnos;
    }

    private Paciente[][] getMatriz() {
        return matriz;
    }
    
    public void agregarPaciente(Paciente p, int d, int t) {
        this.getMatriz()[d][t] = p;
    }
    
    public String liberarTurnos(int dia) {
        String aux = "";
        int j;
        for(j=0; j<this.cantTurnos; j++)
            if(this.getMatriz()[dia][j] != null) {
                aux += this.getMatriz()[dia][j].getNombre() + " ";
                this.getMatriz()[dia][j] = null;
        }   
        return aux + " perderan sus turnos";
    }
    
   public double retornarCosto() {
       double costo = 0.0;
       for (int i=0; i < this.cantDias; i++ ) {
           for(int j = 0; j < this.cantTurnos; j++)
               if(this.getMatriz()[i][j] != null)
                    costo += this.getMatriz()[i][j].getCostoAbono();
       }
       return costo;
}
}
