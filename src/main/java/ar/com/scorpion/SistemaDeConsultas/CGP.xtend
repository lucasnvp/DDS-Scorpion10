package ar.com.scorpion.SistemaDeConsultas

import ar.com.scorpion.SistemaDeConsultas.Servicios.ServicioDelCGP
import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.uqbar.geodds.Point
import org.uqbar.geodds.Polygon

@Accessors
class CGP extends Poi{
	
	Polygon comuna
	Collection<ServicioDelCGP> serviciosDelCGP = new ArrayList()
	
	new(String nombreDelPoi,Double longitudDelPoi,Double latitudDelPoi) {
		nombre = nombreDelPoi
		longitud = longitudDelPoi
		latitud = latitudDelPoi
		pointDelPoi = new Point(longitud, latitud)

		comuna = new Polygon()
		comuna.add(pointDelPoi)
		palabrasClave = new ArrayList()
	}
	
	override agregarServicio(String nombreDelServicio,int diasDisponibles,int horaDeApertura,int minDeApertura,int horaDeCierre, int minDeCierre){
		serviciosDelCGP.add(new ServicioDelCGP( nombreDelServicio, diasDisponibles, horaDeApertura, minDeApertura, horaDeCierre, minDeCierre))
	}	
	
	override consultaDeCercania(Point consultaDePoint){
		comuna.isInside(consultaDePoint)
	}
		
	override consultaDeDisponibilidad(DateTime fecha, String rubroDelPoi){
		
		(serviciosDelCGP.findFirst[buscarRubro(rubroDelPoi)]).estasDisponible(fecha, rubroDelPoi) 
		
	}
		
	override contiene(String texto) {
		return (super.contiene(texto) || (serviciosDelCGP.findFirst[buscarRubro(texto)] != null))
		/* for(String s : servicios) {
			if (s.contains(texto)) return true;
		} */
	}	
	
}
	