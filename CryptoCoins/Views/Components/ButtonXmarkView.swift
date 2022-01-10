//
//  ButtonXmarkView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 10.01.2022.
//

import SwiftUI

struct ButtonXmarkView: View {
    
    let action: () -> ()
    
    var body: some View {
        Button(role: .cancel) {
            action()
        } label: {
            Image(systemName: "xmark.rectangle.portrait")
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.red)
        }
        
    }
}










struct ButtonXmarkView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ButtonXmarkView(action: {})
                .previewLayout(.sizeThatFits)
                .padding()
            ButtonXmarkView(action: {})
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
