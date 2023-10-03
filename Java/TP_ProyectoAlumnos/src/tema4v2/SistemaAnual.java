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
public class SistemaAnual extends Sistema {
    private double [] vector;
    
    public double[] obtenerPromedio(){
            int i, j;
            vector = new double[this.getCantAnos()];
            double aux;
            for(i=0;i<this.getCantAnos();i++){
                aux = 0;
                for(j=0; j<12;j++){
                    aux =+ this.obtenerTemp(i, j);
                }
                vector[i] = aux / 12;
                }
            return vector;
    }
    
@Override
    public String toString(Estacion e){
            String aux2 = "0";
            int i;
            String aux = e.getNombre()+ "  "+ e.getLatitud() +"  "+ e.getLongitud() +
                      "\n";
            for(i=0;i<this.getCantAnos();i++){
                aux2 = (this.getAnoInicio()+ i ) + this.obtenerPromedio()[i];
            }
                    
            
            return aux + aux2;
        }
}

	

