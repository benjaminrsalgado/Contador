//
//  ContentView.swift
//  Contador
//
//  Created by Benjamin Rojo on 11/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        puertaView()
    }
}

class PuertaViewModel: ObservableObject{
    @Published var door = true
    
    func check(){
        door.toggle()
    }
}

struct puertaView: View{
    @StateObject var puertaModel = PuertaViewModel()
    var body: some View{
        VStack{
            Button (action:{
                puertaModel.check()
            }){
                Label(
                puertaModel.door ? "esta abierta": "esta cerrada",
                systemImage: puertaModel.door ? "door.open" : "door.closed"
            )
                
            }
        }
    }
}

#Preview {
    ContentView()
}
