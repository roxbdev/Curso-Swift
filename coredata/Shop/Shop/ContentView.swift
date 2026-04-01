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
            NSSortDescriptor(keyPath: \Item.fecha, ascending: true),
            NSSortDescriptor(keyPath: \Item.id, ascending: true)],
        
        animation: .default)
    private var item: FetchedResults<Item>
    
    static var fechaFormatter =
    {
        let formatter = DateFormatter()
        //Formatter.dateStyle = .full
        return formatter
    }
    
    var fecha = Date()
    
    @State private var mostrar: Bool = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(item, id: \.id) { item in
                    HStack{
                        Button(action: {
                           // item.comprado.Toggle()
                            try! self.moc.save()
                        }){
                            //Image(systemName: item.comprado ? "checkmark.seal.fill":"checkmark.seal")
                                //.font(.headline.bold())
                                //.foregroundColor(item.comprado ? .green: .gray)
                        }
                        VStack(alignment:.leading)
                        {
                            Text(item.articulos ?? "")
                                //.font(.healine.bold())
                                //.foregroundColor(.primary)
                            //Text("\(item.fecha ?? self.fecha, Formatter:
                            //Self.fechaFormatter)")
                                .font(.caption)
                                .foregroundColor(.secondary)
                                .strikethrough(item.comprado ? true: false)
                            Spacer()
                            if item.comprado{
                                Text("Comprado")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }
                        }
                        
                    }
                }.navigationTitle("compras")
                
            }
            
        }
        
    }
    
    
    struct ContentView_Previews: PreviewProvider {
        static var previews: some View {
            ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
        }
    }
}
