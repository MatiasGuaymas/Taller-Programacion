package tema4v2;

public class SistMensual extends Sistema2 {
    private String[] meses = new String[]{"Enero", "Febrero", "Marzo",
        "Abril", "Mayo", "Junio", "Julio", "Agosto", "Septiembre",
        "Octubre", "Noviembre", "Diciembre"};
    
    public SistMensual(int anioInicial, int cantAnios, Estacion2 estacion) {
        super(anioInicial, cantAnios, estacion);
    }
    
    public String retornarMedia() {
        String aux = "";
        double total;
        for (int j=0;j<12;j++){
            total = 0;
            for(int i=0;i<this.getCantAnios();i++){
                total += getTemp(j+1, i+this.getAnioInicial());         
            }
            aux += meses[j]+": "+Math.round((total/this.getCantAnios())*100)/100.0+"°C \n";
        }
        return aux;
    }
    
    @Override
    public String toString() {
        return super.toString();
    }
}