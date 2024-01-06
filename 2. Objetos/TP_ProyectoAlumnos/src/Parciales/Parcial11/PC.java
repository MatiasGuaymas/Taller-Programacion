package Parciales.Parcial11;

public class PC {
    private boolean estado;
    private double consumo;
    
    public boolean isEstado() {
        return estado;
    }
    
    public void encender(){
        this.estado = true;
    }

    public double getConsumo() {
        return consumo;
    }
    
    public PC(double cons){
        this.estado = false;
        this.consumo = cons;
    }
}
