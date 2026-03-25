//
//  ContentView.swift
//  claseswiftui
//
//  Created by Rox on 21/3/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
       
         VStack (alignment: .center,
         spacing: 70) // propiedades que podemos editar como el espacio y alineacion
         {
         Text("hola amigos")
         .font(.system (size: 50))
         .foregroundColor(Color.red)
         .padding()
         Spacer()
         
         Text("hola que honda")
         .font(.system (size: 50))
         .foregroundColor(Color.red)
         .padding()
         .background(Color.gray)
         Spacer()
         Button(action:{})
         {
         Text("hola pulsame")
         .padding()
         .background(Color.yellow)
         .foregroundColor(.white)
         .cornerRadius(8)
         .padding()
         }
         
             /*
         
         
         Text("hola amigos como estan")
         .font(.system (size: 50))    //cambia el tamaño de la fuente
         .lineLimit(2)   //limita el numero de lineas
         .multilineTextAlignment(.trailing)   //alinear el texto(center, leading, trailing)
         .bold()   // cambiia el peso o grosor
         .underline()    // pone una line debajo del texto
         .background(Color.red)    // Color de fondo
         
         Circle()
         .background(Color.green)
         .padding()  // espacio entre el borde y el preview
         .background(Color.red)
         .frame(width: 200, height: 200) //Congtenedor del circulo
         
         Rectangle()
         .frame(width: 200, height: 200)  // cambia de tamaño para que no este toda la pantalla
         .foregroundStyle(Color.yellow)  //modiifica y recibe un color
         .cornerRadius(20)  // para que el borde sea reedondeado
         .opacity(0.5)  //usa la transparencia
         
         
         Button(action:{})
         {
         Text("hola pulsame")
         .padding()
         .background(Color.blue)
         .foregroundColor(.white) // camabiai el color del texto
         .cornerRadius(8)
         .padding()
         }
         
         
         HStack {
         Text("hola amigos")
         .padding()
         .font(.largeTitle)
         .foregroundColor(Color.blue)
         .padding()
         .background(Color.yellow)
         
         
         
         Text("hola que honda")
         .padding()
         .background(Color.red)
         
     
        
        
        ZStack {
            Text("")
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .background(Color.gray)
                .padding()
            Text("")
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .background(Color.red)
                .padding(40)
            Text("")
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .background(Color.green)
                .padding(60)
            Text("")
                .frame(maxWidth:.infinity, maxHeight: .infinity)
                .background(Color.yellow)
                .padding(80)        }*/
             
         }.background(Color.green)
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
