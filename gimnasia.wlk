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
    var intensidad

    method intensidad(){
        return intensidad
    }

    method intensidad(_intensidad){
        intensidad = _intensidad
    }

    method descanso(_tiempoPractica)

    method caloriasBajadas(_tiempo){
        return 100 * (_tiempo - self.descanso(_tiempo)) * intensidad
    }
}


class Running inherits Rutina{
    override method descanso(_tiempoPractica){
        return if (_tiempoPractica > 20) {5} else {2}
    }
}

class Remo inherits Rutina(intensidad=1.3){

    override method intensidad(_intensidad){}

    override method descanso(_tiempoPractica){
        return _tiempoPractica / 5
    }
}


