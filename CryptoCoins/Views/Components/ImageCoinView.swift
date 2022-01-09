//
//  ImageCoinView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 09.01.2022.
//

import SwiftUI

struct ImageCoinView: View {
    
    @StateObject var vm: ImageCoinViewModel
    
    init(coin: Coin) {
        _vm = StateObject(wrappedValue: ImageCoinViewModel(coin: coin))
    }
    
    var body: some View {
        ZStack {
            if let image = vm.image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
            } else if vm.isLoading {
                ProgressView()
            } else {
                Image(systemName: "questionmark")
                    .foregroundColor(.theme.secondaryText)
            }
            
        }
    }
}










struct ImageCoinView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ImageCoinView(coin: dev.coin)
                .previewLayout(.sizeThatFits)
                .padding()
            ImageCoinView(coin: dev.coin)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
