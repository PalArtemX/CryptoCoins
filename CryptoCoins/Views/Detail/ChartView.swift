//
//  ChartView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 18.01.2022.
//

import SwiftUI

struct ChartView: View {
    
    let data: [Double]
    
    init(coin: Coin) {
        data = coin.sparklineIn7D?.price ?? []
    }
    
    var body: some View {
        Text("Hello, World!")
    }
}










struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(coin: development.coin)
    }
}
