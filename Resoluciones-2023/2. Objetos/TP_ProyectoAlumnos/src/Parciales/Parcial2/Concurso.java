package Parciales.Parcial2;

public class Concurso {
    private Concursante [][] matriz;
    private int [] cantConcursantes;
    
    public Concurso(int n){
        matriz = new Concursante[5][n];
        cantConcursantes = new int[5];
        int i, j;
        for(i=0;i<5;i++){
            this.cantConcursantes[i] = 0;
        }
        for(i=0;i<5;i++){
            for(j=0;j<n;j++){
                this.matriz[i][j] = new Concursante("Ninguno", 0, "Nada");
            }
        }
    }

    private int[] getCantConcursantes() {
        return cantConcursantes;
    }
    
    private Concursante[][] getMatriz() {
        return matriz;
    }
    
    public void agregarConcursante(Concursante C, int gen){
        this.matriz[gen][this.cantConcursantes[gen]] = C;
        this.cantConcursantes[gen]++;
    }
    
    public void puntajeConcursante(double puntaje, String nombre){
        boolean encontrado = false;
        int i =0; int j=0;
        while((i < 5) && (!encontrado)){
            while (j < this.cantConcursantes[i] && !encontrado){
                if(this.matriz[i][j].getNombre().equals(nombre)) {
                    encontrado = true;
                    this.matriz[i][j].setPuntaje(puntaje);
                }
                j++;
            }
            i++;
            j=0;
        }
    }   
    
    public int generoMax(){
        int i, max = -999;
        int maxgenero = 0;
        for(i=0;i<5;i++){
            if(this.cantConcursantes[i] > max){
                max = this.cantConcursantes[i];
                maxgenero = i;
            }            
        }    
        return maxgenero;
    }
    
    private String Concatenador(){
        int i, j;
        String aux="";
        for(i=0; i<5; i++){
            for(j=0;j < this.cantConcursantes[i]; j++){
                aux = aux  + "Genero: " + i + this.matriz[i][j].toString() + "\n";
            }
        }
        return aux;
    }
    
@Override   
    public String toString(){
        return this.Concatenador();
    }
}

