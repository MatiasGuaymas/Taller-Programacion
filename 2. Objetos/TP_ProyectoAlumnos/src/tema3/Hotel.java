package tema3;

public class Hotel {
   private int numHabitaciones = 10;
   private Habitacion [] habitaciones;
   
   public Hotel (int nro){
       numHabitaciones = nro;
       habitaciones = new Habitacion[nro]; //Java me inicializo nro habitaciones en null
       for (int j = 0; j < nro; j++) {
           habitaciones[j] = new Habitacion(); // inicializar cada habitación
       }
   }
   
   public Hotel () {
       habitaciones = new Habitacion[numHabitaciones];
   }

    public int getNumHabitaciones() {
        return numHabitaciones;
    }

    public Habitacion[] getHabitaciones() {
        return habitaciones;
    }   
   
    public void aumentarPrecios(double n) {
        for (int i=0; i < numHabitaciones; i++) {
            habitaciones[i].aumentarPrecio(n);
        }
    }
    
    public void agregarCliente(Cliente c, int hab) {
        this.habitaciones[hab-1].setCliente(c);
        this.habitaciones[hab-1].ocupar();
    }
    
    @Override
    public String toString() {
        String aux = "";
        for (int n = 0; n <numHabitaciones; n++) {
            aux += "Habitacion" + (n+1) + ":" + this.habitaciones[n].toString() + "\n" ;
        }
        return aux;
    }
}
