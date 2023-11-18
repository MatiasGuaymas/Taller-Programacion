package tema4v2;

/**
 *
 * @author Matute
 */
public class SistAnual extends Sistema2 {
    
    public SistAnual(int anioInicial, int cantAnios, Estacion2 estacion) {
        super(anioInicial, cantAnios, estacion);
    }
    
    public String retornarMedia() {
        String aux = "";
        double total;
        for(int i=0;i<this.getCantAnios();i++){
            total = 0;
            for(int j=0;j<12;j++){
                total += getTemp(j, i);
            }
            aux += "Anio "+(i+this.getAnioInicial())+": "+Math.round((total/12)*100)/100.0+"°C \n";
        }
        return aux;
    }

    @Override
    public String toString() {
        return super.toString();
    }
    
    
}
