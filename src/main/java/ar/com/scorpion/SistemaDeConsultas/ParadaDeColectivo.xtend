package ar.com.scorpion.SistemaDeConsultas

import org.joda.time.DateTime
import org.uqbar.geodds.Point
import java.util.ArrayList

class ParadaDeColectivo extends Poi{
	
	String numeroDeLinea;
		
	new(String nombreDelPoi,Double longitudDelPoi,Double latitudDelPoi, String n){
		nombre = nombreDelPoi
		pointDelPoi = new Point(longitudDelPoi, latitudDelPoi)

		numeroDeLinea = n
		palabrasClave = new ArrayList()
		
	}
	
	override consultaDeCercania(Point consultaDePoint){
		seEncuentraAMenosDe(100.0, consultaDePoint)
	}
	
	override consultaDeDisponibilidad(DateTime fecha, String rubroDelPoi){
		true
	}	
	
	override contieneExtra(String texto) {
		return (numeroDeLinea.equals(texto))
		
	}
}