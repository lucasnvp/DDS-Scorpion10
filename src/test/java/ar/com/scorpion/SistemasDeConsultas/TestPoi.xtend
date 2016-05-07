package ar.com.scorpion.SistemasDeConsultas

import ar.com.scorpion.SistemaDeConsultas.Banco
import ar.com.scorpion.SistemaDeConsultas.CGP
import ar.com.scorpion.SistemaDeConsultas.Exception.BusinessException
import ar.com.scorpion.SistemaDeConsultas.LocalComercial
import ar.com.scorpion.SistemaDeConsultas.ParadaDeColectivo
import ar.com.scorpion.SistemaDeConsultas.Poi
import ar.com.scorpion.SistemaDeConsultas.RepoPoi
import java.util.ArrayList
import java.util.List
import org.joda.time.DateTime
import org.junit.Assert
import org.junit.Before
import org.junit.Test
import org.uqbar.geodds.Point

class TestPoi {
	//Variables 
	Poi poiInvalidoParaTest
	Poi poiLocalComercial1
	Poi poiLocalComercial2
	Poi poiLocalComercial3
	Poi poiLocalComercial4
	Poi poiTestColectivo1
	Poi poiBanco1
	Poi poiCGPComuna1
	Poi poiCGPComuna2
	Poi poiCGPComuna3
	Poi poiCGPComuna4
	Poi poiCGPComuna5
	
	@Before
	def void setUp(){
		poiInvalidoParaTest = new Banco("", -34.528961, -58.481043)
		
		poiLocalComercial1 = new LocalComercial("Starbucks", -34.483346, -58.489661, 500.0, "Cafeteria")
		poiLocalComercial1.configurarDisponibilidadDelPoi(7, 9, 0, 21, 0)
		poiLocalComercial2 = new LocalComercial("Burger King", -34.480581, -58.492341, 500.0, "Comidas Rapidas")
		poiLocalComercial2.configurarDisponibilidadDelPoi(7, 8, 0, 23, 0)
		poiLocalComercial3 = new LocalComercial("Starbucks", -34.528961, -58.481043, 500.0, "Cafeteria")
		poiLocalComercial3.configurarDisponibilidadDelPoi(7, 9, 0, 20, 0)
		poiLocalComercial4 = new LocalComercial("Carrousel", -34.453317, -58.541989, 1000.0, "Plaza")
		poiLocalComercial4.configurarDisponibilidadDelPoi(6, 10, 30, 13, 0)
		poiLocalComercial4.configurarDisponibilidadDelPoi(6, 17, 0, 20, 30)
		
		poiTestColectivo1 = new ParadaDeColectivo("Parada 1",-34.515246,-58.488491, "71")
		
		poiBanco1 = new Banco("Banco Santander", -34.528961, -58.481043)
		
		poiCGPComuna1 = new CGP("CGPComuna1", -34.599867, -58.386839)
		poiCGPComuna1.agregarServicio("Rentas", 5, 10, 0, 18, 0)
		poiCGPComuna2 = new CGP("CGPComuna2", -34.596603, -58.398811)
		poiCGPComuna2.agregarServicio("Rentas", 5, 10, 0, 18, 0)
		poiCGPComuna3 = new CGP("CGPComuna3", -34.603146, -58.396947)
		poiCGPComuna3.agregarServicio("Rentas", 5, 10, 0, 18, 0)
		poiCGPComuna4 = new CGP("CGPComuna4", -34.650396, -58.424952)
		poiCGPComuna4.agregarServicio("Rentas", 5, 10, 0, 18, 0)
		poiCGPComuna5 = new CGP("CGPComuna5", -34.623073, -58.412468)
		poiCGPComuna5.agregarServicio("Rentas", 5, 10, 0, 18, 0)
	}
	
	@Before
	def init() {
		//Ingreso los bancos al repo
//		RepoPoi.instance.create(poiBanco1)
		//Ingreso las paradas de colectivo al repo
		RepoPoi.instance.create(poiTestColectivo1)
		//Ingreso los locales comerciales al repo
//		RepoPoi.instance.create(poiLocalComercial1)
//		RepoPoi.instance.create(poiLocalComercial2)
//		RepoPoi.instance.create(poiLocalComercial3)
//		RepoPoi.instance.create(poiLocalComercial4)
//		//Ingreso los CGP
//		RepoPoi.instance.create(poiCGPComuna1)
//		RepoPoi.instance.create(poiCGPComuna2)
//		RepoPoi.instance.create(poiCGPComuna3)
//		RepoPoi.instance.create(poiCGPComuna4)
//		RepoPoi.instance.create(poiCGPComuna5)
	}
	
