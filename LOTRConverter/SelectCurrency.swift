//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Credo on 10/25/25.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    @State var selectedCurrency: Currency
    
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                Text("Select the currency you are starting with")
                    .fontWeight(.bold)
                
                LazyVGrid(columns: [GridItem(), GridItem(), GridItem()]){
                    ForEach(Currency.allCases){
                        currency in
                        if selectedCurrency == currency {
                            CurrencyIcon(currencyImage: currency.image,
                                         currencyName: currency.name
                            ).shadow(color: .black ,radius: 10)
                                .overlay{
                                    RoundedRectangle(cornerRadius: 25)
                                        .stroke( lineWidth: 3)
                                        .opacity(0.5)
                                }
                        } else {
                            CurrencyIcon(currencyImage: currency.image,
                                         currencyName: currency.name
                            ).onTapGesture {
                                selectedCurrency = currency
                                print(self)
                            }
                        }
                    }
                }
                
                Text("Select the currency you would like to convert to")
                    .fontWeight(.bold)
                  
                Button("Done"){
                    dismiss()
                }.buttonStyle(.borderedProminent)
                    .tint(.brown.mix(with: .black, by: 0.2))
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)
            }
            .padding()
            .multilineTextAlignment(.center)
        }
    }
}

#Preview {
    SelectCurrency(selectedCurrency: .silverPiece)
}
