//
//  Particle.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 27.01.2022.
//

import Foundation

struct Particle: Hashable {
    let x: Double
    let y: Double
    let creationDate = Date.now.timeIntervalSinceReferenceDate
    let hue: Double
}
