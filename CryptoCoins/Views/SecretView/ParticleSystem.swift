//
//  ParticleSystem.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 27.01.2022.
//

import SwiftUI

class ParticleSystem {
    let image = Image("spark")
    var particles = Set<Particle>()
    var center = UnitPoint.center
    var hue = 0.0
    
    func update(date: TimeInterval) {
        let deleteDate = date - 1
        
        for particle in particles {
            if particle.creationDate < deleteDate {
                particles.remove(particle)
            }
        }
        
        let newParticle = Particle(x: center.x, y: center.y, hue: hue)
        particles.insert(newParticle)
        hue += 0.01
        if hue > 1 {
            hue -= 1
        }
    }
}
