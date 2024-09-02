import wollok.game.*
import randomizer.*

object  manzana {

	const base = 5
	var madurez = 1
	var property position = randomizer.emptyPosition()

	method image() {
		return "manzana.png"
	}

	method energiaQueOtorga() {
		return base * madurez
	}

	method madurar() {
		madurez = madurez + 1
	}

	method esAtravesable() {
		return true
	}

	method colision(personaje) {
		personaje.comer(self)
		game.removeVisual(self)
	}

	method text() {
		return self.energiaQueOtorga().toString()
	}

}

object alpiste {

	var property position = randomizer.emptyPosition()
	const property energiaQueOtorga = (40 .. 100).anyOne()

	method image() {
		return "alpiste.png"
	}

	method esAtravesable() {
		return true
	}

	method colision(personaje) {
		personaje.comer(self)
		game.removeVisual(self)
	}

}

object comidaManager {

	const property comidas = []

	method crearComida() {
		if (comidas.size() < 3) {
			comidas.add([ manzanaFactory, alpisteFactory ].anyOne().crearComida())
		}
	}

}

object manzanaFactory {

	method crearComida() {
		const manzana = new Manzana()
		game.addVisual(manzana)
		game.onTick(5000, "MADURAR" + manzana.identity(), { manzana.madurar()})
	}

}

object alpisteFactory {

	method crearComida() {
		const alpiste = new Alpiste()
		game.addVisual(alpiste)
	}

}

