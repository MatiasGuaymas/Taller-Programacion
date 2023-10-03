/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica3;

/**
 *
 * @author Francisco
 */
public class Triangulo {
    private double lado1 = 0;
    private double lado2 = 0;
    private double lado3 = 0;
    private String colorRelleno = "ninguno";
    private String colorLinea = "ninguno";
    
    public Triangulo(double unLado1, double unLado2, double unLado3, String unColorR, String unColorLinea){
        lado1 = unLado1;
        lado2 = unLado2;
        lado3 = unLado3;
        colorRelleno = unColorR;
        colorLinea = unColorLinea;
    }
    
    public Triangulo(){
    }
    
    public double getLado1(){
        return lado1;
    }
    
    public double getLado2(){
        return lado2;
    }
    
    public double getLado3(){
        return lado3;
    }
    
    public String getColorRelleno(){
        return colorRelleno;
    }
    
    public String getColorLinea(){
        return colorLinea;
    }
    
    
    public void setLado1(double unLado){
        lado1 = unLado;
    }
    
    public void setLado2(double unLado){
        lado2 = unLado;
    }
    public void setLado3(double unLado){
        lado3 = unLado;
    }
    
    public void setColorRelleno(String color){
        colorRelleno = color;
    }
    
     public void setColorLinea(String color){
         colorLinea = color;
    }
     
    public double CalcularPerimetro(){
        double aux = lado1 + lado2 + lado3;
        return aux;
    }
    
    public double CalcularArea(){
        double s = (lado1 + lado2 + lado3)/ 2;
        double a = lado1;
        double b = lado2;
        double c = lado3;
        
        double aux = Math.sqrt(s*(s-a)*(s-b)*(s-c));
        return aux;
    }
}
    
   
