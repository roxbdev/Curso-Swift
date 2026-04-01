//
//  ContentView.swift
//  Compras
//
//  Created by Rox on 30/3/26.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    // 1. ORDENAMIENTO: Primero por 'comprado' (false < true)
    // y luego por 'nombre'
    @FetchRequest(
        sortDescriptors: [
            NSSortDescriptor(keyPath: \Producto.comprado, ascending: true),
            NSSortDescriptor(keyPath: \Producto.nombre, ascending: true)
        ],
        animation: .default)
    private var productos: FetchedResults<Producto>

    @State private var nuevoProducto: String = ""

    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    TextField("Nuevo artículo...", text: $nuevoProducto)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button(action: agregarProducto) {
                        Image(systemName: "plus.circle.fill")
                            .font(.title)
                    }
                    // Deshabilitar si solo hay espacios en blanco
                    .disabled(nuevoProducto.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
                }
                .padding()

                List {
                    ForEach(productos) { producto in
                        HStack {
                            Text(producto.nombre ?? "Sin nombre")
                                .strikethrough(producto.comprado)
                                .foregroundColor(producto.comprado ? .gray : .primary)
                            Spacer()
                            Image(systemName: producto.comprado ? "checkmark.circle.fill" : "circle")
                                .foregroundColor(producto.comprado ? .green : .gray)
                        }
                        .contentShape(Rectangle())
                        .onTapGesture {
                            marcarComoComprado(producto)
                        }
                    }
                    .onDelete(perform: eliminarProductos)
                }
            }
            .navigationTitle("Mi Lista")
        }
    }

    // 2. VALIDACIÓN: Limpieza de texto antes de guardar
    private func agregarProducto() {
        let nombreLimpio = nuevoProducto.trimmingCharacters(in: .whitespacesAndNewlines)
        
        if !nombreLimpio.isEmpty {
            withAnimation {
                let item = Producto(context: viewContext)
                item.id = UUID()
                item.nombre = nombreLimpio
                item.comprado = false
                
                guardarContexto()
                nuevoProducto = "" // Limpiar el campo
            }
        }
    }

    private func marcarComoComprado(_ producto: Producto) {
        withAnimation {
            producto.comprado.toggle()
            guardarContexto()
        }
    }

    private func eliminarProductos(offsets: IndexSet) {
        withAnimation {
            offsets.map { productos[$0] }.forEach(viewContext.delete)
            guardarContexto()
        }
    }

    private func guardarContexto() {
        do {
            try viewContext.save()
        } catch {
            print("Error al guardar: \(error.localizedDescription)")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
                .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
}
