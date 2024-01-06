package Parciales.Parcial11;

import PaqueteLectura.*;
public class Sala {
    private int cantEspacios;
    private PC [] vector;

    public int getCantEspacios() {
        return cantEspacios;
    }

    private PC[] getVector() {
        return vector;
    }
    
    public Sala(int n){
        this.cantEspacios = n;
        this.vector = new PC[this.cantEspacios];
        int i,j;
        for(i=0;i<this.cantEspacios;i++){
            this.vector[i] = new PC(0);
            }
        }
    
    public boolean hayEspacio(int n){
        return !this.vector[n].isEstado() && this.vector[n].getConsumo() == 0;
    }
    
    
    public void agregarPC(int n, PC pc1){
        if(this.hayEspacio(n-1)){
            this.vector[n-1] = pc1;
        }
    }
    
    public void encenderPc(){
        int i;
        int minPC = 0;
        double min = 999.9;
        for(i=0;i<this.cantEspacios;i++){
            if(!(this.vector[i].isEstado())&&(this.vector[i].getConsumo() < min)){
                    minPC = i;
                    min = this.vector[i].getConsumo();
                }
        }
        this.vector[minPC].encender();
    }
    
    public String concatenador(){
        int i,j;
        String aux = "";
        for(i=0;i<this.cantEspacios;i++){
            if(this.vector[i].isEstado()){
                   aux = aux + "ESPACIO: " + (i + 1) + "\n";
                }
        }
        return aux;
    }
}
