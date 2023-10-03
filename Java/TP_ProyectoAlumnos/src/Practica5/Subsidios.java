/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica5;

/**
 *
 * @author Francisco
 */
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
