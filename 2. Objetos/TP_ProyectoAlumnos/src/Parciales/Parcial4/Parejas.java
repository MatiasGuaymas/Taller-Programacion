package Parciales.Parcial4;

public class Parejas {
    private Participante part1;
    private Participante part2;
    private String estilo;
    
    public Parejas (Participante part1, Participante part2, String estilo){
        this.part1=part1;
        this.part2=part2;
        this.estilo=estilo;
    }

    public Parejas() {}
    
    public Participante getPart1() {
        return part1;
    }
    public Participante getPart2() {
        return part2;
    }
    public String getEstilo() {
        return estilo;
    }
    public void setEstilo(String estilo) {
        this.estilo = estilo;
    }
    public int diferencia(){
        if (this.getPart2().getEdad()>this.part1.getEdad()){
            return this.getPart2().getEdad()-this.part1.getEdad();
        }
        else
            return this.part1.getEdad()-this.getPart2().getEdad();
    }
    
    @Override
    public String toString() {
        return "Nombre 1: " + this.part1.toString() + " Nombre 2: " + this.part2.toString();
    }
    
    
}
