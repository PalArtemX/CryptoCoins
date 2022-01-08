//
//  ColumnTitlesView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 08.01.2022.
//

import SwiftUI

struct ColumnTitlesView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        HStack {
            Text("Coin")
            
            Spacer()
            
            if vm.showPortfolio {
                Text("Holdings")
            }
            
            Text("Price")
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.caption)
        .foregroundColor(.theme.secondaryText)
        .padding(.horizontal)
    }
}










struct ColumnTitlesView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ColumnTitlesView()
                .previewLayout(.sizeThatFits)
                .padding()
            .environmentObject(HomeViewModel())
            ColumnTitlesView()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
                .environmentObject(HomeViewModel())
        }
    }
}
