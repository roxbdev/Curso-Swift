//
//  ShopingApp.swift
//  Shoping
//
//  Created by Rox on 1/4/26.
//

import SwiftUI

@main
struct ShopingApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
