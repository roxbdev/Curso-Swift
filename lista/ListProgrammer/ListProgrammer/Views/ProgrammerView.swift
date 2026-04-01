//
//  ProgrammerView.swift
//  ListProgrammer
//
//  Created by Rox on 28/3/26.
//

import SwiftUI

struct ProgrammerView: View {
    var programmer:Programmer
    
    var body: some View {
        
        HStack{
            programmer.avatar
                .resizable()
                .frame(width: 40,height: 40)
                .padding(10)
            VStack (alignment: .leading){
                Text(programmer.name)
                    .font(.title)
                Text(programmer.languages)
                    .font(.subheadline)
            }
            Spacer()
            
        }
    }
}

struct ProgrammerView_Previews: PreviewProvider {
    static var previews: some View {
        ProgrammerView(programmer: Programmer(id: 1, name :"Max",languages:"Python", avatar: Image(systemName: "person.bust")))
            .previewLayout(.fixed(width: 400, height: 400))
    }
}
