package ar.com.scorpion.SistemaDeConsultas

import java.util.function.Predicate
import org.uqbar.commons.model.CollectionBasedRepo
import java.util.List

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
		
	def getCriterioPorTexto(String texto) {
		[ Poi poi | poi.nombre.equals(texto)] 
	}
	
	def search(String texto) {
    	allInstances.filter [ poi | poi.nombre.equals(texto) ]
	}
	
	def size(){
		allInstances.size
	}
	
}
