//
//  DetailViewModel.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 18.01.2022.
//

import Foundation
import Combine


class DetailViewModel: ObservableObject {
    
    @Published var showPortfolioView = false
    @Published var selectedCoin: Coin? = nil
    
    private let coinDetailsService: CoinDetailDataService
    private var cancellable = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.coinDetailsService = CoinDetailDataService(coin: coin)
        self.addSubscribers()
    }
    
    
    
    // MARK: - Functions
    
    // MARK: - addSubscribers
    private func addSubscribers() {
        coinDetailsService.$coinDetails
            .sink { returnedCoinDetails in
                print("Recieved coin detail data")
                print(returnedCoinDetails)
            }
            .store(in: &cancellable)
    }
}
