package Practica5.Ejercicio4;

public class CoroHileras extends Coro{
    private Corista [][] matriz;
    private int [] vecDiml;
    private int cantColumnas;
    private int cantFilas;
    private int coluAux = 0;
    
    public CoroHileras(Director direc, int cantCoristas, String nom, int filas, int columnas) {
        super(direc, cantCoristas, nom);
        this.vecDiml = new int [cantCoristas];
        this.cantColumnas = columnas;
        this.cantFilas = filas;
        this.matriz = new Corista [this.cantFilas][this.cantColumnas];
        this.inicializarVec();
    } 
    
    private void inicializarVec() {
        for(int i=0; i < this.cantFilas; i++) {
            vecDiml[i] = 0;
        }
    }
    
    public boolean estaLleno() {
        return vecDiml[this.cantFilas-1] == this.cantColumnas;
    }
    
    public void agregarCorista(Corista corista) {
        if(!estaLleno()) {
            matriz[coluAux][vecDiml[coluAux]] = corista;
            vecDiml[coluAux]++;
            if (vecDiml[coluAux] == this.cantColumnas) {
                coluAux++;
            }
        }
    }

    public int getCantColumnas() {
        return cantColumnas;
    }

    public int getCantFilas() {
        return cantFilas;
    }

    private void setCantColumnas(int cantColumnas) {
        this.cantColumnas = cantColumnas;
    }

    private void setCantFilas(int cantFilas) {
        this.cantFilas = cantFilas;
    }
    
    public boolean estaBienFormado() {
        boolean cumple = true;
        int max = 999;
        int tonoActual;
        int i = 0;
        int j;
        while((i<this.cantFilas) && (cumple)) {
            j=0;
            tonoActual = matriz[i][j].getTono();
            while ((j < this.vecDiml[i]) && (cumple) && (tonoActual == matriz[i][j].getTono())) {
                j++;
            }
            if(i > this.cantFilas) {
                cumple = false;
            } else if (j == this.cantColumnas) {
                if(tonoActual < max) {
                    max = tonoActual;
                    i++;
                } 
            } else { cumple = false; } 
        }
        return cumple;
    }
    
    public String toString() {
        String dataCoristas = " ";
        int y =0;
        while(y < this.cantFilas) {
            for(int i = 0; i < vecDiml[y]; i++) {
                dataCoristas += matriz[y][i].toString() + "\n";
            }
            y++;
        }
        return super.toString() + dataCoristas;
    }
}