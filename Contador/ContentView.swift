//
//  ContentView.swift
//  Contador
//
//  Created by Benjamin Rojo on 11/06/25.
//
// ContentView.swift

import SwiftUI

struct ContentView: View {
    var body: some View {
        AumentarView()
    }
}

class Aumentar: ObservableObject {
    @Published var numero: Int = 0
    @Published var texto: String = "Has presionado 0 veces"
    
    func plus() {
        numero += 1
        texto = "Has presionado \(numero) veces"
    }
}

struct AumentarView: View {
    @StateObject var conf = Aumentar()
    @State private var animate = false
    
    var body: some View {
        ZStack {
            // Fondo con gradiente
            LinearGradient(
                gradient: Gradient(colors: [Color.purple, Color.blue, Color.cyan]),
                startPoint: .topLeading,
                endPoint: .bottomTrailing
            )
            .ignoresSafeArea()
            
            VStack(spacing: 40) {
                // Título con sombra y fuente grande
                Text("¡Contador Súper Pro!")
                    .font(.system(size: 36, weight: .bold, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(color: .black.opacity(0.3), radius: 8, x: 0, y: 4)
                    .padding(.top, 40)
                
                // Número grande con animación
                Text("\(conf.numero)")
                    .font(.system(size: 80, weight: .heavy, design: .rounded))
                    .foregroundColor(.white)
                    .shadow(color: .purple.opacity(0.5), radius: 10, x: 0, y: 8)
                    .scaleEffect(animate ? 1.2 : 1.0)
                    .animation(.spring(response: 0.3, dampingFraction: 0.4), value: animate)
                    .onChange(of: conf.numero) {
                        animate = true
                        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                            animate = false
                        }
                    }
                
                // Texto de veces presionadas
                Text(conf.texto)
                    .font(.title2)
                    .foregroundColor(.white.opacity(0.9))
                    .padding(.bottom, 20)
                
                // Botón estilizado
                Button(action: {
                    conf.plus()
                }) {
                    HStack {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 32))
                            .foregroundColor(.white)
                        Text("Aumentar")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                    }
                    .padding()
                    .frame(maxWidth: 220)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.purple]),
                            startPoint: .leading,
                            endPoint: .trailing
                        )
                    )
                    .cornerRadius(30)
                    .shadow(color: .purple.opacity(0.4), radius: 10, x: 0, y: 6)
                    .scaleEffect(animate ? 1.05 : 1.0)
                }
                .buttonStyle(PlainButtonStyle())
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
