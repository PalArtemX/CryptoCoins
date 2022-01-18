//
//  ListCoinsView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 08.01.2022.
//

import SwiftUI

struct ListCoinsView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @EnvironmentObject private var detailVM: DetailViewModel
    
    var body: some View {
        List {
            ForEach(vm.coins) { coin in
                CoinRowView(coin: coin, showHoldingsColumn: false)
                    .onTapGesture {
                        detailVM.segue(coin: coin)
                    }
            }
        }
        .listStyle(.plain)
    }
    
    
    
}










struct ListCoinsView_Previews: PreviewProvider {
    static var previews: some View {
        ListCoinsView()
            .environmentObject(HomeViewModel())
            .environmentObject(DetailViewModel())
    }
}
