/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica3;

import PaqueteLectura.*;
public class EJ4 {

  
    public static void main(String[] args) {
        Hotel hotel1 = new Hotel(20);
        Cliente cliente1;
        String nom;
        int edad, dni,nro;
        int i;
        
        for(i=0;i<20;i++){
            hotel1.getHabitaciones()[i]= new Habitacion();
        }
        
        int dl = 0;
        //System.out.println("Ingrese nro habitacion");
        //nro = Lector.leerInt();
        
        nro = GeneradorAleatorio.generarInt(21);
        
        while((nro != -1)&&(dl < 20)){
        //System.out.println("Ingrese dato Nombre");
        //nom = Lector.leerString();
        nom = GeneradorAleatorio.generarString(10);
        //System.out.println("Ingrese dato Edad");
        edad = GeneradorAleatorio.generarInt(20);
        //edad = Lector.leerInt();
        //System.out.println("Ingrese dato Dni");
        dni = GeneradorAleatorio.generarInt(20);
        //dni = Lector.leerInt();
        cliente1 = new Cliente(nom, dni, edad);
        if(!hotel1.getHabitaciones()[nro].isOcupada()){
            hotel1.getHabitaciones()[nro].setCliente(cliente1);
            hotel1.getHabitaciones()[nro].setOcupada(true);
        }
        else
           System.out.println("OCUPADA");
        System.out.println("Ingrese nro habitacion");
        dl++;
        nro = Lector.leerInt();
        }
        
        for(i=0;i<20;i++){
            System.out.println("la habitacion "+i+" esta ocupada: "+hotel1.getHabitaciones()[i].isOcupada());
            if(hotel1.getHabitaciones()[i].isOcupada()){
                System.out.println("por: "+hotel1.getHabitaciones()[i].getCliente().getNombre());
            }
        }
    }
}