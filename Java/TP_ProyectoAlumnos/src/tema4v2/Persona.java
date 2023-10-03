/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package tema4v2;

/**
 *
 * @author alumnos
 */
public class Persona {
	private String nombre;
	private int dni;
	private int edad;

	
	public Persona(){
		
	}
	
	public Persona(String nom, int dni, int edad){
		this.setDni(dni);
		this.setNombre(nom);
		this.setEdad(edad);
	}
	
	public String toString(){
		String aux = "Mi nombre es " + this.getNombre() + ", mi dni es " + this.getDni() + ", tengo " + this.getEdad();
		return aux;
	}
	
	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public int getDni() {
		return dni;
	}

	public void setDni(int dni) {
		this.dni = dni;
	}

	public int getEdad() {
		return edad;
	}

	public void setEdad(int edad) {
		this.edad = edad;
	}
	
	
}
