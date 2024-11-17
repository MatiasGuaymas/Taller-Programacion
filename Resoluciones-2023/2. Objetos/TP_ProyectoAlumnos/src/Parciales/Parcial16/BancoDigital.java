package Parciales.Parcial16;

public class BancoDigital extends Banco {
    private String digital;
    
    public BancoDigital(String nombre, int cantEmpleados, int cuentas, String url) {
        super(nombre, cantEmpleados, cuentas);
        this.digital = url;
    }

    public String getDigital() {
        return digital;
    }

    public void setDigital(String digital) {
        this.digital = digital;
    }
    
    @Override
    public boolean puedeRecibirTarjeta(int cbu) {
        boolean aux = false;
        int pos = this.busqueda(cbu);
        if(this.getCantCuentas() != pos) {
            if((this.getCuentas()[pos].getMoneda().equals("Pesos") && (this.getCuentas()[pos].getMonto() > 70000))) {
                aux = true;
            }
        }
        return aux;
}}
