let map: [String: Any] = ["key": "value",
                          "key2": "value 2",
                          "key3": 12]

var producto: [String: Any] = [
    "id": 0,
    "nombre": "PC Lenovo",
    "precio": 1000,
    "stock": 10,
    "promocion": true
]

let nombre = producto["nombre"] as! String
print(nombre)

producto["calificacion"] = 5
print(producto)

producto["stock"] = 1
producto["precio"] = 2000
print(producto)

producto.removeValue(forKey: "promocion")
print(producto)

producto["stock"] = nil
print(producto)

producto.removeAll()
print(producto)
