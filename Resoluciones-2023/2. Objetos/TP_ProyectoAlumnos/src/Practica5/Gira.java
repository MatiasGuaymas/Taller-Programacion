package Practica5;

import PaqueteLectura.*;
public class Gira extends Recital {
    private String nombreGira;
    private Fecha [] listaFechas;
    private int cantFechas;
    private int fechaMax;
    private int actual;

    public Gira(String nomGira, String nom, int cant, int cantFechas, int cantMax, int fechasMax){
        super(nom, cant, cantMax);
        this.nombreGira = nomGira;
        this.cantFechas = cantFechas;
        this.fechaMax = fechasMax;
        this.listaFechas = new Fecha[fechaMax];
        this.actual = 0;
        for(int i=0; i< this.fechaMax; i++){
            this.getListaFechas()[i] = null;
        }
    }
    
    public String getNombreGira() {
        return nombreGira;
    }

    public Fecha[] getListaFechas() {
        return listaFechas;
    }

    public int getActual() {
        return actual;
    }

    public void setNombreGira(String nombre) {
        this.nombreGira = nombre;
    }
    
@Override
    public String Actuar(){ 
        String aux = "";
        for(int k = 0; k < actual; k++) {
            aux = aux+  "Gira numero " + (k+1) + ": Buenas Noches " + this.listaFechas[k].getCiudad() + "\n";
            aux = aux + super.Actuar() + "\n";
        }
        return aux;
}

    public int getCantFechas() {
        return cantFechas;
    }

    public int getFechaMax() {
        return fechaMax;
    }
    
    public boolean HayEspacio(){
        return this.getCantFechas() < this.getFechaMax();
    }
    
    public void agregarFecha(Fecha f){
        if(this.HayEspacio()){
            this.getListaFechas()[this.actual++] = f;
        }
    }
@Override

    public int CalcularCosto(){
        int i, aux = 0;
        for (i=0; i<this.actual; i++){
            aux++;
        }
        aux = aux * 30000;
        return aux;
    }
}