//
//  ContentView.swift
//  ListProgrammer
//
//  Created by Rox on 28/3/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ListView() // llamar a la viista que quiero que se vea primero 
    }
}
