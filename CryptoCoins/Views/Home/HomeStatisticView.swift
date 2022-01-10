//
//  HomeStatisticView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 10.01.2022.
//

import SwiftUI

struct HomeStatisticView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @Binding var showPortfolio: Bool
    
    var body: some View {
        HStack {
            ForEach(vm.statistics) {
                StatisticView(statistic: $0)
                    .frame(width: UIScreen.main.bounds.width / 3)
            }
        }
        .frame(width: UIScreen.main.bounds.width, alignment: showPortfolio ? .trailing : .leading)
    }
}










struct HomeStatisticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeStatisticView(showPortfolio: .constant(true))
                .environmentObject(HomeViewModel())
                .previewLayout(.sizeThatFits)
                .padding()
            HomeStatisticView(showPortfolio: .constant(false))
                .environmentObject(HomeViewModel())
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
