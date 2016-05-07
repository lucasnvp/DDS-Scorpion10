package ar.com.scorpion.SistemaDeConsultas

import ar.com.scorpion.SistemaDeConsultas.Disponibilidad.DisponibilidadDelPoi
import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors
import org.uqbar.geodds.Point

@Accessors
class Banco extends Poi {
	
	String rubroDelPoi	
	String sucursal
	String gerente
	Collection<String> servicios
	
	new (){}
	new(String nombreDelPoi,Double longitudDelPoi,Double latitudDelPoi, String sucursal, String gerente) {
		nombre = nombreDelPoi
		pointDelPoi = new Point(longitudDelPoi, latitudDelPoi)
		rubroDelPoi = "bancario"
		palabrasClave = new ArrayList()
		servicios = new ArrayList()	
		this.sucursal = sucursal
		this.gerente = gerente	
		
		//Configuro la disponibilidad del poi
		disponibilidadDelPoi = new DisponibilidadDelPoi()
		disponibilidadDelPoi.horarioBancario()	

	}
	
	override contieneExtra(String texto) {
		return (rubroDelPoi.contains(texto))
	}
	
	def agregarServicio(String servicio) {
		servicios.add(servicio)
	}
}