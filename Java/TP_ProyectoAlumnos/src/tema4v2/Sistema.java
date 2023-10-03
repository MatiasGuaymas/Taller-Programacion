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
public class Sistema {
	private double [][] matriz;
	private int anoInicio;
	private int cantAnos;
	
	public Sistema(){
		
	}
	
	public Sistema(int n, int a){
		matriz = new double [n][12];
		this.anoInicio = a;
		this.cantAnos = n;
		this.cargarMatriz();
	}
        
        public int getCantAnos(){
            return this.cantAnos;
        }
	
        public int getAnoInicio(){
            return this.anoInicio;
        }
        
	private void cargarMatriz(){
		int i, j;
		for(i=0;i<this.cantAnos;i++){
			for(j=0; j< 12;j++ )
				matriz[i][j] = 80.0;
		}
	}
		
	public void registrarTemp(int a, int m, double temp){
		this.matriz[a][m] = temp;
	} 
		
	public double obtenerTemp(int a, int m){
		return this.matriz[a][m];
	}
        
        public int tempMesMaximo(){
            int i, j;
            double max = -999;
            int maxano = -1;
            for(i=0;i<this.cantAnos;i++){
                for(j=0;j<12;j++){
                    if(this.obtenerTemp(i,j) > max){
                        max = this.obtenerTemp(i, j);
                        maxano = j;
                    }
                }
            }
            return maxano;
        }
            
        public int tempAnoMaximo(int mes){
            int ano, i;
            double max = -999;
            ano = -1;
            for(i=0;i<this.cantAnos;i++){
                if(this.obtenerTemp(i, mes) > max){
                    max = this.obtenerTemp(i, mes);
                    ano = i;
                }
            }
            return ano;
        }
        
        public String toString(Estacion e){
            String aux = "En el mes  " + this.tempMesMaximo() +  " y en el anio " + this.tempAnoMaximo(this.tempMesMaximo())+ " hubo la temperatura maxima de " + this.obtenerTemp(this.tempAnoMaximo(this.tempMesMaximo()), this.tempMesMaximo());
            return aux;
        }
}
