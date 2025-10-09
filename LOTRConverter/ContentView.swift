//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Credo on 10/9/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
                .padding()
            Text("Hello, world!")
                .foregroundColor(Color.purple)
            Button("Click me") {

            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
