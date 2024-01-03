package tema4v2;

public class Triangulo extends Figura {
    private double lado1;
    private double lado2;
    private double lado3;
    
    
    public Triangulo(double ladouno, double ladodos, double ladotres, String colorR, String colorL){
        super(colorR, colorL);
        setLado1(ladouno);
        setLado2(ladodos);
        setLado3(ladotres);
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
    
    @Override
     public double calcularPerimetro(){
        return this.getLado1() + this.getLado2() + this.getLado3();
     }
     
     @Override
     public double calcularArea(){
        double s = (this.getLado1() + this.getLado2() + this.getLado3())/ 2;
        double a = this.getLado1();
        double b = this.getLado2();
        double c = this.getLado3();
        
        double aux = Math.sqrt(s*(s-a)*(s-b)*(s-c));
        return aux;
     }
     
     public String ToString(){
         String aux = super.toString()+
                      " Lado1: " + this.lado1+
                      " lado2: " + this.lado2+
                      " lado3: " + this.lado3;
             return aux;
     }
     
}

