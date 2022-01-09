//
//  HomeView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 05.01.2022.
//

import SwiftUI

struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        ZStack {
            // MARK: - Background
            BackgroundView()
            
            VStack {
                // MARK: - HeaderHomeView
                HeaderHomeView()
                
                // MARK: - SearchBarView
                SearchBarView(textfield: $vm.searchText)
                
                // MARK: - Column Titles
                ColumnTitlesView()
                
                // MARK: - List Coins
                if !vm.showPortfolio {
                    ListCoinsView()
                        .transition(.move(edge: .leading))
                }
                
                // MARK: - List Portfolio
                if vm.showPortfolio {
                    ListPortfolioCoinsView()
                        .transition(.move(edge: .trailing))
                }
                
                Spacer(minLength: 0)
            }
        }
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(HomeViewModel())
        }
    }
}
