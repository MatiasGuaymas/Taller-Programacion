package Practica5;

import PaqueteLectura.*;

public abstract class Recital {
    private String nombre;
    private int cantTemas;
    private String [] listaTemas;
    private int maxTemas;
    private int temaActual = 0;

    public int getMaxTemas() {
        return maxTemas;
    }
    
    public Recital(String nom, int cant, int cantMax){
        this.nombre = nom;
        this.cantTemas = cant;
        this.maxTemas = cantMax;
        this.listaTemas = new String[cantMax];
        int i;
        for(i=0; i< this.maxTemas; i++){
            this.getListaTemas()[i] = null;
        }
    }
    
    public int getCantTemas() {
        return cantTemas;
    }

    public String[] getListaTemas() {
        return listaTemas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    
    public String Concatenador(){
        String aux = "";
        int i;
        for (i=0;i<this.temaActual;i++){
            aux = aux + "Y ahora tocaremos " + this.getListaTemas()[i] + "\n";
        }
    return aux;
    }
    
    public boolean HayLugar(){
        return this.getCantTemas() < this.getMaxTemas();
    }
    
    public  void agregarTema(String tema){
        if(this.HayLugar()){
            this.listaTemas[this.temaActual++] = tema;
        }
    }
    
    public  String Actuar(){
    String aux = "";
    aux = aux +  " "  + this.Concatenador();
        return aux;
    }
    
    public abstract int CalcularCosto();
    
    
}
