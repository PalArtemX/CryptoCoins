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
            ButtonCircleView(systemName: vm.showPortfolio ? "plus" : "info")
                .animation(.none, value: vm.showPortfolio)
                .onTapGesture {
                    if vm.showPortfolio {
                        vm.showSheetPortfolio.toggle()
                    }
                }
            
            Spacer()
            
            Text(vm.showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.accentColor)
                .animation(.none, value: vm.showPortfolio)
            
            Spacer()
            
            ButtonCircleView(systemName: "chevron.right")
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
        HeaderHomeView()
            .environmentObject(HomeViewModel())
    }
}
