//
//  ContentView.swift
//  Contador
//
//  Created by Benjamin Rojo on 11/06/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        notificacionesCard()
    }
}

class notificaciones: ObservableObject{
    @Published var activacion : Bool = true
    
    func desactivar(){
        activacion.toggle()
    }
}

struct notificacionesCard: View{
    @StateObject var viewNotificacion = notificaciones()
    var body: some View{
        Button(action:{
            viewNotificacion.desactivar()
        }){Text(viewNotificacion.activacion ? "🔔 Notificaciones activadas" : "🔕 Notificaciones desactivadas")
            
        }
    }
}
#Preview {
    ContentView()
}
