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
            // MARK: - Coin
            HStack {
                Text("Coin")
                Image(systemName: "chevron.down.circle")
                    .symbolRenderingMode(.hierarchical)
                    .font(.headline)
                    .opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed) ? 1.0 : 0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
                }
            }
            
            Spacer()
            
            // MARK: - Holdings
            if vm.showPortfolio {
                HStack {
                    Text("Holdings")
                    Image(systemName: "chevron.down.circle")
                        .symbolRenderingMode(.hierarchical)
                        .font(.headline)
                        .opacity((vm.sortOption == .holdings || vm.sortOption == .holdingsReversed) ? 1.0 : 0)
                        .rotationEffect(Angle(degrees: vm.sortOption == .holdings ? 0 : 180))
                }
                .onTapGesture {
                    withAnimation(.default) {
                        vm.sortOption = vm.sortOption == .holdings ? .holdingsReversed : .holdings
                    }
                }
            }
            
            // MARK: - Price
            HStack {
                Text("Price")
                Image(systemName: "chevron.down.circle")
                    .symbolRenderingMode(.hierarchical)
                    .font(.headline)
                    .opacity((vm.sortOption == .price || vm.sortOption == .priceReversed) ? 1.0 : 0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))
            }
                .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
                .onTapGesture {
                    withAnimation(.default) {
                        vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
                    }
                }
            
            // MARK: - Button reloadData
            Button {
                withAnimation(.linear(duration: 2)) {
                    vm.reloadData()
                }
            } label: {
                Image(systemName: "arrow.clockwise.circle")
                    .symbolRenderingMode(.hierarchical)
                    .font(.title2)
            }
            .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)

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
