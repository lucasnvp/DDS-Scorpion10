package ar.com.scorpion.SistemaDeConsultas.Disponibilidad

import org.joda.time.DateTime
import org.joda.time.Interval

class IntervalosDeDisponibilidad {
	int diaDeLaSemana
	int horaDeApertura
	int minDeApertura
	int horaDeCierre
	int minDeCierre
	Interval intervaloDeTrabajo
	
	new(int diaDeLaSemanaDelPoi,int horaDeAperturaDelPoi,int minDeAperturaDelPoi,int horaDeCierreDelPoi, int minDeCierreDelPoi){
		diaDeLaSemana = diaDeLaSemanaDelPoi
		horaDeApertura = horaDeAperturaDelPoi
		minDeApertura = minDeAperturaDelPoi
		horaDeCierre = horaDeCierreDelPoi
		minDeCierre = minDeCierreDelPoi
	}
	
	def consultaDeDisponibilidad(DateTime fecha){
		
		val start = new DateTime(fecha.getYear,fecha.getMonthOfYear,fecha.getDayOfMonth, horaDeApertura, minDeApertura)
		val end = new DateTime(fecha.getYear,fecha.getMonthOfYear,fecha.getDayOfMonth, horaDeCierre, minDeCierre)
		intervaloDeTrabajo = new Interval(start, end)
		
		diaDeLaSemana == fecha.getDayOfWeek && intervaloDeTrabajo.contains(fecha)

	}
}