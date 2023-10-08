package Parciales.Parcial11;

import PaqueteLectura.*;
public class Sala {
    private int cantEspacios;
    private PC [][] matriz;

    public int getCantEspacios() {
        return cantEspacios;
    }

    public PC[][] getMatriz() {
        return matriz;
    }
    
    public Sala(int n){
        this.cantEspacios = n;
        this.matriz = new PC[this.cantEspacios][this.cantEspacios];
        int i,j;
        for(i=0;i<this.cantEspacios;i++){
            for(j=0;j<this.cantEspacios;j++){
                this.matriz[i][j] = new PC(0);
            }
        }
    }
    
    public boolean hayEspacio(int n, int m){
        return !this.matriz[n ][m ].isEstado() && this.matriz[n][m].getConsumo() == 0;
    }
    
    
    public void agregarPC(int n, int m, PC pc1){
        if(this.hayEspacio(n - 1, m - 1)){
            this.matriz[n - 1][m - 1] = pc1;
        }
    }
    
    public void encenderPc(){
        int i,j;
        int minFila = 0, minColumna = 0;
        double min = 99999.9;
        for(i=0;i<this.cantEspacios;i++){
            for(j=0;j<this.cantEspacios;j++){
                if(!(this.matriz[i][j].isEstado())&&(this.matriz[i][j].getConsumo() < min)){
                    minFila = i;
                    minColumna = j;
                    min = this.matriz[i][j].getConsumo();
                }
            }
        }
        this.matriz[minFila][minColumna].encender();
    }
    
    public String concatenador(){
        int i,j;
        String aux = "";
        for(i=0;i<this.cantEspacios;i++){
            for(j=0;j<this.cantEspacios;j++){
                if(this.matriz[i][j].isEstado()){
                   aux = aux + "ESPACIO: " + (i + 1)+ " y " +(j + 1)+ "\n";
                }
            }
        }
        return aux;
    }
}
