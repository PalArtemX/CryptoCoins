//
//  String.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 19.01.2022.
//

import Foundation

extension String {
    
    // removes HTML code from the description
    var removingHTMLOccurances: String {
        return self.replacingOccurrences(of: "<[^>]+>", with: "", options: .regularExpression, range: nil)
    }
    
}
