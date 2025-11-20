//
//  IconGrid.swift
//  LOTRConverter
//
//  Created by Credo on 10/25/25.
//

import SwiftUI

struct IconGrid: View {
    @Binding var selectedCurrency: Currency
    var body: some View {
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
    }
}

#Preview {
    @Previewable @State var selectedCurrency: Currency = .silverPiece
    IconGrid(selectedCurrency: $selectedCurrency)
}
