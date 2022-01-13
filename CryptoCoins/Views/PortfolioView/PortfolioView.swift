//
//  PortfolioView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 10.01.2022.
//

import SwiftUI

struct PortfolioView: View {
    
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // MARK: - SearchBarView
                    SearchBarView(textfield: $vm.searchText)
                    
                    // MARK: - CoinLogoListView
                    CoinLogoListView()
                    
                    // MARK: - InputSectionView
                    InputSectionView()
                }
            }
            .navigationTitle("Edit Portfolio")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    ButtonXmarkView {
                        dismiss()
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    ButtonCheckmarkView()
                }
            }
            .onChange(of: vm.searchText) { newValue in
                if newValue == "" {
                    vm.removeSelectionCoinPortfolio()
                }
            }
        }
    }
}










struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(HomeViewModel())
    }
}
