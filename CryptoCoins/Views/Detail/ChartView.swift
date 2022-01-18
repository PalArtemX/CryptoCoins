//
//  ChartView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 18.01.2022.
//

import SwiftUI

struct ChartView: View {
    
    private let data: [Double]
    private let maxY: Double
    private let minY: Double
    private let lineColor: Color
    private let startDate: Date
    private let endingDate: Date
    @State private var percentage: CGFloat = 0
    
    init(coin: Coin) {
        data = coin.sparklineIn7D?.price ?? []
        maxY = data.max() ?? 0
        minY = data.min() ?? 0
        
        let priceChange = (data.last ?? 0) - (data.first ?? 0)
        lineColor = priceChange > 0 ? Color.theme.green : Color.theme.red
        
        endingDate = Date(coinGeckoString: coin.lastUpdated ?? "")
        startDate = endingDate.addingTimeInterval(-7 * 24 * 60 * 60)
    }
    
    var body: some View {
        VStack {
            chartView
                .frame(height: 200)
                .background(chartBackground)
                .overlay(chartYAxis.padding(.horizontal), alignment: .leading)
            
            chartDateLabel
                .padding(.horizontal)
        }
        .font(.caption)
        .foregroundColor(.theme.secondaryText)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                withAnimation(.linear(duration: 1.0)) {
                    percentage = 1.0
                }
            }
        }
    }
}










struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView(coin: development.coin)
    }
}


// MARK: - extension View
extension ChartView {
    // MARK: - chartView
    private var chartView: some View {
        GeometryReader { geometry in
            Path { path in
                for index in data.indices {
                    let xPosition = geometry.size.width / CGFloat(data.count) * CGFloat(index + 1)
                    
                    let yAxis = maxY - minY
                    
                    let yPosition = (1 - CGFloat((data[index] - minY) / yAxis)) * geometry.size.height
                    
                    if index == 0 {
                        path.move(to: CGPoint(x: xPosition, y: yPosition))
                    }
                    
                    path.addLine(to: CGPoint(x: xPosition, y: yPosition))
                    
                }
            }
            .trim(from: 0, to: percentage)
            .stroke(lineColor, style: StrokeStyle(lineWidth: 2, lineCap: .round, lineJoin: .round))
            .shadow(color: lineColor.opacity(0.5), radius: 5, x: 0, y: 5)
        }
    }
    
    // MARK: - chartBackground
    private var chartBackground: some View {
        VStack {
            Divider()
            Spacer()
            Divider()
            Spacer()
            Divider()
        }
    }
    
    // MARK: - chartYAxis
    private var chartYAxis: some View {
        VStack {
            Text(maxY.formattedWithAbbreviations())
            Spacer()
            let price = ((maxY + minY) / 2).formattedWithAbbreviations()
            Text(price)
            Spacer()
            Text(minY.formattedWithAbbreviations())
        }
    }
    
    // MARK: - chartDateLabel
    private var chartDateLabel: some View {
        HStack {
            Text(startDate.asShortDateString())
            Spacer()
            Text(endingDate.asShortDateString())
        }
    }
    
}
