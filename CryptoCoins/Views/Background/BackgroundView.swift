//
//  BackgroundView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 06.01.2022.
//

import SwiftUI

struct BackgroundView: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(0..<20) { _ in
                            HStack {
                                ForEach(0..<10) { _ in
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(lineWidth: 3)
                                        .foregroundColor(.accentColor)
                                        .frame(width: 100, height: 100)
                                        .rotationEffect(Angle(degrees: 45))
                                        .opacity(0.07)
                                }
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
    }
}











struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
