//
//  ContentView.swift
//  Contador
//
//  Created by Benjamin Rojo on 11/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Vista()
    }
}
class PerfilViewModel: ObservableObject {
    @Published var nombre = "Benjamin"
    @Published var contador = 0
    
}

struct Vista: View{
    @StateObject var varibale = PerfilViewModel()
    var body: some View{
        Button(action: {
            varibale.contador += 1
        }){Text("sumaremos:  \(varibale.contador)")
            
        }
    }
}

#Preview {
    ContentView()
}
