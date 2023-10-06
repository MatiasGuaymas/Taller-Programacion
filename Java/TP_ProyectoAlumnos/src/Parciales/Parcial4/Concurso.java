package Parciales.Parcial4;

import PaqueteLectura.*;

public class Concurso {
    private Parejas [] pareja;
    private int cantParejas;
    private int parejasMax;
    
    public Concurso(int cantParejas, int parejasMax){
        this.cantParejas=cantParejas;
        this.parejasMax=parejasMax;
        this.pareja=new Parejas[this.parejasMax];
        for(int i=0; i<this.parejasMax;i++){
            Participante p=new Participante(GeneradorAleatorio.generarInt(9), GeneradorAleatorio.generarString(7),15);
            Participante p2=new Participante(GeneradorAleatorio.generarInt(9), GeneradorAleatorio.generarString(7),5);
            this.getPareja()[i]=new Parejas(p,p2,GeneradorAleatorio.generarString(5));
        }
    }
    public Parejas[] getPareja() {
        return pareja;
    }
    public int getCantParejas() {
        return cantParejas;
    }
    public void setCantParejas(int cantParejas) {
        this.cantParejas = cantParejas;
    }
    public int getParejasMax() {
        return parejasMax;
    }    
    public void agregarPareja (Parejas p){
        this.getPareja()[this.cantParejas++]=p;
    }
    public Parejas maxDifEdad(){
        int max=-1;
        Parejas parmax=new Parejas();
        for (int i=0; i<this.cantParejas; i++){
            if (this.getPareja()[i].diferencia()>max){
                max=this.getPareja()[i].diferencia();
                parmax=this.getPareja()[i];
            }
        }
        return parmax;
    }
    public String toString(){
        return "Nombre 1: " + this.maxDifEdad().getPart1().getNombre() + " Nombre 2: " + this.maxDifEdad().getPart2().getNombre();
    }
}

