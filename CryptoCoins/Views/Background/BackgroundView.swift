//
//  BackgroundView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 06.01.2022.
//

import SwiftUI

struct BackgroundView: View {
    
    @State private var showAnimation = false
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ForEach(0..<20) { _ in
                            HStack {
                                ForEach(0..<10) { _ in
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(lineWidth: 3)
                                        .foregroundColor(.accentColor)
                                        .frame(width: 100, height: 100)
                                        .rotationEffect(Angle(degrees: showAnimation ? 0 : 45))
                                        .opacity(0.1)
                                }
                            }
                        }
                    }
                }
            }
        }
        .ignoresSafeArea()
        .onAppear {
            withAnimation(
                Animation
                    .linear(duration: 10)
                    .repeatForever(autoreverses: true)) {
                        showAnimation.toggle()
                    }
        }
    }
}











struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
