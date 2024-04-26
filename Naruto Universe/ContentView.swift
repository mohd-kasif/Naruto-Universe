//
//  ContentView.swift
//  Naruto Universe
//
//  Created by Mohd Kashif on 20/04/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .onAppear{
            CharacterVIewModel.shared.getCharacter(name: "shino")
        }
        .padding()
    }
}

//#Preview {
//    ContentView()
//}
