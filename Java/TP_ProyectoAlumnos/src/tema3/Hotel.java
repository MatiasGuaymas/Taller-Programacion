package tema3;

/**
 *
 * @author Matute
 */
public class Hotel {
   private int numHabitaciones = 3;
   private Habitacion [] habitaciones;
   
   public Hotel (int nro){
       numHabitaciones = nro;
       habitaciones = new Habitacion[nro];
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
   
}
