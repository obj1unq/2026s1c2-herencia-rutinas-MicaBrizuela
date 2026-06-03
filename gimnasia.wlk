class Rutina{
    const property tiempo
    var intensidad

    method intensidad(){
        return intensidad
    }

    method intensidad(_intensidad){
        intensidad = _intensidad
    }

    method descanso()

    method caloriasBajadas(){
        return 100 * (tiempo - self.descanso()) * intensidad
    }
}


class Running inherits Rutina{
    override method descanso(){
        return if (tiempo > 20) {5} else {2}
    }
}

class Remo inherits Rutina{
    
    override method intensidad(){
        return 1.3
    }

    override method descanso(){
        return tiempo / 5
    }
}