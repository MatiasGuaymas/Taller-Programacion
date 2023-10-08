package Parciales.Parcial8;

public class CursoPresencial extends Curso {
    private int aula;

    public int getAula() {
        return aula;
    }

    public void setAula(int aula) {
        this.aula = aula;
    }
    
    public CursoPresencial(int aula, int a, int cant){
        super(a, cant);
        this.aula = aula;
    }
@Override
    public boolean puedeRendir(Alumno2 a){
        return (a.getAsistencias() >= 3);
    }
}
