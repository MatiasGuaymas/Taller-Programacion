package Practica4.Ejercicio5;

public class Dibujo {
    private String titulo;
    private Figura [] vector;
    private int guardadas;
    private int capacidadMaxima=10;
    
    //inicia el dibujo, sin figuras
    public Dibujo (String titulo){
        this.titulo = titulo;
        this.guardadas = 0;
        this.vector = new Figura[this.capacidadMaxima];
    }
    
    //agrega la figura al dibujo
    public void agregar(Figura f){
        if(!this.estaLleno()) {
            this.vector[this.guardadas++] = f;
            System.out.println("la figura "+ f.toString() + " se ha guardado");
        }
    }
    
    //calcula el área del dibujo:
    //suma de las áreas de sus figuras
    public double calcularArea(){
        double area = 0;
        for(int i = 0; i < this.guardadas; i++) {
            area+= this.vector[i].calcularArea();
        }
        return area;
    }
    
    //imprime el título, representación
    //de cada figura, y área del dibujo
    public void mostrar(){
        String aux = this.titulo + " ";
        for(int i=0; i < this.guardadas; i++) {
            aux+= this.vector[i].toString() + " Area=" + this.vector[i].calcularArea();
        }
        System.out.println(aux);
    }
    //retorna está lleno el dibujo
    public boolean estaLleno() {
        return (guardadas == capacidadMaxima);
    }
}
