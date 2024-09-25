package Practica3.Ejercicio1;

public class Triangulo {
    private double lado1;
    private double lado2;
    private double lado3;
    private String colorRelleno;
    private String colorLinea;
    
    
    public Triangulo(double unLado1, double unLado2, double unLado3, String unColorRelleno, String unColorLinea) {
        this.lado1 = unLado1;
        this.lado2 = unLado2;
        this.lado3 = unLado3;
        this.colorRelleno = unColorRelleno;
        this.colorLinea = unColorLinea;
    }
    
    public Triangulo(){
    }

    public double getLado1() {
        return lado1;
    }

    public void setLado1(double lado1) {
        this.lado1 = lado1;
    }

    public double getLado2() {
        return lado2;
    }

    public void setLado2(double lado2) {
        this.lado2 = lado2;
    }

    public double getLado3() {
        return lado3;
    }

    public void setLado3(double lado3) {
        this.lado3 = lado3;
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
        return this.lado1 + this.lado2 + this.lado3;
    }
    
    public double calcularArea() {
        double s = (lado1 + lado2 + lado3) / 2;        
        return Math.sqrt(s*(s-this.lado1)*(s-this.lado2)*(s-this.lado3));
    }
}
