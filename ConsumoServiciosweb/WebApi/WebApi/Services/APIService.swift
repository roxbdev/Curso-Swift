//
//  APIService.swift
//  WebApi
//
//  Created by Rox on 4/4/26.
//

import Foundation

class APIService { // unaa solaa instancia en toda la app
    
    static let shared = APIService()
    
    func fetchUsers() async throws -> [User] { // deevuelve un arreglo de usuarios
        let url = URL(string: "https://jsonplaceholder.typicode.com/users")! // aqui se define donde vamos hacer lapeticion
        
        let (data, _) = try await URLSession.shared.data(from: url)//llamada aa internet
        
        return try JSONDecoder().decode([User].self, from: data)//convertidor Json a Swift
        // JSONdecoder traduce jSOn
        //User.self esperamos un arraay de usuariioos
        //fron:: data usamos los daatos descargados
    }
}
