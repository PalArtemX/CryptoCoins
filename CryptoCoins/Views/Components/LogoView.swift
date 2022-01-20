//
//  LogoView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 20.01.2022.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        Image("logo")
            .resizable()
            .scaledToFit()
    }
}










struct LogoView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LogoView()
                .previewLayout(.sizeThatFits)
            LogoView()
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
        
    }
}
