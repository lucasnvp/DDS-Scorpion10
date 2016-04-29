package ar.com.scorpion.SistemasDeConsultas

import ar.com.scorpion.SistemaDeConsultas.Banco
import ar.com.scorpion.SistemaDeConsultas.RepoPoI
import org.junit.Assert
import org.junit.Before
import org.junit.Test

class TestRepoPoi {
	
	@Before
	def init() {
		RepoPoI.getInstance().create(new Banco("Banco Santander", -34.528961, -58.481043))
	}
	
	@Test
	def primeraPuebaDelRepo(){
		var id = RepoPoI.instance.searchById(1).id
		Assert.assertEquals(1, id)
	}
	
}