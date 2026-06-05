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

    var property intensidad

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
    var property peso

    method kilosPorCaloria()

    method tiempo()

    method pesoQuePierdePorRutina(_rutina){
        return _rutina.caloriasBajadas(self.tiempo()) / self.kilosPorCaloria()
    }

    method aplicarRutina(_rutina){
        if (self.puedeAplicar(_rutina)){
            peso -= self.pesoQuePierdePorRutina(_rutina)
        }
    }

    method puedeAplicar(_rutina)

}

class PersonaSedentaria inherits Persona{

    var property tiempo
    
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
        return _rutina.caloriasBajadas(self.tiempo()) > 10000
    }

    override method pesoQuePierdePorRutina(_rutina){
        return super(_rutina) -1
    }
}

