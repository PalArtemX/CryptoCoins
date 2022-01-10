//
//  Statistic.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 10.01.2022.
//

import Foundation

struct Statistic: Identifiable {
    let id = UUID()
    let title: String
    let value: String
    let percentageChange: Double?
    
    init(title: String, value: String, percentageChange: Double? = nil) {
        self.title = title
        self.value = value
        self.percentageChange = percentageChange
    }
}
