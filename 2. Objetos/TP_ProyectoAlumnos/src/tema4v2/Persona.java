package tema4v2;

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
		String aux = "Mi nombre es " + this.getNombre() + ", mi dni es " + this.getDni() + ", tengo " + this.getEdad() + " años";
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