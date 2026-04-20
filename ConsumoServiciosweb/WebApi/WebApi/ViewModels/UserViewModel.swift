//
//  UserViewModel.swift
//  WebApi
//
//  Created by Rox on 4/4/26.
//

import Foundation

@MainActor //asegura que la UI se actualiice correctamente, ObservableObject
class UserViewModel: ObservableObject {
    
    @Published var users: [User] = [] //Cuando cambia el valor → SwiftUI redibuja la pantalla automáticamente
    @Published var isLoading = false
    @Published var error: String?
    
    func loadUsers() { // funciionar principal
        Task {// crea un contexto asincrono
            isLoading = true //activa el loadiing
            
            do {
                users = try await APIService.shared.fetchUsers()
            }//llama a la api y guarda los datos
            catch {
                self.error = "Error al cargar"
            }// manejo de errores
            
            isLoading = false //Termina el loading
        }
    }
}
