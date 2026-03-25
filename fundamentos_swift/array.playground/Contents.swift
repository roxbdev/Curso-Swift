var frutas:   [String] = ["Manzana","Banana", "Piña", "Sandia","sandia"]

let contarfrutas = frutas.count
if (contarfrutas > 0)
{
    let primer = frutas[2]
    print(primer)
}

frutas.append("fresa") //insertar
print(frutas)

frutas.insert("Uva", at: 3) //insertar en una posiicion espe cifica


var nuevasfrutas = ["Naranja","Coco"]
frutas.append(contentsOf: nuevasfrutas)
print(frutas)

let existe = frutas.contains("Naranja")



frutas.remove(at: 3)
print(frutas)
frutas.removeLast()
print(frutas)



