//
//  ShopApp.swift
//  Shop
//
//  Created by Rox on 28/3/26.
//

import SwiftUI

@main
struct ShopApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
