//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Credo on 10/9/25.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {

            Image(.background)
                .resizable()
                .ignoresSafeArea()

            VStack {
                Image(.prancingpony)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 200)

                Text("Currency Exchange")
                    .font(.largeTitle)
                    .foregroundStyle(.white)

                HStack {

                    VStack {

                        HStack {

                            Image(.silverpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)

                            Text("Silver Piece")
                                .font(.headline)
                                .foregroundStyle(.white)
                        }

                        Text("Textfield")
                    }

                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)

                    VStack {

                        HStack {

                            Text("Gold Piece")
                                .font(.headline)
                                .foregroundStyle(.white)

                            Image(.goldpiece)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)

                        }

                        Text("Textfield")
                    }
                }
                
                Spacer()
                
                Image(systemName: "info.circle.fill")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                
            }
            .border(.blue)
        }
    }
}

#Preview {
    ContentView()
}
