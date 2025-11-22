//
//  CurrencyTip.swift
//  LOTRConverter
//
//  Created by Credo on 11/22/25.
//

import TipKit

struct CurrencyTip: Tip {
    var title = Text("Change Currency")
    
    var message: Text? = Text("You can tap the currency icon to change the currency")
    
    var image: Image? = Image(systemName: "hand.tap.fill")
}
