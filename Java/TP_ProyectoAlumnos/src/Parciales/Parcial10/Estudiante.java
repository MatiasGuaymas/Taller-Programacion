package Parciales.Parcial10;

import PaqueteLectura.*;
public class Estudiante {
    private String nombre;
    private int dni;
    private int numeroTema;

    
    public Estudiante(String nom, int dni){
        this.nombre = nom;
        this.dni = dni;
        this.numeroTema = -1;
    }
    
    public void asignarTema(int m){
        this.numeroTema = GeneradorAleatorio.generarInt(m) + 1;
    }
    
    public int getDni() {
        return dni;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getNumeroTema() {
        return numeroTema;
    }

    public void setNumeroTema(int numeroTema) {
        this.numeroTema = numeroTema;
    }
    
    @Override
    public String toString(){
        String aux = this.nombre + " " + this.dni + " ";
        return aux;
    }
}
