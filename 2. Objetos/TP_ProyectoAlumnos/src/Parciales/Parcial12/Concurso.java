package Parciales.Parcial12;

public class Concurso {
    // Cada fila va a pertenecer a una categoria, 
    // y luego voy a definir las canciones por cada categoría (columnas)
    private Cancion[][] canciones;
    private int dimFCate;
    private int dimFCanc;
    
    public Concurso(int dimFCate, int dimFCanc){
        this.dimFCate = dimFCate;
        this.dimFCanc = dimFCanc;
        this.canciones = new Cancion[this.dimFCate][this.dimFCanc];
        for (int i = 0; i < this.dimFCate; i++) {
            for (int j = 0; j < this.dimFCanc; j++) {
                this.canciones[i][j] = null;
            }
        }
    }
    
    public void agregarCancion(Cancion cancion, int categoria){
        int pos = 0;
        while(pos < dimFCanc && canciones[categoria][pos] != null)
            pos++;
        canciones[categoria][pos] = cancion;
    }
    
    public void interpretarCancion(int id, Estudiante estudiante, int puntaje){
        int i = 0;
        boolean encontre = false;
        while (i < dimFCate && !encontre) {
            int pos = 0;
            
            while(pos < dimFCanc && canciones[i][pos] != null && canciones[i][pos].getId() != id)
                pos++;
            
            if(pos < dimFCanc && canciones[i][pos] != null){
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
            
            while(pos < dimFCanc && canciones[i][pos] != null && canciones[i][pos].getId() != id)
                pos++;
            
            if(pos < dimFCanc && canciones[i][pos] != null){
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
        int maxPuntos = -1;
        while(pos < dimFCanc && canciones[categoria][pos] != null){
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
            while(pos < dimFCanc && canciones[i][pos] != null){
                aux += "Categoria " + i + ": " + canciones[i][pos].toString() + "\n";
                pos++;
            }
        }
        return aux;
    }
    
    
}
