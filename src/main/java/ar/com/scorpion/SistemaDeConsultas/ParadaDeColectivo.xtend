package ar.com.scorpion.SistemaDeConsultas

import org.joda.time.DateTime
import org.uqbar.geodds.Point
import java.util.ArrayList

class ParadaDeColectivo extends Poi{
	
	String numeroDeLinea;
		
	new(String nombreDelPoi,Double longitudDelPoi,Double latitudDelPoi, String n){
		nombre = nombreDelPoi
		longitud = longitudDelPoi
		latitud = latitudDelPoi
		pointDelPoi = new Point(longitud, latitud)

		numeroDeLinea = n
		palabrasClave = new ArrayList()
		
	}
	
	override consultaDeCercania(Point consultaDePoint){
		seEncuentraAMenosDe(100.0, consultaDePoint)
	}
	
	override consultaDeDisponibilidad(DateTime fecha, String rubroDelPoi){
		true
	}	
	
	override contiene(String texto) {
		return (super.contiene(texto) || numeroDeLinea.equals(texto))
		
	}
}
