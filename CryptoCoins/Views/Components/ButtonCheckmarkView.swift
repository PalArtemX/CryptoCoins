//
//  ButtonCheckmarkView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 12.01.2022.
//

import SwiftUI

struct ButtonCheckmarkView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    
    var body: some View {
        HStack {
            Image(systemName: "checkmark.rectangle.portrait")
                .symbolRenderingMode(.hierarchical)
                .opacity(vm.showCheckmarkPortfolio ? 1.0 : 0)
            Button {
                vm.saveButtonPortfolio()
            } label: {
                Text("Save")
            }
            .opacity(
                (vm.selectedCoinPortfolio != nil && vm.selectedCoinPortfolio?.currentHoldings != Double(vm.quantityTextfieldPortfolio)) ? 1.0 : 0
            )
            
        }
        .foregroundColor(.theme.green)
    }
}










struct ButtonCheckmarkView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonCheckmarkView()
            .environmentObject(HomeViewModel())
    }
}
