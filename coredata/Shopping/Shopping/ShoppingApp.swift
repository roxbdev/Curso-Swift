//
//  ShoppingApp.swift
//  Shopping
//
//  Created by Rox on 4/4/26.
//

import SwiftUI

@main
struct ShoppingApp: App {
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


