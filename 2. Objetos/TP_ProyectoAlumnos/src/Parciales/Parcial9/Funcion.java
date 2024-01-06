package Parciales.Parcial9;

import PaqueteLectura.*;
public class Funcion {
    private String titulo;
    private int fecha;
    private int hora;
    private Butaca[][] sala;
    private int cantButacas;
    private int cantFilas;
    
    public Funcion(String tit, int fecha, int hr, int n, int m){
        this.titulo = tit;
        this.fecha =  fecha;
        this.hora = hr;
        this.cantFilas = n;
        this.cantButacas = m;
        this.sala = new Butaca[this.cantFilas][this.cantButacas];
        int i,j;
        for (i = 0; i < this.cantFilas; i++) {
            for(j=0;j< this.cantButacas;j++){
                this.sala[i][j] = new Butaca();
                this.sala[i][j].calcularPrecio(i);
                this.sala[i][j].descripcion(i, j);
            }
        }
    }
    
    public double ocuparButaca(int n, int m){
        if(!this.sala[n-1][m-1].isOcupado()){
            this.sala[n-1][m-1].ocupar();
            return this.sala[n-1][m-1].getPrecio();
        }
        else
            return -1.0;
    }
    
    public void desocuparFila(int n){
        int i;
        for(i=0;i<this.cantButacas;i++){
            this.sala[n-1][i].desocupar();
        }
    }
    
    public String represetarButaca(int m){
        String aux ="";
        int i;
        for(i=0;i<this.cantFilas;i++){
            aux =aux + "  "+ this.sala[i][m-1].toString();
        }
        return aux;
    }
    
    private String concatenador(){
        int i,j;
        String aux = "";
        for(i=0;i<this.cantFilas;i++){
            for(j=0;j<this.cantButacas;j++){
                aux = aux + this.sala[i][j].toString() + "\n";
            }
        }
        return aux;
    }
    
    
@Override
    public String toString(){
        String aux = this.titulo + "  " + this.fecha + "   " + this.hora + "  " + "\n"  +  this.concatenador();
        return aux;
    }
    
    public String getTitulo() {
        return titulo;
    }

    public int getFecha() {
        return fecha;
    }

    public int getHora() {
        return hora;
    }

    private Butaca[][] getSala() {
        return sala;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public void setFecha(int fecha) {
        this.fecha = fecha;
    }

    public void setHora(int hora) {
        this.hora = hora;
    }
}
