package tema4v2;

public class Entrenador extends Empleado{
    int cantCampeonatos;

    public Entrenador(int camp,String nom, double unSueldo, int anti){
        super(nom, unSueldo, anti);
        this.setCantCampeonatos(camp);
    }
    
    public int getCantCampeonatos() {
        return cantCampeonatos;
    }

    public void setCantCampeonatos(int cantCampeonatos) {
        this.cantCampeonatos = cantCampeonatos;
    }
@Override
    public double calcularEfectividad(){
        double aux = (double) this.getCantCampeonatos() / this.getAntiguedad();
        return aux; 
    }
    
@Override
    public double calcularSueldo(){
        double aux = this.sueldoBase();
        if(this.getCantCampeonatos() == 0){
            return aux;
        }
        else{
            if((this.getCantCampeonatos()>=1) && (this.getCantCampeonatos()<=4)){
                aux = aux + 5000;
            }
            else
            if((this.getCantCampeonatos()>= 5) && (this.getCantCampeonatos()<=10)){
                aux= aux + 30000;
             }
            else if (this.getCantCampeonatos() > 10){
                aux = aux + 50000;
            }
        }
        return aux;
    }
}
