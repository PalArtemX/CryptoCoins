//
//  HomeViewModel.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 08.01.2022.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    
    @Published var coins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    @Published var showPortfolio = false
    
    private let dataService = CoinDataService()
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    func addSubscribers() {
        dataService.$coins
            .sink { [weak self] returnedCoins in
                self?.coins = returnedCoins
            }
            .store(in: &cancellable)
    }
    
    
    
}
