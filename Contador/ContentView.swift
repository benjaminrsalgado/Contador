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


class ToDo: ObservableObject {
    @Published var tarea: Bool = true
    
    func check() {
        tarea.toggle()
    }
}

struct ToDoView: View {
    @StateObject var tarea1 = ToDo()
    
    var body: some View {
        ZStack {
 
            LinearGradient(
                gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.3)]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 30) {
                Text("Mi ToDo")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.purple)
                
                Button(action: {
                    withAnimation(.spring()) {
                        tarea1.check()
                    }
                }) {
                    Text(tarea1.tarea ? "Aprender" : "Practicar @State")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .padding()
                        .frame(width: 220)
                        .background(tarea1.tarea ? Color.green.opacity(0.8) : Color.orange.opacity(0.8))
                        .foregroundColor(.white)
                        .cornerRadius(16)
                        .shadow(color: .gray.opacity(0.4), radius: 8, x: 0, y: 4)
                        .scaleEffect(tarea1.tarea ? 1.0 : 1.1)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
