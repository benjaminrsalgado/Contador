//
//  ContentView.swift
//  Contador
//
//  Created by Benjamin Rojo on 11/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ViewModel()
    }
    
}
class LikeViewModel: ObservableObject{
    @Published var leGusta = false
    
    func toggleLike(){
        leGusta.toggle()
    }
}

struct ViewModel: View{
    @StateObject var viewModel = LikeViewModel()
    var body: some View{
        VStack{
            Button(action:{
                viewModel.toggleLike()
            }){Label(
                viewModel.leGusta ? "Quitar like" : "Dar like",
                systemImage: viewModel.leGusta ? "heart.fill" : "heart"
            )
               
            }
        }
    }
}


#Preview {
    ContentView()
}
