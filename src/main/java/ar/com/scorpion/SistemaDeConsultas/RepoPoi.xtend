package ar.com.scorpion.SistemaDeConsultas

import org.uqbar.commons.model.CollectionBasedRepo
import java.util.function.Predicate

class RepoPoi extends CollectionBasedRepo<Poi> {
	
	static RepoPoi instance
	
 	static def getInstance() {
        if (instance == null) {
			instance = new RepoPoi
		}
        return instance
    }
	
	override createExample() {
		new Banco
	}
	
	override getEntityType() {
		typeof(Poi)
	}
	
	override protected getCriterio(Poi example) {
		null
	}
	     
	def getCriterioPorNombre(String nombre) {
	    [ Poi poi | poi.nombre.toLowerCase.contains(nombre.toLowerCase) ] as Predicate<Poi>
	}
	
	def getCriterioPorDireccion(String direccion){
		[ Poi poi | poi.direccion.toLowerCase.contains(direccion.toLowerCase) ] as Predicate<Poi>
	}
	
}
