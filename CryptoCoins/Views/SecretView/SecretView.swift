//
//  SecretView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 27.01.2022.
//

import SwiftUI

struct SecretView: View {
    @State private var particleSystem = ParticleSystem()
    @State private var motionHandler = MotionManager()
    @EnvironmentObject private var vm: HomeViewModel
    @Environment(\.dismiss) var dismiss
    
    let options: [(flipX: Bool, flipY: Bool)] = [
        (false, false),
        (true, false),
        (false, true),
        (true, true)
    ]
    
    var body: some View {
        ZStack {

            
            // MARK: - TimelineView
            TimelineView(.animation) { timeline in
                Canvas { context, size in
                    let timelineDate = timeline.date.timeIntervalSinceReferenceDate
                    particleSystem.update(date: timelineDate)
                    
                    context.blendMode = .plusLighter
                    //context.addFilter(.colorMultiply(.green))
                    
                    particleSystem.center = UnitPoint(x: 0.5 + motionHandler.roll, y: 0.5 + motionHandler.pitch)
                    
                    for particle in particleSystem.particles {
                        var contextCopy = context
                        contextCopy.addFilter(.colorMultiply(Color(hue: particle.hue, saturation: 1, brightness: 1)))
                        contextCopy.opacity = 1 - (timelineDate - particle.creationDate)
                        
                        for option in options {
                            var xPos = particle.x * size.width
                            var yPos = particle.y * size.height
                            
                            
                            
                            if option.flipX {
                                xPos = size.width - xPos
                            }
                            if option.flipY {
                                yPos = size.height - yPos
                            }
                            
                            contextCopy.draw(particleSystem.image, at: CGPoint(x: xPos, y: yPos))
                        }
                    }
                }
            }
            .opacity(0.5)
            .gesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { drag in
                        particleSystem.center.x = drag.location.x / UIScreen.main.bounds.width
                        particleSystem.center.y = drag.location.y / UIScreen.main.bounds.height
                    }
            )
            
            // MARK: - Footer
            VStack {
                Spacer()
                VStack {
                    Text("The application was created for a portfolio")
                        .fontWeight(.light)
                    Text("Created by Artem Paliutin")
                        .fontWeight(.light)
                }
                .padding()
                .padding(.vertical)
                .font(.caption)
                .foregroundColor(.gray)
                .opacity(0.7)
                .onTapGesture(count: 5) {
                    vm.showSheetSecretView = false
                    dismiss()
                }
            }
        }
        .ignoresSafeArea()
        //.background(Color.black)
    }
}











struct SecretView_Previews: PreviewProvider {
    static var previews: some View {
        SecretView()
            .environmentObject(HomeViewModel())
    }
}
