//
//  HapticManager.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 15.01.2022.
//

import Foundation
import SwiftUI

class HapticManager {
    static let generator = UINotificationFeedbackGenerator()
    
    static func notification(type: UINotificationFeedbackGenerator.FeedbackType) {
        generator.notificationOccurred(type)
    }
}
