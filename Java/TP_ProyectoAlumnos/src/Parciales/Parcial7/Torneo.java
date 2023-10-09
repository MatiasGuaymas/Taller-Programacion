package Parciales.Parcial7;

public class Torneo {
    private String nombre;
    private Goleador[][] tabla;
    private int[] cantGoleadores;
    private int cantFechas;
    private int cantJugadores;
    
    public Torneo(String nom, int cantF, int cantJ){
        this.nombre = nom;
        this.cantFechas = cantF;
        this.cantJugadores = cantJ;
        this.tabla = new Goleador[cantF][cantJ];
        this.cantGoleadores = new int[cantF];
        int i,j;
        for(i=0;i<this.cantFechas;i++){
            for(j=0;j<this.cantJugadores;j++){
                this.tabla[i][j] = new Goleador("Nada", "Ninguno", 0);
            }
        }
        for(i=0;i<this.cantFechas;i++){
            this.cantGoleadores[i] = 0;
        }
    } 
    
    public String getNombre() {
        return nombre;
    }

    private Goleador[][] getTabla() {
        return tabla;
    }

    private int[] getCantGoleadores() {
        return cantGoleadores;
    }
    
    public void agregarGoleador(Goleador g, int f){
        this.tabla[f-1][this.cantGoleadores[f-1]] = g;
        this.cantGoleadores[f-1]++;
    }
    
    public Goleador menosGoles(int f){
        int j;
        int min = 9999;
        Goleador minG = new Goleador("Nada", "nada", 0);
        for(j=0;j<this.cantGoleadores[f-1];j++){
            if(this.tabla[f-1][j].getCantGoles() < min){
                minG = this.tabla[f-1][j];
                min = this.tabla[f-1][j].getCantGoles();
            }
        }
        return minG;
    }
    
    public int cantGoleador(){
        int i, aux =0;
        for(i=0;i<this.cantFechas;i++){
            aux = aux + this.cantGoleadores[i];
        }
        return aux;
    }
    
    public String concatenador(){
        int i, j;
        String aux ="";
        for(i=0;i<this.cantFechas;i++){
            aux = aux + "  " + "Fecha #" + (i+1) + " | " + this.cantGoleadores[i] + " Goleadores: ";
            for(j=0;j<this.cantGoleadores[i];j++){
                aux = aux  + this.tabla[i][j].toString();         
            }
            aux = aux + "\n";
        }
        return aux;
    }
    
@Override
    public String toString(){
        String aux = "TORNEO 2023: " + this.nombre +"\n" +this.concatenador();
        return aux;
    }
}   
