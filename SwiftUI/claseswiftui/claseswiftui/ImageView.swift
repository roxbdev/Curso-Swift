//
//  ImageView.swift
//  claseswiftui
//
//  Created by Rox on 21/3/26.
//

import SwiftUI

struct ImageView: View {
    var body: some View {
        VStack {
            Image("logo").resizable()
                .padding(50).frame(width: 300, height: 300).background(Color.red)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 4)).shadow(color: Color.gray, radius: 5)
            Image("logo").resizable()
                .padding(50).frame(width: 300, height: 300).background(Color.gray)
                .clipShape(Circle())
                .overlay(Circle().stroke(Color.blue, lineWidth: 4)).shadow(color: Color.gray, radius: 5)
        }
        
        
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView()
    }
}
