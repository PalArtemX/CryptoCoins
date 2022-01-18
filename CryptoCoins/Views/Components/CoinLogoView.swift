//
//  CoinLogoView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 11.01.2022.
//

import SwiftUI

struct CoinLogoView: View {
    
    let coin: Coin
    
    var body: some View {
        VStack {
            // MARK: - Logo
            ImageCoinView(coin: coin)
                .frame(width: 50, height: 50)
            
            // MARK: - Symbol
            Text(coin.symbol.uppercased())
                .font(.headline)
                .foregroundColor(.accentColor)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
            
            // MARK: - Name
            Text(coin.name)
                .font(.caption)
                .foregroundColor(.theme.secondaryText)
                .lineLimit(2)
                .minimumScaleFactor(0.5)
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}










struct CoinLogoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinLogoView(coin: development.coin)
                .previewLayout(.sizeThatFits)
            .padding()
            CoinLogoView(coin: development.coin)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
