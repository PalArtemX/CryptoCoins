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
                .sheet(isPresented: $vm.showSheetPortfolio) {
                    PortfolioView()
                        .environmentObject(vm)
                }

            VStack {
                // MARK: - HeaderHomeView
                HeaderHomeView()
                
                // MARK: - HomeStatisticView
                HomeStatisticView(showPortfolio: $vm.showPortfolio)
                
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
                    ZStack(alignment: .top) {
                        if vm.portfolioCoins.isEmpty && vm.searchText.isEmpty {
                            Text("Click on the plus button to add coins to the portfolio!")
                                .font(.callout)
                                .foregroundColor(.theme.secondaryText)
                                .multilineTextAlignment(.center)
                                .padding(70)
                        } else {
                            ListPortfolioCoinsView()
                        }
                    }
                    .transition(.move(edge: .trailing))
                }
                
                Spacer(minLength: 0)
            }
            .sheet(isPresented: $vm.showSheetSettingsView, onDismiss: nil) {
                InfoView()
            }
        }
        .background(
            NavigationLink(isActive: $vm.showPortfolioView, destination: {
                DetailLoadingView(coin: $vm.selectedCoin)
            }, label: { EmptyView() })
        )

        
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
