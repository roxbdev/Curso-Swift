//
//  ListView.swift
//  ListProgrammer
//
//  Created by Rox on 28/3/26.
//

import SwiftUI

private let programmers = [Programmer(id: 1, name:"Maria",
                            languages:"Python", avatar: Image(systemName: "person")),
                           Programmer(id: 2, name:"Eloy",languages:"Javascript", avatar: Image(systemName: "person")),
                           Programmer(id: 3, name:"Rox",languages:"Go", avatar: Image(systemName: "person")),
                           Programmer(id: 4, name:"Stalin",languages:"Go", avatar: Image(systemName: "person")),
                           Programmer(id: 5, name:"Hugo",languages:"Swift", avatar: Image(systemName: "person"))]

struct ListView: View {
    var body: some View {
        NavigationView {
            List(programmers, id: \.id) { programmer in
                NavigationLink(destination: ListNavView(programmer: programmer)) {
                    ProgrammerView(programmer: programmer)
                }
            }
            .navigationTitle("Programmes")
        }
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
