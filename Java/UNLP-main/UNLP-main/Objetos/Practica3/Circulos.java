/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica3;
public class Circulos {
    private double radio;
    private String colorRelleno;
    private String colorLinea;
    
    public Circulos(double unRadio, String unColorR, String unColorL){
        radio = unRadio;
        colorRelleno = unColorR;
        colorLinea = unColorL;
    }

    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }

    public String getColorRelleno() {
        return colorRelleno;
    }

    public void setColorRelleno(String colorRelleno) {
        this.colorRelleno = colorRelleno;
    }

    public String getColorLinea() {
        return colorLinea;
    }

    public void setColorLinea(String colorLinea) {
        this.colorLinea = colorLinea;
    }
    
    public double CalcularPerimetro(){
        double aux;
        aux = 2*(Math.PI) * radio;
        return aux;
    }
    
    public double CalcularArea(){
        double aux;
        aux = Math.PI * (radio * radio);
        return aux;
    }
}

