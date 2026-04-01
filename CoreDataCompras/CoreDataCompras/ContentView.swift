//
//  ContentView.swift
//  CoreDataCompras
//
//  Created by App Designer2 on 08.03.25.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc
    
    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Compras.fecha, ascending: true)],
        animation: .default)
    private var compras: FetchedResults<Compras>
    
    @State private var show: Bool = false
    var body: some View {
        NavigationView {
            List {
                ForEach(compras, id: \.id) { compra in
                    HStack {
                        Button(action: {
                            compra.comprado.toggle()
                            try? self.moc.save()
                        }) {
                            Image(systemName: compra.comprado ? "checkmark.square.fill":  "checkmark.square")
                                .font(.headline.bold())
                                .foregroundStyle(compra.comprado ? .green : .gray)
                        }
                        
                        VStack(alignment: .leading) {
                            Text(compra.articulos ?? "")
                                .font(.headline.bold())
                                .strikethrough(compra.comprado ? true : false)
                            
                            Text(compra.fecha ?? Date(), style: .date)
                                .font(.caption2)
                                .foregroundStyle(.secondary)
                            
                        }
                       Spacer()
                        
                        Text(compra.comprado ? "Comprado": "")
                            .foregroundStyle(.gray)
                    }//HStack
                    
                }
            }.navigationTitle("Compras")
                .toolbar {
                    ToolbarItem(placement: .topBarTrailing, content: {
                        Button(action: {
                            withAnimation(.smooth) {
                                self.show.toggle()
                            }
                        }) {
                            Image(systemName: "plus")
                        }
                    })
                }
                .sheet(isPresented: self.$show, content: {
                    AgregarArticulos().environment(\.managedObjectContext, self.moc)
                })
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}


struct AgregarArticulos: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var articulos: String = ""
    var body: some View {
        NavigationStack {
            Form {
                TextField("Articulos...", text: self.$articulos)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    let new = Compras(context: self.moc)
                    new.id = UUID()
                    new.articulos = self.articulos
                    new.fecha = Date()
                    
                    try? self.moc.save()
                    dismiss()
                }) {
                    Text("Agregar")
                }.disabled(articulos.isEmpty)
            }.navigationTitle("Agregar Articulos")
        }
    }
}

#Preview {
    AgregarArticulos()
}
