//
//  ComprasApp.swift
//  Compras
//
//  Created by Rox on 30/3/26.
//

import SwiftUI

@main
struct TuAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
