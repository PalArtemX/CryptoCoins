//
//  DetailView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 18.01.2022.
//

import SwiftUI


// MARK: - DetailView
struct DetailView: View {
    @StateObject var detailVM: DetailViewModel
    
    init(coin: Coin) {
        _detailVM = StateObject(wrappedValue: DetailViewModel(coin: coin))
        print("Init \(coin.name)")
    }
    
    var body: some View {
        Text("coin.name")
    }
}









struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(coin: dev.coin)
    }
}
