package Parciales.Parcial16;

public class BancoTradicional extends Banco{
    private String direccion;
    private String localidad;
    private int cantCuentas;
    
    public BancoTradicional(String nombre, int cantEmpleados, int cuentas, String direccion, String localidad) {
        super(nombre, cantEmpleados, cuentas);
        this.direccion = direccion;
        this.localidad = localidad;
        this.cantCuentas = 0;
    }

    public String getDireccion() {
        return direccion;
    }

    public void setDireccion(String direccion) {
        this.direccion = direccion;
    }

    public String getLocalidad() {
        return localidad;
    }

    public void setLocalidad(String localidad) {
        this.localidad = localidad;
    }
    
    @Override
    public boolean agregarCuenta(Cuenta c) {
        boolean aux;
        if(c.getMoneda().equals("Dolares")) {
            if(cantCuentas < 100) {
                aux = super.agregarCuenta(c);
                cantCuentas += 1;
            } else {
                aux = false;
            }
        } else {
            aux = super.agregarCuenta(c);
        }
        return aux;
    }

    @Override
    public boolean puedeRecibirTarjeta(int cbu) {
        boolean aux = false;
        int pos = this.busqueda(cbu);
        if(this.getCantCuentas() != pos) {
            if((this.getCuentas()[pos].getMoneda().equals("Dolares") && (this.getCuentas()[pos].getMonto() > 500))) {
                aux = true;
            } else if((this.getCuentas()[pos].getMoneda().equals("Pesos") && (this.getCuentas()[pos].getMonto() > 70000))) {
                aux = true;
                }
            }
        return aux;
        }
}

