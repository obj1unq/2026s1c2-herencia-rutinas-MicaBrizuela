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
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
// gimnasia.wlk
class Rutina{
    method intensidad() //hook

    method descanso(_tiempoPractica) //hook

    method caloriasQueBaja(_tiempo){ //nombre caloriasBajadas sugiere orden
        return 100 * (_tiempo - self.descanso(_tiempo)) * self.intensidad() //template method
    }

    method esTranquiAlPracticarlaPor(_minutos){
        return self.caloriasQueBaja(_minutos) < 500
    }
}


class Running inherits Rutina{

    const intensidad //mal property, renombrar metodo para que no haya efectos adversos

    override method intensidad(){
        return intensidad
    }

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

    override method caloriasQueBaja(_tiempo){
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

    method kilosPorCaloria() //hook

    method tiempo() //hook

    method pesoQuePierdePor(_rutina){
        return self.caloriasQuemadasPor(_rutina) / self.kilosPorCaloria()
    }

    method caloriasQuemadasPor(_rutina){
        return _rutina.caloriasQueBaja(self.tiempo())
    }

    method aplicarRutina(_rutina){
        self.verificarPuedoAplicar(_rutina)
        peso -= self.pesoQuePierdePor(_rutina)
    }

    method verificarPuedoAplicar(_rutina){ //template method, porque usa metodos abstractos
        if ( not self.puedeAplicar(_rutina)){
            self.error("No puedo aplicar esta rutina")
        }
    }

    method puedeAplicar(_rutina) // hook method, porque se necesita completar por sus subclases para ser instanciadas

}

class PersonaSedentaria inherits Persona{

    const tiempo

    override method tiempo(){
        return tiempo
    }
    
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
    const predios //property MAL retornar colecciones es una mala practica

    method elMejorPredioPara(_persona){
        // return predios.max({predio => predio.cantidadDeCaloriasGastadasPor_SiSigueTodasLasRutinas(_persona)})
        return predios.max({predio => predio.caloriasQueBajanTodasEn(_persona.tiempo())})
    }

    method prediosMasTranquiPara(_persona){
        return predios.filter({predio => predio.hayRutinasTranquisDe(_persona.tiempo())})
        // return predios.filter({predio => predio.hayRutinasTranquiPara(_persona)})
    }

    method rutinasMasExigentesPara(_persona){
        return predios.map({predio => predio.rutinaMasExigenteDe(_persona.tiempo())}).asSet()
        // return predios.map({predio => predio.rutinaMasExigentePara(_persona)}).asSet()
    }
}

class Predio{
    const rutinas //property MAL SRAA

    method caloriasQueBajanTodasEn(_minutos){
        return rutinas.sum({rutina => rutina.caloriasQueBaja(_minutos)})
    }

    method hayRutinasTranquisDe(_minutos){
        return rutinas.any({rutina => rutina.esTranquiAlPracticarlaPor(_minutos)})
    }

    method rutinaMasExigenteDe(_minutos){
        return rutinas.max({rutina => rutina.caloriasQueBaja(_minutos)})
    }

    // method cantidadDeCaloriasGastadasPor_SiSigueTodasLasRutinas(_persona){
    //     return rutinas.sum({rutina => _persona.caloriasQuemadasPor(rutina)}) 
    //     //preguntar en clase otra forma de pensar a la solucion
    // }

    // method hayRutinasTranquiPara(_persona){
    //     return rutinas.any({rutina => _persona.caloriasQuemadasPor(rutina) < 500})
    // }

    // method rutinaMasExigentePara(_persona){
    //     return rutinas.max({rutina => _persona.caloriasQuemadasPor(rutina)})
    // }
}