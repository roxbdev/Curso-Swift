//
//  Agrerarticulos.swift
//  Shoping
//
//  Created by Rox on 28/3/26.
//
import SwiftUI

struct AgregarArticulos: View {
    
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) private var dismiss
    
    @State private var articulo: String = ""
    @State private var mostrarError = false
    
    @FocusState private var campoActivo: Bool
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Nuevo artículo")) {
                    TextField("Ej: Leche, Pan, Huevos...", text: $articulo)
                        .focused($campoActivo)
                        .textInputAutocapitalization(.words)
                        .submitLabel(.done)
                        .onSubmit {
                            guardarArticulo()
                        }
                }
                
                Section {
                    Button(action: guardarArticulo) {
                        Label("Agregar", systemImage: "cart.badge.plus")
                    }
                    .disabled(!inputValido)
                }
            }
        }
        .navigationTitle("Agregar Artículo")
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancelar") {
                    dismiss()
                }
            }
        }
        .onAppear {
            campoActivo = true
        }
        .alert("Error al guardar", isPresented: $mostrarError) {
            Button("OK", role: .cancel) { }
        } message: {
            Text("Ocurrió un problema al guardar el artículo.")
        }
    }
    
    // VALIDACIÓN MEJORADA
    private var inputValido: Bool {
        let texto = articulo.trimmingCharacters(in: .whitespacesAndNewlines)
        return texto.count >= 2
    }
    
    // GUARDADO ROBUSTO
    private func guardarArticulo() {
        // Paso 4a: crear el objeto en el contexto correcto
        let nuevo = Compras(context: moc)
        
        // Paso 4b: asignar todos los atributos obligatorios
        nuevo.articulos = articulo.trimmingCharacters(in: .whitespaces)
        nuevo.fecha     = Date()
        nuevo.id        = UUID()
        nuevo.comprado  = false
        
        // Paso 4c: guardar con manejo de error visible
        do {
            try moc.save()
            print("Guardado exitoso")  // verifica en consola de Xcode
            dismiss()
        } catch {
            // Paso 4d: ver el error exacto en consola
            print("❌ Error al guardar: \(error)")
            print("❌ Detalle: \(error.localizedDescription)")
        }
    }
    
}
// inyectar el contexto de Core Data en el Preview
struct AgregarArticulos_Previews: PreviewProvider {
    static var previews: some View {
        AgregarArticulos()
            .environment(
                \.managedObjectContext,
                PersistenceController.preview.container.viewContext
            )
    }
}
