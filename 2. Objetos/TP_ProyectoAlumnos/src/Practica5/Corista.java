package Practica5;

public class Corista extends Persona{
    private int tono;
    
    public Corista(String nombre, int dni, int tono) {
        super(nombre, dni);
        this.setTono(tono);
    }

    public int getTono() {
        return tono;
    }

    private void setTono(int tono) {
        this.tono = tono;
    }
    
    @Override
    public String toString() {
        return super.toString() + " TONO=" + this.tono;
    }
    
}
