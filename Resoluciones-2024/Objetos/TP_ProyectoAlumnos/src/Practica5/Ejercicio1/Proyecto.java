package Practica5.Ejercicio1;

public class Proyecto {
    private String nombre;
    private int codigo;
    private String nomDirector;
    private int cantInvestigadores;
    private Investigador [] inv;
    
    public Proyecto (String nombre, int codigo, String nomDirector) {
        this.nombre = nombre;
        this.codigo = codigo;
        this.nomDirector = nomDirector;
        this.cantInvestigadores = 0;
        this.inv = new Investigador[50];
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCodigo() {
        return codigo;
    }

    public void setCodigo(int codigo) {
        this.codigo = codigo;
    }

    public String getNomDirector() {
        return nomDirector;
    }

    public void setNomDirector(String nomDirector) {
        this.nomDirector = nomDirector;
    }

    public int getCantInvestigadores() {
        return cantInvestigadores;
    }
    
    public void agregarInvestigador (Investigador unInvestigador) {
        if(this.cantInvestigadores < 50) 
            this.inv[this.cantInvestigadores++] = unInvestigador;
    }
    
    public double dineroTotalOtorgado () {
        double aux = 0;
        for(int i=0; i<this.cantInvestigadores; i++) {
            aux+= this.inv[i].dineroTotal();
        }
        return aux;
    }
    
    public void otorgarTodos(String nombre_completo) {
        int i = 0;
        while (i < this.cantInvestigadores && !this.inv[i].getNombreCompleto().equals(nombre_completo))
            i++;
        if (i < this.cantInvestigadores)
            this.inv[i].otorgarSubsidios();
    }
    
    @Override
    public String toString() {
        String aux = "Nombre=" + this.nombre + " Codigo=" + this.codigo + " Director=" + this.nomDirector + " DineroOtorgado="+ this.dineroTotalOtorgado() + "\n";
        for (int i = 0; i < this.cantInvestigadores; i++) {
            aux+= this.inv[i].toString() + "\n";
        }
        return aux;
    }
}
