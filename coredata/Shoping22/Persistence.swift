//
//  Persistence.swift
//  Shoping
//
//  Created by Rox on 28/3/26.
//

import CoreData

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        // ✅ inMemory: true — SOLO para preview, datos temporales
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        do {
            try viewContext.save()
        } catch {
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Shoping")

        if inMemory {
            // ⚠️ Este modo NO guarda en disco — solo para previews
            container.persistentStoreDescriptions.first!.url =
                URL(fileURLWithPath: "/dev/null")
        }
        // ✅ Si inMemory es false (app real), guarda en disco normalmente

        container.loadPersistentStores { _, error in
            if let error = error as NSError? {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
    }
}
