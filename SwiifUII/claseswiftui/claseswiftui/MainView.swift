//
//  Rowview.swift
//  claseswiftui
//
//  Created by Rox on 21/3/26.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        ScrollView{  //para mostrar las viistas
            VStack{
                ImageView().offset(y:-150)  // posición de las vistas
                Divider().padding()   //separacion entre vistas
                ContentView()
            }
        }
    }
}

struct Rowview_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
