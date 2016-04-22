package ar.com.scorpion.SistemaDeConsultas

import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.uqbar.geodds.Point

@Accessors
class Poi {
	String nombre
	Collection<String> palabrasClave
	/* Longitud (Norte Sur) X
	 * Latitud (Este Oeste) Y
	 */
	Double longitud
	Double latitud
	Point pointDelPoi
	
	String direccion
	DisponibilidadDelPoi disponibilidadDelPoi
	
	def esValido(){
		if( (nombre == "") || (latitud == null) || (longitud == null) ){
			throw new BusinessException("El poi no es valido")
		}
		
		true
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
		return (nombre.contains(texto) || (palabrasClave.findFirst[servicio | palabrasClave.contains(texto)] != null))
	}

	def agregarServicio(String nombreDelServicio,int diasDisponibles,int horaDeApertura,int minDeApertura,int horaDeCierre, int minDeCierre){
		
	}
	
	def addPalabraClave(String palabra) {
		palabrasClave.add(palabra)
	}
	
	def removePalabraClave(String palabra) {
		palabrasClave.remove(palabrasClave.findFirst[p | p.equals(palabra)])
	}}