//
//  ContentView.swift
//  Contador
//
//  Created by Benjamin Rojo on 11/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ContadorView()
    }
    
}

class contador: ObservableObject{
    @Published var contador1 = 0
    @Published var limiteAlcanzado = false
    func limite(){
        if contador1 == 10{
            limiteAlcanzado = true
        }else{
            limiteAlcanzado = false
        }
    }
}

struct ContadorView: View{
    @StateObject var contadorModel = contador()
    var body: some View{
        VStack{
            Button(action:{
                contadorModel.contador1 += 1
                contadorModel.limite()
            }){
                Text("Se sumara + 1: \(contadorModel.contador1)")
                
            }
            .disabled(contadorModel.limiteAlcanzado)
            if contadorModel.limiteAlcanzado {
                Text("Límite alcanzado")
                    .foregroundColor(.red)
            }
        }
    }
}

#Preview {
    ContentView()
}
