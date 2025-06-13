//
//  ContentView.swift
//  Contador
//
//  Created by Benjamin Rojo on 11/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
      LinternaCard()
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
            }){Text(linterna1.estaEncendida ? "esta encendida": "esta apagada")
                
            }
        }
    }
}
#Preview {
    ContentView()
}
