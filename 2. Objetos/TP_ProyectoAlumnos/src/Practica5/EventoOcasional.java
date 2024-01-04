package Practica5;

public class EventoOcasional extends Recital{
    private String motivo;
    private String nombreContratante;
    private int dia;
    
    public EventoOcasional(String mot, String nom, int dia, String nombreRecital, int cant, int cantMax){
        super(nombreRecital, cant, cantMax);
        this.motivo = mot;
        this.dia = dia;
        this.nombreContratante = nom;
    }

    public String getMotivo() {
        return motivo;
    }

    public String getNombreContratante() {
        return nombreContratante;
    }

    public int getDia() {
        return dia;
    }
    
@Override
    public String Actuar(){
        String aux;
        if(this.getMotivo().equals("Beneficencia")){
            aux = "Recuereden Colaborar con " + this.getNombreContratante();
        }
        else{
            if(this.getMotivo().equals("TV")){
                aux = "Saludos amigos televidentes:" + "\n";
            }
            else{
                aux = "Un Feliz Cumpleaños para " + this.getNombreContratante();
                }
        }
        return aux + super.Actuar();
    }
@Override
    public int CalcularCosto(){
        int aux;
        if(this.getMotivo().equals("Beneficencia")){
            aux = 0;
        }
        else{
            if(this.getMotivo().equals("TV")){
                aux = 50000;
            }
            else{
                aux = 150000;
                }
        }
        return aux;
    }
    
}
