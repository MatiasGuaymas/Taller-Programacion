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
public class Estacion {
	private String nombre;
	private double latitud;
	private double longitud;
	
	public Estacion(String nom, double lat, double lon){
		this.setLatitud(lat);
		this.setNombre(nom);
		this.setLongitud(lon);
		
	}
	
	

	public String getNombre() {
		return nombre;
	}

	public void setNombre(String nombre) {
		this.nombre = nombre;
	}

	public double getLatitud() {
		return latitud;
	}

	public void setLatitud(double latitud) {
		this.latitud = latitud;
	}

	public double getLongitud() {
		return longitud;
	}

	public void setLongitud(double longitud) {
		this.longitud = longitud;
	}
}
