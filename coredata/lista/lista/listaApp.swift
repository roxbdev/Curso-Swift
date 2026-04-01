//
//  listaApp.swift
//  lista
//
//  Created by Rox on 28/3/26.
//

import SwiftUI

@main
struct listaApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ListaTareasView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
