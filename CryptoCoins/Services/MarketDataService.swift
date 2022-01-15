//
//  MarketDataService.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 10.01.2022.
//

import Foundation
import Combine

// URL: https://api.coingecko.com/api/v3/global


class MarketDataService {
    @Published var marketData: MarketData?
    var marketDataSubscription: AnyCancellable?
    
    init() {
        getData()
    }
    
    func getData() {
        guard let url = URL(string: "https://api.coingecko.com/api/v3/global") else { return }
        
        marketDataSubscription = NetworkingManager.download(url: url)
            .decode(type: GlobalData.self, decoder: JSONDecoder())
            .sink(receiveCompletion: NetworkingManager.handleCompletion, receiveValue: { [weak self] returnedGlobalData in
                self?.marketData = returnedGlobalData.data
                self?.marketDataSubscription?.cancel()
            })
    }
}
