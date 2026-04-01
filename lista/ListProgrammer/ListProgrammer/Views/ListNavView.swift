//
//  ListNavView.swift
//  ListProgrammer
//
//  Created by Rox on 28/3/26.
//

import SwiftUI

struct ListNavView: View {
    
    var programmer: Programmer
    
    var body: some View {
        VStack{
            programmer.avatar.resizable()
                .frame(width: 200, height: 200)
                .clipShape(Circle())
                .overlay(Circle()
                .stroke(Color.red, lineWidth: 4))
                .shadow(color: Color.gray, radius: 5)
            Text(programmer.name).font(.largeTitle)
            Text(programmer.languages).font(.title)
            
        }
        Spacer()
    }
}

struct ListNavView_Previews: PreviewProvider {
    static var previews: some View {
        ListNavView(programmer:Programmer(id: 1, name: "Max", languages: "Python", avatar: Image(systemName: "person")))
    }
}
