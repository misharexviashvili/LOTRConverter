//
//  ExchangeRate.swift
//  LOTRConverter
//
//  Created by Credo on 10/25/25.
//

import SwiftUI

struct SelectCurrency: View {
    
    @Environment(\.dismiss) var dismiss
    @Binding var leftCurrency: Currency
    @Binding var rightCurrency: Currency
    
    var body: some View {
        ZStack{
            Image(.parchment)
                .resizable()
                .ignoresSafeArea()
                .background(.brown)
            
            VStack{
                Text("Select the currency you are starting with")
                    .fontWeight(.bold)
            
                IconGrid(selectedCurrency: $leftCurrency)
                
                Text("Select the currency you would like to convert to")
                    .fontWeight(.bold)
                    .padding(.top)
                  
                IconGrid(selectedCurrency: $rightCurrency)
                
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
            .foregroundStyle(.black)
        }
    }
}

#Preview {
    @Previewable @State var leftCurrency: Currency = .silverPenny
    @Previewable @State var rightCurrency: Currency = .goldPenny
    
    SelectCurrency(leftCurrency: $leftCurrency, rightCurrency: $rightCurrency)
}
