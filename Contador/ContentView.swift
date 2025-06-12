//
//  ContentView.swift
//  Contador
//
//  Created by Benjamin Rojo on 11/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        animoCard()
    }
    
}
class EstadoViewModel: ObservableObject{
    @Published var estadoDeAnimo  = "Feliz"
    
}
struct animoCard: View{
    @StateObject var animo1 = EstadoViewModel()
    var body: some View{
        Button(action: {
            if animo1.estadoDeAnimo == "Feliz" {
                animo1.estadoDeAnimo = "Triste"
            } else {
                animo1.estadoDeAnimo = "Feliz"
            }
        }){
            Text(animo1.estadoDeAnimo)
                .foregroundColor(.orange)
                .font(.title)
            
        }
    }
}
#Preview {
    ContentView()
}
