class Personaje {
  var fuerza
  const property inteligencia
  var rol 

  method cambiarRol(otroRol) {
    rol = otroRol
  }

  method fuerza()= fuerza
  method rol() = rol

  method esInteligente()

  method rolEsGroso()=
    rol.esGroso(self)

  method potencialOfensivo()=
    fuerza * 10 + rol.fuerzaExtra()
  
  method esGroso()=
    self.esInteligente() or self.rolEsGroso()
}

class Orco inherits Personaje {
  override method esInteligente() = false
  override method potencialOfensivo()=
    super() + self.potencialOfensivo() * 1.1
}

class Humano inherits Personaje {
  override method esInteligente()= inteligencia > 50
}

class Rol {
  method fuerzaExtra()
  method esGroso(unPersonaje)
}

class Guerrero inherits Rol {
  override method fuerzaExtra()= 100
  override method esGroso(unPersonaje)= unPersonaje.fuerza() > 50
}
object brujo inherits Rol {
  override method fuerzaExtra()= 0
  override method esGroso(unPersonaje)= true
}
class Cazador inherits Rol {
  const property mascota 

  override method fuerzaExtra()= 
    if (mascota.tieneGarras()) {
      mascota.fuerza() * 2
    } else {
      mascota.fuerza()
    }

  override method esGroso(unPersonaje)=mascota.esLongeva()
}

class Mascota {
  const property fuerza
  var edad
  const property tieneGarras
  const property esLongeva

  method edad()= edad

  method aumentarEdad() {
    edad += 1
  }
}

class Ejercito {
  const tropas = []

  method agregarTropa(unaTropa) {
    tropas.add(unaTropa)
  }

  method potencialOfensivo()=
    tropas.sum({
      tropa => tropa.potencialOfensivo()
    })
  
  method tamanioEjercito()= tropas.size()

  method agregarTropas(otrasTropa) {
    tropas.add(otrasTropa)
  }
}