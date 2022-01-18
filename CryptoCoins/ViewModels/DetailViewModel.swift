//
//  DetailViewModel.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 18.01.2022.
//

import Foundation


class DetailViewModel: ObservableObject {
    
    @Published var showPortfolioView = false
    @Published var selectedCoin: Coin? = nil
    
    
    func segue(coin: Coin) {
        selectedCoin = coin
        showPortfolioView.toggle()
    }
}
