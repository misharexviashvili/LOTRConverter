//
//  ContentView.swift
//  LOTRConverter
//
//  Created by Credo on 10/9/25.
//

import SwiftUI
import TipKit

struct ContentView: View {
    @State var showExchangeInfo = false
    @State var showSelectCurrency: Bool = false

    @FocusState var leftTyping: Bool
    @FocusState var rightTyping: Bool

    @State var leftAmount = ""
    @State var rightAmount = ""

    @State var leftCurrency: Currency = .silverPiece
    @State var rightCurrency: Currency = .goldPiece

    let currencyTip = CurrencyTip()

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

                            Image(leftCurrency.image)
                                .resizable()
                                .scaledToFit()
                                .frame(height: 33)

                            Text(leftCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)
                        }
                        .padding(-5)
                        .onTapGesture {
                            showSelectCurrency.toggle()
                            currencyTip.invalidate(reason: .actionPerformed)
                        }
                        .popoverTip(currencyTip, arrowEdge: .bottom)

                        TextField("Amount", text: $leftAmount).textFieldStyle(.roundedBorder)
                            .focused($leftTyping)
                            .onChange(of: leftAmount) {
                                if leftTyping {
                                    rightAmount = leftCurrency.convert(
                                        leftAmount, to: rightCurrency)
                                }
                            }
                    }

                    Image(systemName: "equal")
                        .font(.largeTitle)
                        .foregroundStyle(.white)
                        .symbolEffect(.pulse)

                    VStack {

                        HStack {

                            Text(rightCurrency.name)
                                .font(.headline)
                                .foregroundStyle(.white)

                            Image(rightCurrency.image)
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
                            .focused($rightTyping)
                            .onChange(of: rightAmount) {
                                if rightTyping {
                                    leftAmount = rightCurrency.convert(
                                        rightAmount, to: leftCurrency)
                                }
                            }
                    }
                }
                .padding()
                .background(.black.opacity(0.5))
                .clipShape(.capsule)
                .keyboardType(.decimalPad)
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
                }
            }
            
        }
        .task {
            try? Tips.configure()
        }
        .onChange(of: leftCurrency) {
            if leftTyping {
                rightAmount = leftCurrency.convert(
                    leftAmount, to: rightCurrency)
            }
        }
        .onChange(of: rightCurrency) {
            if rightTyping {
                leftAmount = rightCurrency.convert(
                    rightAmount, to: leftCurrency)
            }
        }
        .sheet(isPresented: $showExchangeInfo) {
            ExchangeInfo()
        }
        .sheet(isPresented: $showSelectCurrency) {
            SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
        }
    }
}

#Preview {
    ContentView()
}
