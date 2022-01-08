//
//  ButtonCircleView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 05.01.2022.
//

import SwiftUI

struct ButtonCircleView: View {
    
    let systemName: String
    
    var body: some View {
        Image(systemName: systemName)
            .font(.headline)
            .foregroundColor(.accentColor)
            .frame(width: 50, height: 50)
            .background(.ultraThinMaterial)
            .cornerRadius(25)
    }
}










struct ButtonCircleView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ButtonCircleView(systemName: "plus")
                .previewLayout(.sizeThatFits)
            .padding()
            ButtonCircleView(systemName: "heart")
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
