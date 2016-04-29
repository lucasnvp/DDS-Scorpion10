package ar.com.scorpion.SistemaDeConsultas

import java.util.ArrayList
import org.uqbar.geodds.Point

class LocalComercial extends Poi{
	
	double cercaniaDistancia
	String rubroDelPoi
	
	new(String nombreDelPoi, Double longitudDelPoi, Double latitudDelPoi, Double cercaniaDelPoi, String rubroDelLocal) {
		nombre = nombreDelPoi
		longitud = longitudDelPoi
		latitud = latitudDelPoi
		pointDelPoi = new Point(longitud, latitud)
		cercaniaDistancia = cercaniaDelPoi
		rubroDelPoi = rubroDelLocal
		palabrasClave = new ArrayList()
		//Configuro la disponibilidad del poi
		disponibilidadDelPoi = new DisponibilidadDelPoi()
	}
	
	override consultaDeCercania(Point consultaDePoint){
		seEncuentraAMenosDe(cercaniaDistancia, consultaDePoint)
	}
					
	override contiene(String texto) {
		return (super.contiene(texto) || rubroDelPoi.contains(texto))
	}

}
