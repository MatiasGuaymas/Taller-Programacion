/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4v2;


public abstract class Empleado {
    String nombre;
    double sueldo;
    int antiguedad;

    
    public Empleado(String nom, double unSueldo, int anti){
        this.setNombre(nom);
        this.setAntiguedad(anti);
        this.setSueldo(unSueldo);
    }
    
    public String ToString(){
        String aux = "Nombre: "+ this.getNombre() + " Sueldo: " + this.calcularSueldo()+ " Efectividad " + this.calcularEfectividad();
        return aux;
    }
    
    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public double getSueldo() {
        return sueldo;
    }

    public void setSueldo(double sueldo) {
        this.sueldo = sueldo;
    }

    public int getAntiguedad() {
        return antiguedad;
    }

    public void setAntiguedad(int antiguedad) {
        this.antiguedad = antiguedad;
    }
 
    public abstract double calcularEfectividad();
    
    public abstract double calcularSueldo();
    
}
