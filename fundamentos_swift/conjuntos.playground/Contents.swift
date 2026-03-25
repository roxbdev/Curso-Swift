var animales: Set<String> = Set(["Gato","Perro","Conejo","Gallo"])
var otroanimales = Set<String>()

print(animales)

let contaanimales = animales.count
let otroanimalitos = otroanimales.count

animales.insert("cerdo")

print(animales)

animales.insert("Cerdo")

print(animales)

animales.remove("Cerdito")

animales.removeAll()

let swift = Set<String> (["Eloy","Hugo","Lucas","Rox"])
let android = Set<String> (["Jesus","Maria","Jose","Juan", "Hugo", "Eloy"])

let union = swift.union(android)
print(union)

let interseccion = swift.intersection(android)
print(interseccion)

let resta = swift.subtracting(android)
print(resta)

let resta2 = android.subtracting(swift)
print(resta2)

let diff = swift.symmetricDifference(android)
print(diff)
