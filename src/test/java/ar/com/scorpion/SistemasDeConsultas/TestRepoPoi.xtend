package ar.com.scorpion.SistemasDeConsultas

import ar.com.scorpion.SistemaDeConsultas.Banco
import ar.com.scorpion.SistemaDeConsultas.LocalComercial
import ar.com.scorpion.SistemaDeConsultas.ParadaDeColectivo
import ar.com.scorpion.SistemaDeConsultas.Poi
import ar.com.scorpion.SistemaDeConsultas.RepoPoi
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.joda.time.DateTime
import org.junit.After

class TestRepoPoi {
	
	Poi poiLocalComercial1
	Poi poiLocalComercial2
	Poi poiLocalComercial3
	Poi poiLocalComercial4
	
	@Before
	def init() {
		//LocalesComerciales
		poiLocalComercial1 = new LocalComercial("Starbucks", -34.483346, -58.489661, 500.0, "Cafeteria")
		poiLocalComercial1.configurarDisponibilidadDelPoi(7, 9, 0, 21, 0)
		poiLocalComercial2 = new LocalComercial("Burger King", -34.480581, -58.492341, 500.0, "Comidas Rapidas")
		poiLocalComercial2.configurarDisponibilidadDelPoi(7, 8, 0, 23, 0)
		poiLocalComercial3 = new LocalComercial("Starbucks", -34.528961, -58.481043, 500.0, "Cafeteria")
		poiLocalComercial3.configurarDisponibilidadDelPoi(7, 9, 0, 20, 0)
		poiLocalComercial4 = new LocalComercial("Carrousel", -34.453317, -58.541989, 1000.0, "Plaza")
		poiLocalComercial4.configurarDisponibilidadDelPoi(6, 10, 30, 13, 0)
		poiLocalComercial4.configurarDisponibilidadDelPoi(6, 17, 0, 20, 30)
		
		//Ingreso los bancos al repo
		RepoPoi.getInstance().create(new Banco("Banco Santander", -34.528961, -58.481043))
		//Ingreso las paradas de colectivo al repo
		RepoPoi.getInstance().create(new ParadaDeColectivo("Parada 1",-34.515246,-58.488491, "71"))
		//Ingreso los locales comerciales al repo
		RepoPoi.getInstance().create(poiLocalComercial1)
		RepoPoi.getInstance().create(poiLocalComercial2)
		RepoPoi.getInstance().create(poiLocalComercial3)
		RepoPoi.getInstance().create(poiLocalComercial4)
	}
	
	@After
	def restablecerSistema(){
		RepoPoi.getInstance().delete(poiLocalComercial1)
		RepoPoi.getInstance().delete(poiLocalComercial2)
		RepoPoi.getInstance().delete(poiLocalComercial3)
		RepoPoi.getInstance().delete(poiLocalComercial4)
	}
	
	@Test
	def testDeSize(){
		Assert.assertEquals(6, RepoPoi.instance.size)
	}
	
	@Test
	def primeraPuebaDelRepo(){
		var id = RepoPoi.instance.searchById(1).id
		Assert.assertEquals(1, id)
	}
	
	@Test
	/* Test "consultaDeDisponibilidad" Poi Banco True */
	def void testDisponibilidadBancoTrue(){
		val testFecha = new DateTime(2016, 1, 12, 12, 0)
		Assert.assertEquals(2, testFecha.getDayOfWeek)
		var banco = RepoPoi.instance.searchById(1)
		
		Assert.assertTrue(banco.consultaDeDisponibilidad(testFecha,"bancario"))
		
	}
}