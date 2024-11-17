package tema4v2;

import PaqueteLectura.*;

public abstract class Sistema2 {
    private Estacion2 estacion;
    private int anioInicial;
    private int cantAnios;
    private double [][] sist;
    
    public Sistema2(int anioInicial, int cantAnios, Estacion2 estacion) {
        this.estacion = estacion;
        this.anioInicial = anioInicial;
        this.cantAnios = cantAnios;
        this.sist = new double[cantAnios][12];
        for (int i = 0; i <cantAnios; i++) {
            for(int j = 0; j < 12; j++) {
                sist[i][j] = 100;
            }
        }   
    }

    public Estacion2 getEstacion() {
        return estacion;
    }

    public void setEstacion(Estacion2 estacion) {
        this.estacion = estacion;
    }

    public int getAnioInicial() {
        return anioInicial;
    }

    public void setAnioInicial(int anioInicial) {
        this.anioInicial = anioInicial;
    }

    public int getCantAnios() {
        return cantAnios;
    }

    public void setCantAnios(int cantAnios) {
        this.cantAnios = cantAnios;
    }

    public void setTemp(int mes, int anio, double tem) {
        this.sist[anio - anioInicial][mes-1] = tem;
    }
    
    public double getTemp(int mes, int anio) {
        return this.sist[anio-anioInicial][mes-1];
    }
    
     public String mayorTemp(){
        double max = 0;
        int anioMax= -1;
        int mesMax = -1;
        for (int i = 0; i < cantAnios; i++) {
            for (int j = 0; j < 12; j++) {
                if(sist[i][j]>max){
                    max = sist[i][j];
                    anioMax = i;
                    mesMax = j;
                }
            }
        }
        return "La temp maxima fue en el anio " + (anioMax + this.anioInicial) + ", mes "+ (mesMax+1);
    }
    
    public abstract String retornarMedia();
    
    @Override
    public String toString() {
        return estacion + "\n" + retornarMedia();
    }
    
    
}