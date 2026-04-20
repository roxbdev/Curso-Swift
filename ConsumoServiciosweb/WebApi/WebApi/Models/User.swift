//
//  User.swift
//  WebApi
//
//  Created by Rox on 4/4/26.
//

import Foundation

struct User: Codable, Identifiable {
    let id: Int
    let name: String
    let email: String
}
// definimos el tipo de dato, codable permiite convertir JSON a swift
