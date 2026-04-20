//
//  ContentView.swift
//  WebApi
//
//  Created by Rox on 4/4/26.
//

import Foundation

import SwiftUI

struct ContentView: View {
    
    @StateObject var vm = UserViewModel()
    
    var body: some View {
        NavigationView {
            
            if vm.isLoading {
                ProgressView("Cargando...")
                
            } else if let error = vm.error {
                Text(error)
                
            } else {
                List(vm.users) { user in
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        
                        Text(user.email)
                            .foregroundColor(.gray)
                    }
                }
            }
        }
        .onAppear {
            vm.loadUsers()
        }
    }
}
