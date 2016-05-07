package ar.com.scorpion.SistemaDeConsultas.Disponibilidad

import ar.com.scorpion.SistemaDeConsultas.Disponibilidad.IntervalosDeDisponibilidad
import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime

@Accessors 
class DisponibilidadDelPoi {
	
	/* Array de dias de la semana
	 * 1 = Lunes | 2 = Martes | 3 = Miercoles | 4 = Jueves | 5 = Viernes 
	 * 6 = Sabado | 7 = Domingo
	 */
	 
	ArrayList<IntervalosDeDisponibilidad> disponibilidades = new ArrayList()
	
	def add(int dia, int horaDeApertura, int minDeApertura, int horaDeCierre, int minDeCierre){
		disponibilidades.add(new IntervalosDeDisponibilidad(dia, horaDeApertura, minDeApertura, horaDeCierre, minDeCierre))
	}
	
	def horarioBancario(){
		for (i : 0 ..< 5) {
			disponibilidades.add(new IntervalosDeDisponibilidad(i, 10, 0, 15, 0))
		}

	}
	
	def horarioDelLocal(int cantDeDias,int horaDeApertura, int minDeApertura, int horaDeCierre, int minDeCierre){
		for (i : 0 ..< cantDeDias) {
			disponibilidades.add(new IntervalosDeDisponibilidad(i, horaDeApertura, minDeApertura, horaDeCierre, minDeCierre))
		}
	}
	 	
	def consultaDeDisponibilidad(DateTime fecha, String rubro){
		disponibilidades.exists[intervalosDeDisponibilidad | intervalosDeDisponibilidad.consultaDeDisponibilidad(fecha)]
	}
	
}
