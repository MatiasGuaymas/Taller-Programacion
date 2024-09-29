package Practica4.Ejercicio1;

public class Circulo extends Figura{
    private double radio;

    public Circulo(double radio1, String colorR, String colorL){
        super(colorR, colorL);
        this.setRadio(radio1);
    }
    
    public double getRadio() {
        return radio;
    }

    public void setRadio(double radio) {
        this.radio = radio;
    }
@Override
    public double calcularPerimetro(){
        double aux = 2 * (Math.PI * this.radio);
        return aux;
    }
@Override
    public double calcularArea(){
        double aux = Math.PI *(this.radio * this.radio);
        return aux;
    }
    
    public String ToString(){
        return super.toString()+
               " Radio: " + this.radio;
    }
    
}

