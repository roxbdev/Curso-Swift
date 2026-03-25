func saludar(){
    print("hola como estan")
}
saludar()

func saludaramigo(nombre: String)
{
    print("hola \(nombre) !")
}
saludaramigo(nombre: "Roxana")
saludaramigo(nombre: "helen")
saludaramigo(nombre: "Marco")
saludaramigo(nombre: "Ana")
 
 
func calcularpromedio (n1: Double, n2: Double, n3:Double) ->Double
{
    let suma = n1 + n2 + n3
    let promedio = suma/3
    return promedio
}

let promedio = calcularpromedio(n1:10, n2:20, n3: 30)

 var nota = 5

func obtenerNotaFinal(nota:Double)-> String
{
    if (nota>=0 && nota < 4)
    {
        return "reprobo"
    }else if (nota >= 5 && nota < 6)
    {
        return " si aprobo pero ¡puede mejorar"
    }else if(nota >= 6 && nota <= 7)
    {
        return "felicidades"
        
    }else {
        return "hay un error en el sistema"
    }
                
}
obtenerNotaFinal(nota: 0)
obtenerNotaFinal(nota: 1)
obtenerNotaFinal(nota: 2)
obtenerNotaFinal(nota: 3)
obtenerNotaFinal(nota: 4)
obtenerNotaFinal(nota: 5)

