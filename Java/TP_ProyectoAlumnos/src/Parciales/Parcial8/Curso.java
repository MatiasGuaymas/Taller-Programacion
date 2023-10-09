package Parciales.Parcial8;

public abstract class Curso {
    private int anio;
    private Alumno2[] vector;
    private int cantAlumnos;
    private int cantMax;

    public Curso(int a, int cant){
        this.anio = a;
        this.cantMax = cant;
        this.vector = new Alumno2[cantMax];
        this.cantAlumnos = 0;
        
    }
    
    public int getAnio() {
        return anio;
    }

    private Alumno2[] getVector() {
        return vector;
    }
    
    public boolean hayEspacio(){
        return this.cantAlumnos < this.cantMax;
    }
    
    public boolean agregarAlumno(Alumno2 a){
        if(this.hayEspacio()){
            this.vector[this.cantAlumnos++] = a;
            return true;    
        }
        else
             return false;
    }
    
    public boolean incAsistenciaDni(int dni){
        int aux = 0;
        while(dni != this.vector[aux].getDni()){
            aux++;
        }
        if(aux != this.cantAlumnos){
            this.vector[aux].incAsistencia();
            return true;
        }
        else
            return false;
    }
    
    public boolean aproboPrueba(int dni){
        int aux = 0;
        while(dni != this.vector[aux].getDni()){
            aux++;
        }
        if(aux != this.cantAlumnos){
            this.vector[aux].incAutoEvaluacion();
            return true;
        }
        else
            return false;
    }
    
    public abstract boolean puedeRendir(Alumno2 a);
    
    public int cantAlumnosRendir(){
        int i;
        int aux =0;
        for(i=0;i<this.cantAlumnos;i++){
            if(this.puedeRendir(this.vector[i])){
                aux++;
            }
        }
        return aux;
    }
}

