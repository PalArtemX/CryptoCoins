//
//  HomeViewModel.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 08.01.2022.
//

import Foundation
import Combine
import SwiftUI

class HomeViewModel: ObservableObject {
    
    @Published var statistics: [Statistic] = []
    
    
    @Published var coins: [Coin] = []
    @Published var portfolioCoins: [Coin] = []
    @Published var showPortfolio = false
    @Published var showSheetPortfolio = false
    @Published var searchText = ""
    @Published var selectedCoinPortfolio: Coin? = nil
    @Published var quantityTextfieldPortfolio = ""
    @Published var showCheckmarkPortfolio = false
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    // MARK: - addSubscribers
    func addSubscribers() {
        
        // UPDATE COINS
        $searchText
            .combineLatest(coinDataService.$coins)
            //.debounce(for: .seconds(0.3), scheduler: DispatchQueue.main)
            .map { (text, startingCoins) -> [Coin] in
                guard !text.isEmpty else {
                    return startingCoins
                }
                
                let lowercasedText = text.lowercased()
                
                return startingCoins.filter { coin in
                    return coin.name.lowercased().contains(lowercasedText) ||
                    coin.symbol.lowercased().contains(lowercasedText) ||
                    coin.id.lowercased().contains(lowercasedText)
                }
            }
            .sink { [weak self] returnedCoins in
                self?.coins = returnedCoins
            }
            .store(in: &cancellable)
        
        // UPDATE MARKET DATA
        marketDataService.$marketData
            .map { (marketData) -> [Statistic] in
                var statistics: [Statistic] = []
                
                guard let data = marketData else {
                    return statistics
                }
                
                let marketCap = Statistic(title: "Market Cap", value: data.marketCap, percentageChange: data.marketCapChangePercentage24HUsd)
                statistics.append(marketCap)
                
                let volume = Statistic(title: "24h Volume", value: data.volume)
                statistics.append(volume)
                
                let btcDominance = Statistic(title: "BTC Dominance", value: data.btcDominance)
                statistics.append(btcDominance)
                
                let portfolio = Statistic(title: "Portfolio", value: "$0.00", percentageChange: 0)
                statistics.append(portfolio)
                
                return statistics
            }
            .sink { [weak self] returnedStatistics in
                self?.statistics = returnedStatistics
            }
            .store(in: &cancellable)
        
    }
    
    
    // MARK: func
    // MARK: - getCurrentValue
    func getCurrentValue() -> Double {
        if let quantity = Double(quantityTextfieldPortfolio) {
            return  quantity * (selectedCoinPortfolio?.currentPrice ?? 0)
        }
        return 0
    }
    
    // MARK: - saveButtonPortfolio
    func saveButtonPortfolio() {
        guard let coin = selectedCoinPortfolio else { return }
        // save to portfolio
        
        
        // show checkmark
        withAnimation(.easeIn) {
            showCheckmarkPortfolio = true
            removeSelectionCoinPortfolio()
        }
        
        // hide keyboard
        UIApplication.shared.endEditing()
        
        // hide checkmark
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            withAnimation(.easeOut) {
                self.showCheckmarkPortfolio = false
            }
        }
        
        
    }
    
    // MARK: - removeSelectionCoinPortfolio
    func removeSelectionCoinPortfolio() {
        selectedCoinPortfolio = nil
        searchText = ""
    }
    
    
}
