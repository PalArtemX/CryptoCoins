//
//  HeaderHomeView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 05.01.2022.
//

import SwiftUI

struct HeaderHomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        HStack {
            // MARK: - ButtonCircleView
            ButtonCircleView(systemName: vm.showPortfolio ? "plus.circle" : "info.circle")
                .animation(.none, value: vm.showPortfolio)
                .onTapGesture {
                    if vm.showPortfolio {
                        vm.showSheetPortfolioView.toggle()
                    } else {
                        vm.showSheetInfoView.toggle()
                    }
                }
            
            Spacer()
            
            // MARK: - Header
            Text(vm.showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.theme.accent)
                .animation(.none, value: vm.showPortfolio)
            
            Spacer()
            
            // MARK: - ButtonCircleView
            ButtonCircleView(systemName: "chevron.right.circle")
                .rotationEffect(Angle(degrees: vm.showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        vm.showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}









struct HeaderHomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HeaderHomeView()
                .previewLayout(.sizeThatFits)
                .environmentObject(HomeViewModel())
            .padding(.vertical)
            HeaderHomeView()
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
                .environmentObject(HomeViewModel())
                .padding(.vertical)
        }
    }
}
