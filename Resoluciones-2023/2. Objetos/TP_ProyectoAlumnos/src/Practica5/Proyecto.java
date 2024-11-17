package Practica5;

import PaqueteLectura.*;
public class Proyecto {
    private String nombre;
    private int codigo;
    private String nombreDirector;
    private int cantInvestigadores;
    private Investigador [] invest;
 
    
    public Proyecto(String nom, int code, String nomd){
        this.codigo = code;
        this.nombre = nom;
        this.nombreDirector = nomd;
        this.invest = new Investigador [50];
    }
    
    
    public boolean estaLleno(){
        return cantInvestigadores == 50;
    }
    
    public int getCantInvestigadores(){
        return this.cantInvestigadores;
    }
    
    public void agregarInvestigador(Investigador inv){
        if(!this.estaLleno())
            invest[cantInvestigadores++] = inv;
        else
            System.out.println("Esta Lleno");
    }
    
    public String getNombreDirector() {
        return nombreDirector;
    }

    public void setNombreDirector(String nombreDirector) {
        this.nombreDirector = nombreDirector;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }
    
    public String getNombre() {
        return nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public Investigador[] getInvest() {
        return invest;
    }
    
    public double dineroTotalOtorgado(){
        int i;
        double aux = 0;
        for(i=0;i<this.getCantInvestigadores();i++){
            aux = aux + invest[i].totalSubsidio();
        }
        return aux;
    }
    
    public int buscar(String str){
        int aux = 0;
        while((aux < this.getCantInvestigadores())&&(!this.getInvest()[aux].getNombre().equals(str))){
            aux++;
        }
        if(aux < this.getCantInvestigadores())
            return aux;
        else
            return -1;
    }
    
    public void otorgarTodos(String str){
        int aux = this.buscar(str);
        if(aux == -1) {
            System.out.println("No existe ese investigador");
        } else {
            while((this.getInvest()[aux].puedoAgregar())&&(aux != -1)){
                Subsidios sub = new Subsidios(GeneradorAleatorio.generarDouble(1000), GeneradorAleatorio.generarString(10));
                this.getInvest()[aux].agregarSubsidio(sub);
        }
        }
    }
    
    public String Concatenador(Investigador [] inv, int DL){
        int i;
        String aux = " ";
        for(i=0;i < DL;i++)
            aux = aux  +  "  |  "  + inv[i].toString();
        return aux;
    }
    
    
@Override
    public String toString(){
        String aux = "Nombre del Proyecto: " + this.getNombre()+ "---" + " Codigo: " + this.getCodigo() +" --- "+ " Nombre del director: " + this.getNombreDirector() + "\n" +
                    " Dinero total otorgado:  " + this.dineroTotalOtorgado() + "\n" + "INFO INVESTIGADORES" +"\n" +  this.Concatenador(this.getInvest(), this.getCantInvestigadores());
        return aux;
    }
}
