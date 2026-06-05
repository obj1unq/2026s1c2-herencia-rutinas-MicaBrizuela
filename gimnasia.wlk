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
