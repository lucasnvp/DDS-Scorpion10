package ar.com.scorpion.SistemaDeConsultas

import java.util.ArrayList
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point

@Accessors
class Banco extends Poi{
	
	String rubroDelPoi
	
	new(){}
	new(String nombreDelPoi,Double longitudDelPoi,Double latitudDelPoi) {
		nombre = nombreDelPoi
		longitud = longitudDelPoi
		latitud = latitudDelPoi
		pointDelPoi = new Point(longitud, latitud)
		rubroDelPoi = "bancario"
		palabrasClave = new ArrayList()
		
		//Configuro la disponibilidad del poi
		disponibilidadDelPoi = new DisponibilidadDelPoi()
		disponibilidadDelPoi.horarioBancario()	

	}
	
	override contiene(String texto) {
		return (super.contiene(texto) || rubroDelPoi.contains(texto))
	}
}