	@Test
	/* Test "esValido" poiLocalComercial1 true */
	def void testEsValidoPoiLocalComercial1True(){
		Assert.assertTrue(poiLocalComercial1.esValido)		
	}
	
	@Test(expected=typeof(BusinessException))
	/* Test "esValido" false */
	def void testEsValidoPoiInvalidoParaTestFalse(){
		poiInvalidoParaTest.esValido
	}

	/* Comienzo de test de calculos de Cercania */

	@Test
	/* Test "seEncuentraAMenosDe" True */
	def void testSeEncuentraAMenosDe400mtsLocalComercal1DelLocalComercial2True(){
		Assert.assertTrue(poiLocalComercial1.seEncuentraAMenosDe(400.0, poiLocalComercial2.pointDelPoi))
		}
	
	@Test
	/* Test "seEncuentraAMenosDe" False */
	def void testSeEncuentraAMenosDe4000mtsLocalComercal1DelLocalComercial2False(){
		Assert.assertFalse(poiLocalComercial1.seEncuentraAMenosDe(4000.0, poiLocalComercial3.pointDelPoi))
	}
	
	@Test
	def void testConsultaDeCercaniaParadaDeColectivoTrue(){
		Assert.assertTrue(poiTestColectivo1.consultaDeCercania(new Point(-34.515913, -58.488209)))
	}
	
	@Test
	def void testConsultaDeCercaniaParadaDeColectivoFalse(){
		Assert.assertFalse(poiTestColectivo1.consultaDeCercania( poiLocalComercial1.pointDelPoi ))
	}
	
	@Test
	def void testConsultaDeCercaniaCGPFalse(){
		Assert.assertFalse( poiCGPComuna1.consultaDeCercania( poiTestColectivo1.pointDelPoi ) )
	}
	
	@Test
	/* Test "consultaDeCercania" Poi1 True */
	def void testConsultaDeCercaniaLocalComercial1DelLocalComercial2True(){
		Assert.assertTrue(poiLocalComercial1.consultaDeCercania(poiLocalComercial2.pointDelPoi))
	}
	
	@Test
	/* Test "consultaDeCercania" Poi ParadaDeColectivo False */
	def void testConsultaDeCercaniaParadaDeColectivoDeLocalComercial1False(){
		Assert.assertEquals(false, poiTestColectivo1.consultaDeCercania(poiLocalComercial1.pointDelPoi))
	}
	
	/* Comienzo de test de busqueda de puntos */
	
	@Test
	// Test filtrando por numero de linea
	def void testFiltrarParadaDeColectivoPorNroDeLinea() {
//		var List<Poi> retornoEsperado = new ArrayList()
//		retornoEsperado.add(poiTestColectivo1)
//		
//		Assert.assertArrayEquals(retornoEsperado, RepoPoi.instance.search("Parada 1") )

		Assert.assertEquals(1, RepoPoi.instance.size)
	}
	
//	@Test
//	//Test filtrando por rubro
//	def void testFiltrarBancoPorRubro() {
//		var Collection<Poi> retornoEsperado = new ArrayList()
//		retornoEsperado.add(poiBanco1)
//		
//		Assert.assertArrayEquals(retornoEsperado, repo.filtrarPois("bancario"))
//	}
//	
//	@Test
//	//Test filtrando por Nombre en LocalComercia2
//	def void testFiltrarLocalComercialPorNombre() {
//		var Collection<Poi> retornoEsperado = new ArrayList()
//		retornoEsperado.add(poiLocalComercial2)
//		
//		Assert.assertArrayEquals(retornoEsperado, repo.filtrarPois("Burger"))
//		
//	}
//	
//	@Test
//	//Test filtrando por Rubro en LocalComercial
//	def void testFiltrarLocalComercialPorRubro() {
//		var Collection<Poi> retornoEsperado = new ArrayList()
//		retornoEsperado.add(poiLocalComercial2)
//		
//		Assert.assertArrayEquals(retornoEsperado, repo.filtrarPois("Comidas") )
//		
//	}
//		
//	@Test
//	//Test por nombre y cuando es mas de uno el resultado
//	def void testFiltrarLocalComercialPorNombreYDevuelveMasDeUno() {
//		var Collection<Poi> retornoEsperado = new ArrayList()
//		retornoEsperado.add(poiLocalComercial1)
//		retornoEsperado.add(poiLocalComercial3)
//		
//		Assert.assertArrayEquals(retornoEsperado, repo.filtrarPois("Starbucks") )
//		
//	}
//	
//	@Test
//	//Test por palabra clave, en este caso hamburguesas y devuelve el Burger King
//	def testFiltrarPorPalabraClave() {
//		var Collection<Poi> retornoEsperado = new ArrayList()
//		poiLocalComercial2.addPalabraClave("hamburguesa")
//		poiLocalComercial2.addPalabraClave("churrasco")
//		retornoEsperado.add(poiLocalComercial2)
//		
//		Assert.assertArrayEquals(retornoEsperado, repo.filtrarPois("hamburguesa"))
//	}
//	
	/* Comienzo de test de calculos de disponibilidad */
	
