import wollok.game.*
import posiciones.*

object pepita {

	var energia = 100
	var property position = game.at(3, 8)
	const escenario = tablero
	var estadoPepita = vivo

	method estadoPepita(_estadoPepita) {
		if (estadoPepita != _estadoPepita) {
			estadoPepita = _estadoPepita
			estadoPepita.activar()
		}
	}

	method image() {
		return "pepita-" + estadoPepita + ".png"
	}

	method energia() = energia

	method comer(comida) {
		energia = energia + comida.energiaQueOtorga()
	}

	method atrapada() {
		self.estadoPepita(muerto)
	}

	method ganar() {
		self.estadoPepita(ganadora)
	}

	method text() = energia.toString()

	method textColor() = "FF00FF"

	method puedeMover(direccion) {
		return estadoPepita.puedeMover() && escenario.puedeIr(self.position(), direccion)
	}

	method tieneEnergia(){
		return energia > 100
	}
	method mover(direccion) {
		if (self.puedeMover(direccion)){
		position = direccion.siguiente(self.position())
		self.volar(1)
		}
	}

	method volar(cantidad) {
		self.gastarEnergia(cantidad * 9)
	}

	method gastarEnergia(cantidad) {
		energia -= cantidad
		if (energia< 0) {
			self.estadoPepita(muerto)
		}
	}

	method caer() {
		if (self.puedeMover(abajo)) {
			position = abajo.siguiente(self.position())
		}
	}

	method esAtravesable() {
		return true
	}

}

object vivo {

	method puedeMover() = true

	method activar() {
	}

}

object muerto {

	method puedeMover() = false

	method activar() {
		game.say(pepita, "Perdí!")
		game.schedule(3000, { game.stop()})
	}

}

object ganadora {

	method puedeMover() = false

	method activar() {
		game.say(pepita, "Gané!")
		game.schedule(3000, { 
			game.clear()})
	}

}

