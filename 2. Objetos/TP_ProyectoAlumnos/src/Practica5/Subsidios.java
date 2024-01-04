package Practica5;

public class Subsidios {
    private double monto;
    private String motivo;
    private boolean otorgado;
    
    public Subsidios(double mon, String motivo){
        this.monto = mon;
        this.motivo = motivo;
        this.otorgado = false;
    }
    
    public double getMonto() {
        return this.monto;
    }
    
    public void setMonto(double monto) {
        this.monto = monto;
    }

    public String getMotivo() {
        return motivo;
    }

    public void setMotivo(String motivo) {
        this.motivo = motivo;
    }

    public boolean isOtorgado() {
        return otorgado;
    }
    
    public void setOtorgadoTrue(){
        otorgado = true;
    }

}