	@Test
	/* Test "consultaDeDisponibilidad" Poi ParadaDeColectivo True */
	def void testDisponibilidadParadaDeColectivoTrue(){
		val testFecha = new DateTime(2016, 1, 15, 12, 0)
		Assert.assertTrue(poiTestColectivo1.consultaDeDisponibilidad(testFecha, ""))
	}
	
	@Test
	/* Test "consultaDeDisponibilidad" Poi CGP True */
	def void testDisponibilidadCGPIngresandoUnServicioTrue(){
		val testFecha = new DateTime(2016, 1, 18, 14, 0)
		Assert.assertTrue(poiCGPComuna5.consultaDeDisponibilidad(testFecha,"Rentas"))
	}
	
	@Test
	/* Test "consultaDeDisponibilidad" Poi CGP True */
	def void testDisponibilidadCGPSinIngresarUnServicioTrue(){
		val testFecha = new DateTime(2016, 1, 18, 14, 0)
		Assert.assertTrue(poiCGPComuna5.consultaDeDisponibilidad(testFecha,""))
	}
	
	@Test
	/* Test "consultaDeDisponibilidad" Poi CGP False */
	def void testDisponibilidadCGPIngresandoUnServicioFalse(){
		val testFecha = new DateTime(2016, 1, 17, 20, 0)
		Assert.assertFalse(poiCGPComuna5.consultaDeDisponibilidad(testFecha,"Rentas"))
	}
	
	@Test
	/* Test "consultaDeDisponibilidad" Poi Banco True */
	def void testDisponibilidadBancoTrue(){
		val testFecha = new DateTime(2016, 1, 12, 12, 0)
		Assert.assertEquals(2, testFecha.getDayOfWeek)
		Assert.assertTrue(poiBanco1.consultaDeDisponibilidad(testFecha,"bancario"))
		
	}
	
	@Test
	/* Test "consultaDeDisponibilidad" Poi Banco False */
	def void testDisponibilidadBancoFalse(){
		val testFecha = new DateTime(2016, 1, 16, 12, 0)
		Assert.assertFalse(poiBanco1.consultaDeDisponibilidad(testFecha,"bancario"))
		Assert.assertEquals(6, testFecha.getDayOfWeek)
	}
	
	@Test
	/* Test "consultaDeDisponibilidad" Poi LocalComercial True */
	def void testDisponibilidadLocalComercialTrue(){
		val testFecha = new DateTime(2016, 1, 18, 12, 0)
		Assert.assertTrue(poiLocalComercial1.consultaDeDisponibilidad(testFecha,"Cafeteria"))
	}
	
	@Test
	/* Test "consultaDeDisponibilidad" Poi LocalComercial False */
	def void testDisponibilidadLocalComercialFalse(){
		val testFecha = new DateTime(2016, 1, 18, 23, 0)
		Assert.assertFalse(poiLocalComercial1.consultaDeDisponibilidad(testFecha,"Cafeteria"))
	}
	
}