//
//  ImageCoinViewModel.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 09.01.2022.
//

import Foundation
import SwiftUI
import Combine

class ImageCoinViewModel: ObservableObject {
    @Published var image: UIImage? = nil
    @Published var isLoading = false
    
    private let coin: Coin
    private let dataService: ImageCoinService
    private var cancellable = Set<AnyCancellable>()
    
    init(coin: Coin) {
        self.coin = coin
        self.dataService = ImageCoinService(coin: coin)
        self.addSubscribers()
        self.isLoading = true
    }
    
    // MARK: - FUNCTIONS
    private func addSubscribers() {
        dataService.$image
            .sink { [weak self] _ in
                self?.isLoading = false
            } receiveValue: { [weak self] returnedImage in
                self?.image = returnedImage
            }
            .store(in: &cancellable)
    }

}
