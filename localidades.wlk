class Localidad {
  const property habitantes = []

  method potencialDefensivo()=
    habitantes.sum({
      personaje => personaje.potencialOfensivo()
    })

  method sufrirInvacion(invasores) {
    if (invasores.potencialOfensivo() > habitantes.potencialDefensivo()) {
      invasores.ocuparLocalidad(self)
    }
  }
}

class Aldea inherits Localidad {
  const property maximoDeHabitantes
}

class Ciudad inherits Localidad {

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

  method invadir(unaLocalidad) {
    unaLocalidad.sufrirInvacion(self)
  }
  
  method tropasMasFuertes()=

  method ocuparLocalidad(unaLocalidad) {
    unaLocalidad.habitantes().clear()
    if (tropas.size() > unaLocalidad.cantidadMaximaHabitantes()) {
      unaLocalidad.habitantes().addAll(self.tropasMasFuertes())
    } else {
      unaLocalidad.habitantes().addAll(tropas)
    }
  }
}