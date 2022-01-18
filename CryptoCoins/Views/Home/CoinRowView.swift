//
//  CoinRowView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 07.01.2022.
//

import SwiftUI

struct CoinRowView: View {
    
    let coin: Coin
    let showHoldingsColumn: Bool
    
    var body: some View {
        HStack(spacing: 0.0) {
            // MARK: - Rank
            Text("\(coin.rank)")
                .foregroundColor(.theme.secondaryText)
                .frame(minWidth: 30)
            
            // MARK: - Logo
            ImageCoinView(coin: coin)
                .frame(width: 30, height: 30)
            
            // MARK: - Symbol
            Text(coin.symbol.uppercased())
                .font(.headline)
                .padding(.leading, 6)
                .foregroundColor(.accentColor)
            
            Spacer()
            
            // MARK: - Current Holdings Value
            if showHoldingsColumn {
                VStack(alignment: .trailing) {
                    Text(coin.currentHoldingsValue.asCurrencyWith2Decimals())
                        .font(.footnote)
                        .bold()
                    Text((coin.currentHoldings ?? 0).asPercentString())
                        .font(.footnote)
                }
                
            }
            
            // MARK: - Price
            VStack(alignment: .trailing) {
                Text("\(coin.currentPrice.asCurrencyWith6Decimals())")
                    .bold()
                    //.foregroundColor(.accentColor)
                
                Text(coin.priceChangePercentage24H?.asPercentString() ?? "")
                    .foregroundColor(
                        (coin.priceChangePercentage24H ?? 0) >= 0 ? .theme.green : .theme.red
                    )
            }
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.subheadline)
        .background(
            Color.theme.background.opacity(0.001)
        )
    }
}










struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .previewLayout(.sizeThatFits)
            .padding()
            CoinRowView(coin: dev.coin, showHoldingsColumn: true)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
