package ar.com.scorpion.SistemaDeConsultas

import ar.com.scorpion.SistemaDeConsultas.Servicios.ServicioDelCGP
import java.util.ArrayList
import java.util.Collection
import org.eclipse.xtend.lib.annotations.Accessors
import org.joda.time.DateTime
import org.uqbar.geodds.Point
import org.uqbar.geodds.Polygon

@Accessors
class CGP extends Poi {

	Polygon comuna
	Collection<ServicioDelCGP> serviciosDelCGP = new ArrayList()

	new(String nombreDelPoi, Double longitudDelPoi, Double latitudDelPoi) {
		nombre = nombreDelPoi
		pointDelPoi = new Point(longitudDelPoi, latitudDelPoi)

		comuna = new Polygon()
		comuna.add(pointDelPoi)
		palabrasClave = new ArrayList()
	}

	override agregarServicio(String nombreDelServicio, int diasDisponibles, int horaDeApertura, int minDeApertura,
		int horaDeCierre, int minDeCierre) {
		serviciosDelCGP.add(
			new ServicioDelCGP(nombreDelServicio, diasDisponibles, horaDeApertura, minDeApertura, horaDeCierre,
				minDeCierre))
	}

	override consultaDeCercania(Point consultaDePoint) {
		comuna.isInside(consultaDePoint)
	}

	override consultaDeDisponibilidad(DateTime fecha, String rubroDelPoi) {

		(serviciosDelCGP.findFirst[buscarServicio(rubroDelPoi)]).estasDisponible(fecha, rubroDelPoi)

	}

	override contieneExtra(String texto) {
		return ((serviciosDelCGP.exists[servicio | servicio.buscarServicio(texto)]))
	}

}
