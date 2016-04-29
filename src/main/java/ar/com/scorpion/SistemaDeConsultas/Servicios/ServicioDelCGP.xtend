package ar.com.scorpion.SistemaDeConsultas.Servicios

import ar.com.scorpion.SistemaDeConsultas.DisponibilidadDelPoi
import org.joda.time.DateTime

class ServicioDelCGP {
	String nombreDelServicio
	DisponibilidadDelPoi disponibilidadDelPoi
	
	new(String nombreDelNuevoServicio,int diaDeLaSemanaDelPoi,int horaDeAperturaDelPoi,int minDeAperturaDelPoi,int horaDeCierreDelPoi, int minDeCierreDelPoi) {
		nombreDelServicio = nombreDelNuevoServicio

		//Configuro la disponibilidad del poi
		disponibilidadDelPoi = new DisponibilidadDelPoi()
		disponibilidadDelPoi.horarioDelLocal(diaDeLaSemanaDelPoi, horaDeAperturaDelPoi, minDeAperturaDelPoi, horaDeCierreDelPoi, minDeCierreDelPoi)
	}
	
	def estasDisponible(DateTime fecha, String rubroDelCGP){
		disponibilidadDelPoi.consultaDeDisponibilidad( fecha, rubroDelCGP)
	}
	
	def buscarRubro(String rubroDelCGP){
		nombreDelServicio.contains(rubroDelCGP)
	}
}