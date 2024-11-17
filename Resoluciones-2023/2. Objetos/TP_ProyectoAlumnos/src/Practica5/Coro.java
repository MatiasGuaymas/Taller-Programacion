package Practica5;

public abstract class Coro {
    private String nombre;
    private Director direc;
    private int diml = 0;
    private int cantCoristas; //DIMF
    
    public Coro(Director direc, int cantCoristas, String nom) {
        this.nombre = nom;
        this.direc = direc;
        this.cantCoristas = cantCoristas;
    }
    
    public boolean CoroLleno() {
        return this.diml == cantCoristas;
    }

    public String getNombre() {
        return nombre;
    }

    public Director getDirec() {
        return direc;
    }

    public int getDiml() {
        return diml;
    }

    public int getCantCoristas() {
        return cantCoristas;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setDirec(Director direc) {
        this.direc = direc;
    }

    public void incrementarDiml() {
        this.diml += 1;
    }

    private void setCantCoristas(int cantCoristas) {
        this.cantCoristas = cantCoristas;
    }
    
    public abstract boolean estaLleno();
    public abstract boolean estaBienFormado();
    
    @Override
    public String toString() {
        return "Nombre del coro: " + this.nombre + " Director: " + this.direc.toString() + "\n Data de los coristas: ";
    }
}
