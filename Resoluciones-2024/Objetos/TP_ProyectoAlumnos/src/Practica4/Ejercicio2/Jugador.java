package Practica4.Ejercicio2;

public class Jugador extends Empleado {
    private int numeroPartido;
    private int cantGoles;
    
    public Jugador(int nro, int cant, String nom, double unSueldo, int anti){
        super(nom, unSueldo, anti);
        this.setCantGoles(cant);
        this.setNumeroPartido(nro);
    }
    
    public int getNumeroPartido() {
        return numeroPartido;
    }

    public void setNumeroPartido(int numeroPartido) {
        this.numeroPartido = numeroPartido;
    }

    public int getCantGoles() {
        return cantGoles;
    }

    public void setCantGoles(int cantGoles) {
        this.cantGoles = cantGoles;
    }
    
@Override
    public double calcularEfectividad(){
        double aux = (double) this.getCantGoles() / this.getNumeroPartido();
        return aux;
    }
    
@Override
    public double calcularSueldo(){
        double aux = this.sueldoBase();
        if(this.calcularEfectividad() > 0.5){
            aux = aux + this.getSueldo();
        }
        return aux;
    }
}
