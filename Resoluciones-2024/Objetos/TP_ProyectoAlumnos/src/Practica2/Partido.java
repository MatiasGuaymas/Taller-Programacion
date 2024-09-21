public class Partido {
    private String local;
    private String visitante;
    private int golesLocal; 
    private int golesVisitante;
    
    public Partido(){
    
    }

    public Partido(String unLocal, String unVisitante, int unGolLocal, int unGolVisitante){
        local = unLocal;
        visitante = unVisitante;
        golesLocal = unGolLocal;
        golesVisitante = unGolVisitante;
    }

    
    public String getLocal() {
        return local;
    }

    public String getVisitante() {
        return visitante;
    }

    public int getGolesLocal() {
        return golesLocal;
    }

    public int getGolesVisitante() {
        return golesVisitante;
    }

    public void setLocal(String unEquipo) {
        local = unEquipo;
    }

    public void setVisitante(String unEquipo) {
        visitante = unEquipo;
    }

    public void setGolesLocal(int unosGoles) {
        golesLocal = unosGoles;
    }

    public void setGolesVisitante(int unosGoles) {
        golesVisitante = unosGoles;
    }
    
    public boolean hayGanador(){
         return (golesLocal!=golesVisitante); 
    }
    
    public boolean hayEmpate(){
         return !hayGanador();
    }
    
    public String getGanador(){
         String ganador=new String();
         if (golesLocal>golesVisitante){
             ganador = local;
         }
         else {
             if (golesLocal<golesVisitante){
                 ganador = visitante;
             }
         }
         return ganador;
                 
    }	

    @Override
    public String toString() {
        return this.local + " "  + this.golesLocal + " VS " + this.visitante + " " + this.golesVisitante;
    }
    
}
