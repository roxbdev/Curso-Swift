//
//  CoreDataComprasApp.swift
//  CoreDataCompras
//
//  Created by App Designer2 on 08.03.25.
//

import SwiftUI

@main
struct CoreDataComprasApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
