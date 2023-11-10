package tema3;

public class Triangulo {
    private double lado1 = 0;
    private double lado2 = 0;
    private double lado3 = 0;
    private String colorRelleno = "Default";
    private String colorLinea = "Default";
    
    
    public Triangulo(double unLado1, double unLado2, double unLado3, String unColorRelleno, String unColorLinea) {
        lado1 = unLado1;
        lado2 = unLado2;
        lado3 = unLado3;
        colorRelleno = unColorRelleno;
        colorLinea = unColorLinea;
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
        double aux = lado1 + lado2 + lado3;
        return aux;
    }
    
    public double calcularArea() {
        double s = (lado1 + lado2 + lado3) / 2;
        double a = lado1;
        double b = lado2;
        double c = lado3;
        
        double aux = Math.sqrt(s*(s-a)*(s-b)*(s-c));
        return aux;
    }
}
