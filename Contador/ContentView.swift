//
//  ContentView.swift
//  Contador
//
//  Created by Benjamin Rojo on 11/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
   ToDoView()
    }
}

class ToDo: ObservableObject{
    @Published var tarea: Bool = true
    
    func check(){
        tarea.toggle()
    }
}

struct ToDoView: View{
    @StateObject var tarea1 = ToDo()
    var body: some View{
        Button(action:{
            tarea1.check()
        }){Text(tarea1.tarea ? "Aprender " : "Practicar @State")
            
        }
    }
}
#Preview {
    ContentView()
}
