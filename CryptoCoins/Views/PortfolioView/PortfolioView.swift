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
    
    @State private var showCheckmark = false
    
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
        }
    }
}










struct PortfolioView_Previews: PreviewProvider {
    static var previews: some View {
        PortfolioView()
            .environmentObject(HomeViewModel())
    }
}
