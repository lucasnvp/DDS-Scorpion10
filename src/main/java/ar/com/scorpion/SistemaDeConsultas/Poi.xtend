package ar.com.scorpion.SistemaDeConsultas

import ar.com.scorpion.SistemaDeConsultas.Disponibilidad.DisponibilidadDelPoi
import ar.com.scorpion.SistemaDeConsultas.Exception.BusinessException
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.uqbar.commons.model.Entity
import org.uqbar.geodds.Point

@Accessors
abstract class Poi extends Entity {
	
	String nombre
	Collection<String> palabrasClave

	Point pointDelPoi
	
	String direccion
	DisponibilidadDelPoi disponibilidadDelPoi
	
	override validateCreate(){
		if( (nombre == "") || (pointDelPoi == null)){
			throw new BusinessException("El poi no es valido")
		}
	}

	def mtsAKms(Double mts){
		return mts * 0.001
	}
	
	def seEncuentraAMenosDe(Double mts, Point otherPoint){
		val kms = mtsAKms(mts)
		return ( kms > pointDelPoi.distance(otherPoint))
	}
	
	def consultaDeCercania(Point consultaDePoint){
		seEncuentraAMenosDe(500.0, consultaDePoint)
	}
	
	def consultaDeDisponibilidad(DateTime fecha, String rubroDelPoi){
		disponibilidadDelPoi.consultaDeDisponibilidad( fecha, rubroDelPoi)
	}
	
	def configurarDisponibilidadDelPoi(int diasHabiles,int horaDeAperturaDelPoi,int minDeAperturaDelPoi,int horaDeCierreDelPoi, int minDeCierreDelPoi){
		disponibilidadDelPoi.horarioDelLocal(diasHabiles, horaDeAperturaDelPoi, minDeAperturaDelPoi, horaDeCierreDelPoi, minDeCierreDelPoi)
	}
	
	def contiene(String texto){
		return (nombre.contains(texto) || (palabrasClave.exists[pClave | pClave.contains(texto)]) || contieneExtra(texto))
	}
	
	def contieneExtra(String texto) {
		return false
	}

	def void agregarServicio(String nombreDelServicio,int diasDisponibles,int horaDeApertura,int minDeApertura,int horaDeCierre, int minDeCierre) {
		
	}
		
	
	def addPalabraClave(String palabra) {
		palabrasClave.add(palabra)
	}
	
	def removePalabraClave(String palabra) {
		palabrasClave.remove(palabra)
	}

}
