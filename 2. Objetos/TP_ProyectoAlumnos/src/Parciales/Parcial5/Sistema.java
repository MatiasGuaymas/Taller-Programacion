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
