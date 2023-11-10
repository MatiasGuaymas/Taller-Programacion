package tema4v2;

public class Triangulo extends Figura {
    private  int lado1;
    private int lado2;
    private int lado3;
    
    
    public Triangulo(int ladouno, int ladodos, int ladotres, String colorR, String colorL){
        super(colorR, colorL);
        setLado1(ladouno);
        setLado2(ladodos);
        setLado3(ladotres);
    }

    public int getLado1() {
        return lado1;
    }

    public void setLado1(int lado1) {
        this.lado1 = lado1;
    }

    public int getLado2() {
        return lado2;
    }

    public void setLado2(int lado2) {
        this.lado2 = lado2;
    }

    public int getLado3() {
        return lado3;
    }

    public void setLado3(int lado3) {
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
                      "Lado1: " + this.lado1+
                      "lado2: " + this.lado2+
                      "lado3: " + this.lado3;
             return aux;
     }
     
     public void despintar(){
         this.setColorLinea("Negro");
         this.setColorRelleno("Blanco");
     }
}

