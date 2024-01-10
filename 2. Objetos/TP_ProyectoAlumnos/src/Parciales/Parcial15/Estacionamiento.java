package Parciales.Parcial15;

public class Estacionamiento {
    private String direccion;
    private double costo;
    private Vehiculo [][] matriz;
    private int cantSectores;
    private int cantVehiculos;
    private int i, j;
    
    public Estacionamiento(String direccion, double costoHora, int cantSectores, int cantVehiculos) {
        this.direccion = direccion;
        this.costo = costoHora;
        this.cantSectores = cantSectores;
        this.cantVehiculos = cantVehiculos;
        this.matriz = new Vehiculo[cantSectores][cantVehiculos];
        inicializarMatriz();
    }
    
    private void inicializarMatriz() {
        for(i = 0; i<cantSectores; i++) {
            for(j=0; j< cantVehiculos; j++) {
                this.matriz[i][j] = null;
            }
        }
    }
    
    public void agregarVehiculo(Vehiculo v, int x, int y) {
        this.matriz[x-1][y-1] = v;
    }
    
    public String liberarMarca(String m, int x) {
        String aux = "";
        for(j = 0; j<cantVehiculos; j++) {
            if(this.matriz[x-1][j]!= null && this.matriz[x-1][j].getMarca().equals(m)) {
                aux+= "Patente=" + this.matriz[x-1][j].getPatente() + " Marca=" + this.matriz[x-1][j].getMarca() + " Modelo=" + this.matriz[x-1][j].getModelo() + " Horas=" + this.matriz[x-1][j].getCantHoras() + " - ";
                this.matriz[x-1][j] = null;
            }
        }
        return aux;
    }
    
    public int sectorMax() {
        double aux; 
        int secMax = 0;
        double max = -1;
        for(i=0; i<cantSectores; i++) {
            aux = 0;
            for(j=0; j<cantVehiculos; j++) {
                if(this.matriz[i][j] != null) {
                    aux+= (this.matriz[i][j].getCantHoras() * costo);
                }
            }
            if(aux > max) {
                max = aux;
                secMax = i+1;
            }
        }
        return secMax;
    }
    
    private String verificarOcupado(int i, int j) {
        String aux;
        if(this.matriz[i][j] == null) {
            aux = "Desocupado";
        } else {
            aux = this.matriz[i][j].toString();
        }
        return aux;
    }
    
    private String concatenador() {
        String aux = "";
        for(i=0; i< cantSectores; i++){
            aux+= "Sector " + (i+1) + ":" + "\n";
            for(j=0; j< cantVehiculos; j++) {
                aux+= "Lugar " + (j+1) + ": " + verificarOcupado(i, j) + "\n";
            }
        }
        return aux;
    }
    
    @Override
    public String toString() {
        return "Estacionamiento: " + this.direccion + "; " + this.costo + "\n" + this.concatenador();
    }
}
