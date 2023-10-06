package Parciales.Parcial1;

public class Alumno {
    private int dni;
    private String nombre;
    private Materia [] aprobadas;
    private int cantAprobadas;
    private int cantMax;

    
    public int getCantAprobadas() {
        return cantAprobadas;
    }

    public int getCantMax() {
        return cantMax;
    }
    
    
    public Alumno(int dni, String nom, int max){
        this.dni = dni;
        this.nombre = nom;
        this.cantAprobadas = 0;
        this.cantMax = max;
        this.aprobadas = new Materia [cantMax];
    }

    public void setDni(int dni) {
        this.dni = dni;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getDni() {
        return dni;
    }

    public String getNombre() {
        return nombre;
    }

    public Materia[] getAprobadas() {
        return aprobadas;
    }
    
    
    public boolean hayEspacio(){
        return this.cantMax != this.cantAprobadas;
    }
    
    public void agregarMateria(Materia mat){
        if(this.hayEspacio()){
            this.aprobadas[this.cantAprobadas++] = mat;
        }
    }
    
    public boolean esGraduado(){
        int aux = 0;
        String auxstr = "Tesis";
        if(this.cantAprobadas == this.cantMax){
            while((aux < this.cantAprobadas)&&(!this.aprobadas[aux].getNombre().equals(auxstr))){
                aux++;
            }
        }
        return this.getAprobadas()[aux].getNombre().equals(auxstr);
    }
    
    public String Concatenador(){
        int i;
        String aux="";
        for(i=0;i<this.getCantAprobadas();i++){
            aux = aux + " " + this.aprobadas[i].getNombre()+ ": " + Math.round(this.aprobadas[i].getNota()) + " " + this.getAprobadas()[i].getFecha() + " | " + "\n";
        }
        return aux;
    }
    
@Override   
    public String toString(){
        String aux = "DNI: " + this.getDni()+ " | " + " Nombre: " + this.getNombre()+ " | " + "\n" +" Materias Aprobadas: " + "\n" + this.Concatenador()+ " | " +  "Es Gradruado:  " +this.esGraduado()  + "\n";
        return aux;
    }
}



