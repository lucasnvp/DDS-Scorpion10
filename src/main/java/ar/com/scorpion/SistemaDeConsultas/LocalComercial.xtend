package ar.com.scorpion.SistemaDeConsultas

import ar.com.scorpion.SistemaDeConsultas.Disponibilidad.DisponibilidadDelPoi
import java.util.ArrayList
import org.uqbar.geodds.Point

class LocalComercial extends Poi{
	
	double cercaniaDistancia
	String rubroDelPoi
	
	new(String nombreDelPoi, Double longitudDelPoi, Double latitudDelPoi, Double cercaniaDelPoi, String rubroDelLocal) {
		nombre = nombreDelPoi
		pointDelPoi = new Point(longitudDelPoi, latitudDelPoi)
		cercaniaDistancia = cercaniaDelPoi
		rubroDelPoi = rubroDelLocal
		palabrasClave = new ArrayList()
		//Configuro la disponibilidad del poi
		disponibilidadDelPoi = new DisponibilidadDelPoi()
	}
	
	override consultaDeCercania(Point consultaDePoint){
		seEncuentraAMenosDe(cercaniaDistancia, consultaDePoint)
	}
					
	override contieneExtra(String texto) {
		return (rubroDelPoi.contains(texto))
	}

}