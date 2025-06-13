//
//  ContentView.swift
//  Contador
//
//  Created by Benjamin Rojo on 11/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.black
                .ignoresSafeArea()
            LinternaCard()
        }
     
    }
}

class linterna: ObservableObject{
    @Published var estaEncendida = false
    
    func check(){
        estaEncendida.toggle()
    }
}
struct LinternaCard: View{
    @StateObject var linterna1 = linterna()
    var body: some View{
        VStack{
            Button(action:{
                linterna1.check()
            }){Label(
                linterna1.estaEncendida ? "Está encendida" : "Está apagada",
                systemImage: linterna1.estaEncendida ? "flashlight.on.fill" : "flashlight.off.fill"
            )
            .foregroundColor(.yellow)
                
            }
        }
    }
}
#Preview {
    ContentView()
}
