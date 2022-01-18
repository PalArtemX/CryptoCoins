//
//  DetailView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 18.01.2022.
//

import SwiftUI


// MARK: - DetailView
struct DetailView: View {
    let coin: Coin
    
    init(coin: Coin) {
        self.coin = coin
        print("Init \(coin.name)")
    }
    
    var body: some View {
        Text(coin.name)
    }
}









struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
