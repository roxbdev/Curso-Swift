//
//  ContentView.swift
//  Shoping
//
//  Created by Rox on 28/3/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var moc
    
    
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Compras.fecha, ascending: true),
            NSSortDescriptor(keyPath: \Compras.id, ascending: true)
        ],
        animation: .default)
    private var compras: FetchedResults<Compras>

    static var fechaFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .full
        return formatter
    }()

    var body: some View {
        NavigationView {

            // si no hay artículos, muestra pantalla vacía
            Group {
                if compras.isEmpty {
                    vistaVacia
                } else {
                    listaCompras
                }
            }
            .navigationTitle("Lista de Compras")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination:
                        AgregarArticulos()
                            .environment(\.managedObjectContext, moc)
                    ) {
                        Image(systemName: "plus")
                    }
                }
            }
        }
    }

    // vista cuando la lista está vacía
    private var vistaVacia: some View {
        VStack(spacing: 16) {
            Image(systemName: "cart")
                .font(.system(size: 60))
                .foregroundColor(.gray.opacity(0.5))

            Text("No hay artículos aún")
                .font(.title2.bold())
                .foregroundColor(.gray)

            Text("Toca el botón + para agregar\ntu primer artículo")
                .font(.body)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }

    // vista cuando hay artículos
    private var listaCompras: some View {
        
        List {
            ForEach(compras, id: \.objectID) { compra in
                HStack {
                    Button(action: {
                        compra.comprado.toggle()
                        do {
                            try moc.save()
                        } catch {
                            print(" Error al guardar: \(error.localizedDescription)")
                        }
                    }) {
                        Image(systemName: compra.comprado
                              ? "checkmark.seal.fill"
                              : "checkmark.seal")
                            .font(.headline.bold())
                            .foregroundColor(compra.comprado ? .green : .gray)
                    }
                    .buttonStyle(.plain) // evita que el tap active la fila entera

                    VStack(alignment: .leading) {
                        Text(compra.articulos ?? "Sin nombre")
                            .font(.headline.bold())
                            .foregroundColor(.primary)

                        Text("\(compra.fecha ?? Date(), formatter: Self.fechaFormatter)")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                }
            }
            //Permite eliminar artículos deslizando
            .onDelete(perform: eliminarArticulo)
        }
    }

    // función para eliminar con swipe
    private func eliminarArticulo(at offsets: IndexSet) {
        offsets.forEach { index in
            let compra = compras[index]
            moc.delete(compra)
        }
        do {
            try moc.save()
        } catch {
            print("❌ Error al eliminar: \(error.localizedDescription)")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
