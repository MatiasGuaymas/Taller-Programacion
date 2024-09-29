package Practica5.Ejercicio1;

public class Investigador {
    private String nombreCompleto;
    private int categoria;
    private String especialidad;
    private int cantSubsidios;
    private Subsidio [] sub;
    
    public Investigador (String nombreCompleto, int categoria, String especialidad) {
        this.nombreCompleto = nombreCompleto;
        this.categoria = categoria;
        this.especialidad = especialidad;
        this.cantSubsidios = 0;
        this.sub = new Subsidio[5];
    }

    public String getNombreCompleto() {
        return nombreCompleto;
    }

    public void setNombreCompleto(String nombreCompleto) {
        this.nombreCompleto = nombreCompleto;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getEspecialidad() {
        return especialidad;
    }

    public void setEspecialidad(String especialidad) {
        this.especialidad = especialidad;
    }

    public int getCantSubsidios() {
        return cantSubsidios;
    }
    
    public void agregarSubsidio (Subsidio unSubsidio) {
        if(this.cantSubsidios < 5) 
            this.sub[this.cantSubsidios++] = unSubsidio;
    }
    
    public double dineroTotal() {
        int i = 0;
        double aux = 0;
        while(i < this.cantSubsidios && this.sub[i].isOtorgado()) {
            aux+= this.sub[i].getMonto();
            i++;
        }    
        return aux;
    }
    
    public void otorgarSubsidios() {
        for (int i = 0; i < this.cantSubsidios; i++) {
            if(!this.sub[i].isOtorgado())
                this.sub[i].setOtorgado(true);
        }
    }
    
    @Override
    public String toString() {
        return "Nombre=" + this.nombreCompleto + " Categoria=" + this.categoria + " Especialidad=" + this.especialidad + " TotalDinero=" + this.dineroTotal();
    }
}
