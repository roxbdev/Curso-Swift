//
//  NewVista.swift
//  claseswiftui
//
//  Created by Rox on 21/3/26.
//

import SwiftUI

struct NewVista: View {
    var programmer: Programmer
    var body: some View{
        HStack {
            programmer.avatar
        }
    }
}

struct NewVista_Previews: PreviewProvider {
    static var previews: some View {
        NewVista(programmer:Programmer(id: 1,name:"Eloy", languages:"Python",avatar:Image("logo")))
    }
}
