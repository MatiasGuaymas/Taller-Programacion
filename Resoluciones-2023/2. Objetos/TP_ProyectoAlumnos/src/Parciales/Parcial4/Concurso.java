package Parciales.Parcial4;

public class Concurso {
    private Parejas [] pareja;
    private int cantParejas;
    private int parejasMax;
    
    public Concurso(int parejasMax){
        this.cantParejas=0;
        this.parejasMax=parejasMax;
        this.pareja=new Parejas[this.parejasMax];
        for(int i=0; i<this.parejasMax;i++){
            this.getPareja()[i]= null; //Sin parejas inicialmente
        }
    }
    private Parejas[] getPareja() {
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
        return this.maxDifEdad().toString();
    }
}

