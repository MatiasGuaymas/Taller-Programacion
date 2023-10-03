/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Practica3;

/**
 *
 * @author Francisco
 */
public class Autor {
    private String biografia;
    private String nombre;
    private String origen;
    
   public void setBiografia(String nuevaBio){
       biografia = nuevaBio;
   }
   
   public void setNombre(String nuevoNom){
       nombre = nuevoNom;
   }
   
   public void setOrigen(String nuevoOrigen){
       origen = nuevoOrigen;
}
   
   public  String getBiografia(){
       return biografia;
   }
   
   public  String getNombre(){
       return nombre;
   }
   
   public  String getOrigen(){
       return origen;
   }
   
   @Override
   public String toString(){
       return "El autor se llama" + nombre + " es de origen " + origen + " y su biografia es " + biografia;
    }
}