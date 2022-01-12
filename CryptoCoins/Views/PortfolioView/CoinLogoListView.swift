//
//  CoinLogoListView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 12.01.2022.
//

import SwiftUI

struct CoinLogoListView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 10) {
                ForEach(vm.coins) { coin in
                    CoinLogoView(coin: coin)
                        .ignoresSafeArea()
                        .onTapGesture {
                            withAnimation(.easeIn) {
                                vm.selectedCoinPortfolio = coin
                            }
                        }
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(vm.selectedCoinPortfolio?.id == coin.id ?  Color.accentColor : Color.clear, lineWidth: 1)
                        )
                }
                .padding(5)
            }
        }
    }
}










struct CoinLogoListView_Previews: PreviewProvider {
    static var previews: some View {
        CoinLogoListView()
            .environmentObject(HomeViewModel())
    }
}
