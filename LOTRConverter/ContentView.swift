//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Credo on 10/9/25.
//

import SwiftUI

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var leftAmount = ""
    @State var rightAmount = ""
    
    @State var topCurrency: Currency = .silverPiece
    @State var bottomCurrency: Currency = .goldPiece
    
    @State var showSelectCurrency: Bool = false

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

                            Image(topCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)

                            Text(topCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(-5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }

                        TextField("Amount", text: $leftAmount).textFieldStyle(.roundedBorder)
                    }

                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)

                    VStack {

                        HStack {

                            Text(bottomCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)

                            Image(bottomCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)

                        }
                        .padding(-5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                        }
                        
                        TextField("Amount", text: $rightAmount)
                            .textFieldStyle(.roundedBorder)
                            .multilineTextAlignment(.trailing)
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                Spacer()

                HStack {

                    Spacer()

                    Button {
                        showExchangeInfo.toggle()

                    } label: {
                        Image(systemName: "info.circle.fill")
                            .font(.largeTitle)
                            .foregroundStyle(.white)
                    }
                    .padding(.trailing)
                    .sheet(isPresented: $showExchangeInfo) {
                        ExchangeInfo()
                    }
                    .sheet(isPresented: $showSelectCurrency) {
                        SelectCurrency(leftCurrency: $topCurrency, rightCurrency: $bottomCurrency)
                    }
                }

            }

        }
    }
}

#Preview {
    ContentView()
}
