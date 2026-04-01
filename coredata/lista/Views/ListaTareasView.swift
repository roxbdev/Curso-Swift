//
//  ContentView.swift
//  lista
//
//  Created by Rox on 28/3/26.
//

import SwiftUI
import CoreData

struct ListaTareasView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \TareasItem.fechavencimiento, ascending: true)],
        animation: .default)  // cambio TareasItem
    private var items: FetchedResults<TareasItem> // cambio

    var body: some View {
        NavigationView {
            VStack
            {
                ZStack
                {
                  List {
                   ForEach(items)
                   {item in
                     NavigationLink (destination: TareasEditView())
                     {
                        Text(item.fechavencimiento, formatter: itemFormatter)
                     }
                   }
                   .onDelete(perform: deleteItems)
               }
               .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
                    
            FloatingButton()
         }
                             
        }.navigationTitle("Lista de tareas")
      }
    }
// eliminado
    private func deleteItems(offsets: IndexSet) {
        withAnimation {
            offsets.map { items[$0] }.forEach(viewContext.delete)

            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListaTareasView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
