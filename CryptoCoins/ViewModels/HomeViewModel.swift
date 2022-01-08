//
//  HomeViewModel.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 08.01.2022.
//

import Foundation


class HomeViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    
    @Published var showPortfolio = false
    
    init() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.coins.append(DeveloperPreview.instance.coin)
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.portfolioCoins.append(DeveloperPreview.instance.coin)
        }
    }
    
}
