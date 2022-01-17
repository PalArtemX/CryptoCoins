//
//  SearchBarView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 10.01.2022.
//

import SwiftUI

struct SearchBarView: View {
    
    @Binding var textfield: String
    
    var body: some View {
        HStack {
            // MARK: - systemName
            Image(systemName: "magnifyingglass.circle")
                .symbolRenderingMode(.hierarchical)
                .foregroundColor(.accentColor)
                .font(.title)
            
            // MARK: - TextField
            TextField(text: $textfield, prompt: Text("Search by name or symbol...")) {
                Image(systemName: "magnifyingglass.circle")
            }
            .disableAutocorrection(true)
            .textFieldStyle(.roundedBorder)
            .overlay(
                Image(systemName: "xmark.circle")
                    .symbolRenderingMode(.hierarchical)
                    .foregroundColor(.red)
                    .padding()
                    .opacity(textfield.isEmpty ? 0.0 : 1.0)
                    .onTapGesture {
                        // Collapsing the keyboard when clicking on the xmark
                        UIApplication.shared.endEditing()
                        
                        textfield = ""
                    }
                , alignment: .trailing
            )
            
            
        }
        .padding(.horizontal)
    }
}










struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SearchBarView(textfield: .constant(""))
                .previewLayout(.sizeThatFits)
            .padding()
            SearchBarView(textfield: .constant("Bit"))
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
