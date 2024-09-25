package Practica3.Ejercicio5;

public class Circulo {
    private double radio;
    private String colorRelleno;
    private String colorLinea;
    
    public Circulo (double unRadio, String unColorRelleno, String unColorLinea) {
        radio = unRadio;
        colorRelleno = unColorRelleno;
        colorLinea = unColorLinea;
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
    
    public double calcularPerimetro() {
        return 2 * radio * Math.PI;
    }
    
    public double calcularArea() {
        return Math.PI * (radio * radio);
    }
}
