//
//  ShopingApp.swift
//  Shoping
//
//  Created by Rox on 28/3/26.
//
import SwiftUI

@main
struct ShopingApp: App {
    // DEBE ser .shared, no preview
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(
                    \.managedObjectContext,
                    persistenceController.container.viewContext  // contexto real
                )
        }
    }
}

