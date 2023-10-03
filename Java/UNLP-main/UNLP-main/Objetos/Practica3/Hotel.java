/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica3;

/**
 *
 * @author Alumno
 */
public class Hotel {
    private int nroHabitaciones = 5;
    private Habitacion [] habitaciones;
    
    public Hotel(int nro){
        nroHabitaciones = nro;
        habitaciones = new Habitacion[nro];
    }
    
    public Hotel(){
        habitaciones = new Habitacion[nroHabitaciones];
    }
    
    public Habitacion [] getHabitaciones(){
        return habitaciones;
    }
    
    public int getNroHabiteaciones(){
        return nroHabitaciones;
    }
    
}
