package Parciales.Parcial3;

public class CompraMinorista extends Compra {
    private boolean jubilado;
    
    public CompraMinorista(int cantMax, int nro, boolean esJubilado) {
        super(cantMax, nro);
        this.jubilado = esJubilado;
    }

    public boolean isJubilado() {
        return jubilado;
    }

    private void setJubilado(boolean jubilado) {
        this.jubilado = jubilado;
    }
    
    private String verificarJub() {
        String aux;
        if(jubilado) {
            aux = "SI";
        }
        else
            aux = "NO";
        return aux;
    }
    
    @Override
    public String toString() {
        String aux = super.toString() + " Es jubilado: " + this.verificarJub();
        return aux;
    }
    
}
