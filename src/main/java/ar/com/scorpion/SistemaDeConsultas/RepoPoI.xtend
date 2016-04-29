package ar.com.scorpion.SistemaDeConsultas

import org.uqbar.commons.model.CollectionBasedRepo
import java.util.function.Predicate

class RepoPoI extends CollectionBasedRepo<Poi> {
	
	static RepoPoI instance
	
 	static def getInstance() {
        if (instance == null) {
			instance = new RepoPoI
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
