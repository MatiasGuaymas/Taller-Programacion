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
        int i;
        for(i=0; i< this.cantFechas; i++){
            this.getListaFechas()[i] = new Fecha(GeneradorAleatorio.generarString(5),(GeneradorAleatorio.generarInt(31) + 1));
        }
        this.actual = 0;
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
        String aux;
        aux = "Buenas Noches " + this.listaFechas[this.actual];//ESTA LINEA: this.listaFechas[this.actual], IMPRIME LO SIGUIENTE Practica5.Fecha@eed1f14
        actual++;
        return aux + "\n" + super.Actuar();
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
    
    
    public void agregarFecha(Fecha f){ //ROMPE EL PROGRAMA
        if(this.HayEspacio()){
            this.getListaFechas()[this.cantFechas++] = f;
        }
    }
@Override
    public int CalcularCosto(){
        int i, aux = 0;
        for (i=0; i<this.cantFechas; i++){
            aux++;
        }
        aux = aux * 30000;
        return aux;
    }
}