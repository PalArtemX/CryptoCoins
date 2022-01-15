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
    @Published var searchText = ""
    @Published var isLoading = false
    
    @Published var showPortfolio = false
    @Published var showSheetPortfolio = false
    @Published var selectedCoinPortfolio: Coin? = nil
    @Published var quantityTextfieldPortfolio = ""
    @Published var showCheckmarkPortfolio = false
    
    
    private let coinDataService = CoinDataService()
    private let marketDataService = MarketDataService()
    private let portfolioDataService = PortfolioDataService()
    private var cancellable = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    
    // MARK: - FUNCTIONS
    // MARK: - addSubscribers
    func addSubscribers() {
        
        // MARK: - UPDATE COINS
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
        
        // MARK: - UPDATES PORTFOLIO
        $coins
            .combineLatest(portfolioDataService.$saveEntities)
            .map { (coinModels, portfolioEntities) -> [Coin] in
                coinModels
                    .compactMap { (coin) -> Coin? in
                        guard let entity = portfolioEntities.first(where: { $0.coinID == coin.id }) else {
                            return nil
                        }
                        return coin.updateHoldings(amount: entity.amount)
                    }
            }
            .sink { [weak self] returnedCoin in
                self?.portfolioCoins = returnedCoin
            }
            .store(in: &cancellable)
        
        // MARK: - UPDATE MARKET DATA
        marketDataService.$marketData
            .combineLatest($portfolioCoins)
            .map { (marketData, portfolioCoins) -> [Statistic] in
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
                
                // MARK: - portfolioValue
                let portfolioValue = portfolioCoins.map({ $0.currentHoldingsValue})
                    .reduce(0, +)
                // previousValue
                let previousValue = portfolioCoins.map { (coin) -> Double in
                    let currentValue = coin.currentHoldingsValue
                    let percentChange = coin.priceChangePercentage24H ?? 0 / 100
                    let previousValue = currentValue / (1 + percentChange)
                    return previousValue
                }
                    .reduce(0, +)
                // percentageChange
                let percentageChange = ((portfolioValue - previousValue) / previousValue) * 100
                
                let portfolio = Statistic(title: "Portfolio", value: portfolioValue.asCurrencyWith2Decimals(), percentageChange: percentageChange)
                statistics.append(portfolio)
                
                
                
                return statistics
            }
            .sink { [weak self] returnedStatistics in
                self?.statistics = returnedStatistics
                self?.isLoading = false
            }
            .store(in: &cancellable)
        
    }
    
    // MARK: - updatePortfolio
    func updatePortfolio(coin: Coin, amount: Double) {
        portfolioDataService.updatePortfolio(coin: coin, amount: amount)
    }
    
    // MARK: - getCurrentValue
    func getCurrentValue() -> Double {
        if let quantity = Double(quantityTextfieldPortfolio) {
            return  quantity * (selectedCoinPortfolio?.currentPrice ?? 0)
        }
        return 0
    }
    
    // MARK: - saveButtonPortfolio
    func saveButtonPortfolio() {
        guard
            let coin = selectedCoinPortfolio,
            let amount = Double(quantityTextfieldPortfolio) else {
                return
            }
        // save to portfolio
        updatePortfolio(coin: coin, amount: amount)
        
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
    
    // MARK: - updateSelectedCoin
    func updateSelectedCoin(coin: Coin) {
        selectedCoinPortfolio = coin
        
        if let portfolioCoin = portfolioCoins.first(where: { $0.id == coin.id }), let amount = portfolioCoin.currentHoldings {
            quantityTextfieldPortfolio = "\(amount)"
        } else {
            quantityTextfieldPortfolio = ""
        }
    }
    
    // MARK: - reloadData
    func reloadData() {
        isLoading = true
        coinDataService.getCoins()
        marketDataService.getData()
        HapticManager.notification(type: .success)
    }
    
}
