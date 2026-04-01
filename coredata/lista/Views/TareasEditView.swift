//
//  TareasEditView.swift
//  lista
//
//  Created by Rox on 28/3/26.
//

import SwiftUI

struct TareasEditView: View {
   
        @State var seleccionaTarea: TareasItem?
        @State var name: String
        @State var descripcion: String
        
    init(passedTasckItem: TareasItem?, initialDate: Date)
    {
        if let tareasItem = passedTasckItem
        {
            _seleccionaTarea =State(initialValue: tareasItem)
            _name = State(initialValue: tareasItem.name ?? "")
            _descripcion = State(initialValue: tareasItem.description ?? "")
            _fechavecimiento = State(initialValue: tareasItem.fechavencimiento??initialDate )
            _hora = State(initialValue: tareasItem.hora)
        }
        else
        {
            _name =State(initialValue: "")
            _descripcion =State(initialValue:"")
            _fechavecimiento =State(initialValue: initialDate )
            _hora =State(initialValue: false)
        }
        
    }
    
       var body: some View
       {
        Form
        {
            Section(header: Text("tareas"))
            {
                TextField("Tareas", text: $name)
                TextField("Descripcion", text: $descripcion)
            }
        }
    }
}

struct TareasEditView_Previews: PreviewProvider {
    static var previews: some View {
        TareasEditView(TareasItem())
    }
}
