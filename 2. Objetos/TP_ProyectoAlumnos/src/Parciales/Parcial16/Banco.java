package Parciales.Parcial16;

public abstract class Banco {
    private String nombre;
    private int cantEmpleados;
    private int cantCuentas = 0;
    private int maxCuentas;
    private Cuenta [] cuentas;
    private int i;
    
    public Banco(String nombre, int cantEmpleados, int cuentas) {
        this.nombre = nombre;
        this.cantEmpleados = cantEmpleados;
        this.maxCuentas = cuentas;
        this.cuentas = new Cuenta[maxCuentas];
        for(i=0; i<maxCuentas; i++) {
            this.cuentas[i] = null;
        }
    }

    public Cuenta[] getCuentas() {
        return cuentas;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getCantEmpleados() {
        return cantEmpleados;
    }

    public void setCantEmpleados(int cantEmpleados) {
        this.cantEmpleados = cantEmpleados;
    }

    public int getCantCuentas() {
        return cantCuentas;
    }
    
    private boolean hayEspacio() {
        return cantCuentas < maxCuentas;
    }
    
    public boolean agregarCuenta(Cuenta c) {
        boolean aux = false;
        if(hayEspacio()) {
            this.cuentas[cantCuentas++] = c; 
            aux = true;
        }
       return aux;
    }
    
    public int busqueda(int cbu) {
        int aux = 0;
        while(aux < cantCuentas && this.cuentas[aux].getCbu() != cbu) {
            aux++;
        }
        return aux;
    }
    
    public Cuenta obtenerCuenta(int cbu) {
        Cuenta cuen = null;
        int aux = busqueda(cbu);
        if(aux != cantCuentas) {
            cuen = this.cuentas[aux];
        }
        return cuen;
    }
    
    public void depositarDinero(int cbu, double monto){
        int aux = busqueda(cbu);
        if(aux != cantCuentas) {
            this.cuentas[aux].incrementar(monto);
        }
    }
    
    public abstract boolean puedeRecibirTarjeta(int cbu);
}
