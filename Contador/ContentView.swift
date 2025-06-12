//
//  ContentView.swift
//  Contador
//
//  Created by Benjamin Rojo on 11/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
     TareaCard()
    }
    
}

class TareaViewModel: ObservableObject{
    @Published var tarea = "Aprender SwiftUI"
     
    func tareaa(){
        if tarea == "Aprender SwiftUI"{
            tarea = "Practicar @StateObject"
        }else{
            tarea = "Aprender SwiftUI"
        }
    }
}

struct TareaCard: View{
    @StateObject var guardar = TareaViewModel()
    var body: some View{
        VStack{
            Text(guardar.tarea)
                .font(.title)
                .padding()
            Button(action: {
                guardar.tareaa()
            }) {
                Text("Cambiar tarea")
            }
        }
    }
}
#Preview {
    ContentView()
}
