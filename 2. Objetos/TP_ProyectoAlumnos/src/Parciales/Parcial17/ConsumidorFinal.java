package Parciales.Parcial17;

public class ConsumidorFinal {
    private int cuil;
    private String nombre;
    
    public ConsumidorFinal(int cuil, String nombre) {
        this.cuil = cuil;
        this.nombre = nombre;
    }

    public int getCuil() {
        return cuil;
    }

    public void setCuil(int cuil) {
        this.cuil = cuil;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
