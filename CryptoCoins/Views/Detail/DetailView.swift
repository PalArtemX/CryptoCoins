//
//  DetailView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 18.01.2022.
//

import SwiftUI


// MARK: - DetailView
struct DetailView: View {
    @StateObject var detailVM: DetailViewModel
    private let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    private let spacing: CGFloat = 30
    
    init(coin: Coin) {
        _detailVM = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        ScrollView {
            VStack(spacing: 20.0) {
                // MARK: - 
                Text("")
                    .frame(height: 150)
                
                // MARK: - Title
                OverviewSubview()
                Divider()
                
                // MARK: - Overview Grid
                LazyVGrid(
                    columns: columns,
                    alignment: .leading,
                    spacing: spacing,
                    pinnedViews: []) {
                        ForEach(detailVM.overviewsStatistics) { stat in
                            StatisticView(statistic: stat)
                        }
                    }
                
                // MARK: - Title
                AdditionalDetailsSubview()
                Divider()
                
                // MARK: - Additional Details Grid
                LazyVGrid(
                    columns: columns,
                    alignment: .leading,
                    spacing: spacing,
                    pinnedViews: []) {
                        ForEach(detailVM.additionalStatistics) { stat in
                            StatisticView(statistic: stat)
                        }
                    }
            }
            .padding()
        }
        .navigationTitle(detailVM.coin.name)
        .toolbar {
            ToolbarItem(placement: .navigationBarTrailing) {
                HStack {
                    Text(detailVM.coin.symbol.uppercased())
                        .font(.headline)
                        .foregroundColor(.theme.secondaryText)
                    
                    ImageCoinView(coin: detailVM.coin)
                        .frame(width: 25, height: 25)
                }
                
            }
        }
    }
}










struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            DetailView(coin: development.coin)
        }
    }
}


// MARK: - Subview
// OverviewSubview
struct OverviewSubview: View {
    var body: some View {
        Text("Overview")
            .font(.title)
            .bold()
            .foregroundColor(.accentColor)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// AdditionalDetailsSubview
struct AdditionalDetailsSubview: View {
    var body: some View {
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundColor(.accentColor)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}


