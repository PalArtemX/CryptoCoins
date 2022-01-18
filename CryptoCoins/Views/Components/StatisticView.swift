//
//  StatisticView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 10.01.2022.
//

import SwiftUI

struct StatisticView: View {
    
    let statistic: Statistic
    
    var body: some View {
        VStack(alignment: .leading) {
            // MARK: - Title
            Text(statistic.title)
                .font(.caption)
                .foregroundColor(.theme.secondaryText)
            
            // MARK: - Value
            Text(statistic.value)
                .font(.headline)
                .foregroundColor(.accentColor)
            
            // MARK: - Percentage Change
            HStack(spacing: 1.0) {
                Image(systemName: "triangle.inset.filled")
                    .symbolRenderingMode(.hierarchical)
                    .font(.caption)
                    .rotationEffect(
                        Angle(degrees: (statistic.percentageChange ?? 0) >= 0 ? 0 : 180))
                    
                
                Text(statistic.percentageChange?.asPercentString() ?? "")
                    .font(.caption)
                .bold()
            }
            .foregroundColor((statistic.percentageChange ?? 0) >= 0 ? .theme.green : .theme.red)
            .opacity(statistic.percentageChange == nil ? 0.0 : 1.0)
        }
    }
}










struct StatisticView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            StatisticView(statistic: development.stat1)
                .previewLayout(.sizeThatFits)
                .padding()
            StatisticView(statistic: development.stat3)
                .preferredColorScheme(.dark)
                .previewLayout(.sizeThatFits)
                .padding()
            StatisticView(statistic: development.stat2)
                .preferredColorScheme(.light)
                .previewLayout(.sizeThatFits)
                .padding()
        }
    }
}
