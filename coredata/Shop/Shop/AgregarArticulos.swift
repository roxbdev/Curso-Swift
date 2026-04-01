//
//  Agrerarticulos.swift
//  Shoping
//
//  Created by Rox on 28/3/26.
//

import SwiftUI

struct AgregarArticulos: View {
    
    @Environment(\.managedObjectContext) private var moc
    @Environment(\.dismiss) private var dismiiss
    @State private var articulos: String = ""
    
    var body: some View {
        
        NavigationView{
            //Form{
                TextField("Articulos", text: self.$articulos)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Button(action: {
                    let agregar = Item(context: self.moc)
                    agregar.articulos = self.articulos
                    agregar.fecha = Date()
                    agregar.id = UUID()
                    
                    try! self.moc.save()
                    dismiiss()
                })
                {
                    Text("Agregar")
                }//.disabled(self.articulos?.count > 0 ? false: true)
            //}
        .navigationTitle("Agreagar articulos")
        }
        }
    }

struct AgregarArticulos_Previews: PreviewProvider {
    static var previews: some View {
        AgregarArticulos()
    }
}
