//
//  ContentView.swift
//  WebApi
//
//  Created by Rox on 4/4/26.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = UserViewModel()// creaa el viewmodel
    
    var body: some View {
        NavigationView {
            
            if vm.isLoading { // sii estacargando muestra spiinner
                ProgressView("Cargando...")
                
            } else if let error = vm.error {
                Text(error) //muestra si ihay error
                
            } else {// siii todo esta biien muestra datos
                
                List(vm.users) { user in // recorre el array de usuarios
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        
                        Text(user.email)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .onAppear {//cuando la pantalla aparece se llama a la API
            vm.loadUsers()
        }
    }
}
