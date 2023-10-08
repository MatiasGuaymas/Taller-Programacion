package Parciales.Parcial6;

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

    public Paciente[][] getMatriz() {
        return matriz;
    }
    
    public void agregarPaciente(Paciente p, int d, int t) {
        this.getMatriz()[d][t] = p;
    }
    
    public void liberarTurno(String nom) {
        for(int i= 0; i<this.cantDias; i++) {
            for(int j=0; j<this.cantTurnos; j++) {
                //Aca tuve un error que me decia java.lang.NullPointerException, o sea que intento acceder a un objeto que es null
                //Para solucionar este error, agrego una verificacion para evitar el acceso a metodos en objetos nulos, o sea:
                //(this.getMatriz()[i][j] != null)
                if ((this.getMatriz()[i][j] != null) && this.getMatriz()[i][j].getNombre().equals(nom))
                    this.getMatriz()[i][j] = null;
            }
        }
    }
    
    public boolean tieneTurno (int dia, String nombre) {
        boolean encontre = false;
        int i=0;
        while ((!encontre) && (i<this.cantTurnos)) {
            //Aca tuve un error que me decia java.lang.NullPointerException, o sea que intento acceder a un objeto que es null
            //Para solucionar este error, agrego una verificacion para evitar el acceso a metodos en objetos nulos, o sea:
            //(this.getMatriz()[dia][i] != null)
            if((this.getMatriz()[dia][i] != null) && (this.getMatriz()[dia][i].getNombre().equals(nombre)))
                encontre = true;
            else
                i++;
        }
        return encontre;
    }
}
