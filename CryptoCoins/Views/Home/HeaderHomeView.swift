//
//  HeaderHomeView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 05.01.2022.
//

import SwiftUI

struct HeaderHomeView: View {
    
    @State private var showPortfolio = false
    
    var body: some View {
        HStack {
            ButtonCircleView(systemName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                
            
            Spacer()
            
            Text(showPortfolio ? "Portfolio" : "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(.accentColor)
                .animation(.none, value: showPortfolio)
            
            Spacer()
            
            ButtonCircleView(systemName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring()) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
}









struct HeaderHomeView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderHomeView()
    }
}
