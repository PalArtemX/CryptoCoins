//
//  InputSectionView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 12.01.2022.
//

import SwiftUI

struct InputSectionView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        
        // for the preview, you need to replace it with an equivalent nil (==)
        if vm.selectedCoinPortfolio != nil {
            VStack {
                // MARK: - Current price
                HStack {
                    Text("Current price of \(vm.selectedCoinPortfolio?.symbol.uppercased() ?? ""): ")
                    Spacer()
                    Text(vm.selectedCoinPortfolio?.currentPrice.asCurrencyWith6Decimals() ?? "")
                }
                
                Divider()
                
                // MARK: - Amount holding
                HStack {
                    Text("Amount holding:")
                    Spacer()
                    TextField("Ex: 1.4", text: $vm.quantityTextfieldPortfolio)
                        .textFieldStyle(.roundedBorder)
                        .multilineTextAlignment(.trailing)
                        .keyboardType(.decimalPad)
                }
                
                Divider()
                 
                // MARK: - Current Value
                HStack {
                    Text("Current Value:")
                    Spacer()
                    Text(vm.getCurrentValue().asCurrencyWith2Decimals())
                }
            }
            .animation(.none, value: vm.selectedCoinPortfolio?.currentPrice)
            .padding()
            .font(.headline)
            .foregroundColor(.theme.accent)
        }
    }
}










struct InputSectionView_Previews: PreviewProvider {
    static var previews: some View {
        InputSectionView()
            .environmentObject(HomeViewModel())
    }
}
