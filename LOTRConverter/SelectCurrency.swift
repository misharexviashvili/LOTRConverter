//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Credo on 10/25/25.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    
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
                        CurrencyIcon(currencyImage: currency.image,
                                     currencyName: currency.name
                        )
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
    SelectCurrency()
}
