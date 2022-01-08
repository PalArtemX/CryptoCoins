//
//  ListPortfolioCoinsView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 08.01.2022.
//

import SwiftUI

struct ListPortfolioCoinsView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
            }
        }
        .listStyle(.plain)
    }
}










struct ListPortfolioCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        ListPortfolioCoinsView()
            .environmentObject(HomeViewModel())
    }
}
