//
//  UIApplication.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 10.01.2022.
//

import Foundation
import SwiftUI

extension UIApplication {
    
    // Collapsing the keyboard when clicking on the xmark
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    
}
