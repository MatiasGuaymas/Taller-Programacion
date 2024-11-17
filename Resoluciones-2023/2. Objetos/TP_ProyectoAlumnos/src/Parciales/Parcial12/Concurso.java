package Parciales.Parcial12;

public class Concurso {
    // Cada fila va a pertenecer a una categoria, 
    // y luego voy a definir las canciones por cada categoría (columnas)
    private Cancion[][] canciones;
    private int dimFCate;
    private int dimFCanc;
    private int [] vecDiml;
    
    public Concurso(int dimFCate, int dimFCanc){
        this.dimFCate = dimFCate;
        this.dimFCanc = dimFCanc;
        this.canciones = new Cancion[this.dimFCate][this.dimFCanc];
        this.vecDiml = new int [dimFCate];
        for(int j=0; j< this.dimFCate; j++) {
            this.vecDiml[j]=0;
        }
        for (int i = 0; i < this.dimFCate; i++) {
            for (int j = 0; j < this.dimFCanc; j++) {
                this.canciones[i][j] = null;
            }
        }
    }
    
    public void agregarCancion(Cancion cancion, int categoria){
        this.canciones[categoria][vecDiml[categoria]++] = cancion;
    }
    
    public void interpretarCancion(int id, Estudiante estudiante, double puntaje) {
        int i = 0;
        boolean encontre = false;
        while (i < dimFCate && !encontre) {
            int pos = 0;
            while(pos < vecDiml[i] && canciones[i][pos].getId() != id)
                pos++;
            if(pos < vecDiml[i]){
                encontre = true;
                if(canciones[i][pos].getPuntaje() < puntaje){
                    canciones[i][pos].setGanador(estudiante);
                    canciones[i][pos].setPuntaje(puntaje);
                }
            }
            i++;
        }
    }
    
    public Estudiante obtenerGanador(int id){
        Estudiante estudiante = null;
        int i = 0;
        boolean encontre = false;
        while (i < dimFCate && !encontre) {
            int pos = 0;
            while(pos < vecDiml[i] && canciones[i][pos].getId() != id)
                pos++;
            if(pos < vecDiml[i]){
                encontre = true;
                estudiante = canciones[i][pos].getGanador();
            }
            i++;
        }
        return estudiante;
    }
    
    public Cancion cancionMayorPuntaje(int categoria){
        Cancion cancion = null;
        int pos = 0;
        double maxPuntos = -1;
        while(pos < vecDiml[categoria]){
            if(canciones[categoria][pos].getPuntaje() > maxPuntos){
                maxPuntos = canciones[categoria][pos].getPuntaje();
                cancion = canciones[categoria][pos];
            }
            pos++;
        }
        return cancion;
    }

    @Override
    public String toString() {
        String aux = "";
        int pos;
        for (int i = 0; i < dimFCate; i++) {
            pos = 0;
            aux += "Categoria " + i + ": ";
            while(pos < vecDiml[i]){
                aux += canciones[i][pos].toString() + " | ";
                pos++;
            }
            aux += "\n";
        }
        return aux;
    }
    
    
}
