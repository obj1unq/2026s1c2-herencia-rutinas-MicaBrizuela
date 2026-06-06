// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
class Rutina{
    method intensidad()

    method descanso(_tiempoPractica)

    method caloriasBajadas(_tiempo){
        return 100 * (_tiempo - self.descanso(_tiempo)) * self.intensidad()
    }
}


class Running inherits Rutina{

    const property intensidad

    override method descanso(_tiempoPractica){
        return if (_tiempoPractica > 20) {5} else {2}
    }
}

class Remo inherits Rutina(){

    override method intensidad(){
        return 1.3
    }

    override method descanso(_tiempoPractica){
        return _tiempoPractica / 5
    }
}


class Maraton inherits Running{

    override method caloriasBajadas(_tiempo){
        return super(_tiempo) * 2
    }
}

class RemoCompeticion inherits Remo(){

    override method intensidad(){
        return 1.7
    }

    override method descanso(_tiempoPractica){
        return 2.max(super(_tiempoPractica)-3)
    }
}


class Persona {
    var property peso //property para tests

    method kilosPorCaloria()

    method tiempo()

    method pesoQuePierdePor(_rutina){
        return self.caloriasQuemadasPor(_rutina) / self.kilosPorCaloria()
    }

    method caloriasQuemadasPor(_rutina){
        return _rutina.caloriasBajadas(self.tiempo())
    }

    method aplicarRutina(_rutina){
        if (self.puedeAplicar(_rutina)){
            peso -= self.pesoQuePierdePor(_rutina)
        }
    }

    method puedeAplicar(_rutina)

}

class PersonaSedentaria inherits Persona{

    const property tiempo
    
    override method kilosPorCaloria(){
        return 7000
    }

    override method puedeAplicar(_rutina){
        return peso > 50
    }


}

class PersonaAtleta inherits Persona{

    override method kilosPorCaloria(){
        return 8000
    }

    override method tiempo(){
        return 90
    }

    override method puedeAplicar(_rutina){
        return self.caloriasQuemadasPor(_rutina) > 10000
    }

    override method pesoQuePierdePor(_rutina){
        return super(_rutina) -1
    }
}

class Club{
    const property predios

    method elMejorPredioPara(_persona){
        return predios.max({predio => predio.cantidadDeCaloriasGastadasPor_SiSigueTodasLasRutinas(_persona)})
    }

    method prediosMasTranquiPara(_persona){
        return predios.filter({predio => predio.hayRutinasTranquiPara(_persona)})
    }

    method rutinasMasExigentesPara(_persona){
        return predios.map({predio => predio.rutinaMasExigentePara(_persona)})
    }
}

class Predio{
    const property rutinas

    method cantidadDeCaloriasGastadasPor_SiSigueTodasLasRutinas(_persona){
        return rutinas.sum({rutina => _persona.caloriasQuemadasPor(rutina)})
    }

    method hayRutinasTranquiPara(_persona){
        return rutinas.any({rutina => _persona.caloriasQuemadasPor(rutina) < 500})
    }

    method rutinaMasExigentePara(_persona){
        return rutinas.max({rutina => _persona.caloriasQuemadasPor(rutina)})
    }
}