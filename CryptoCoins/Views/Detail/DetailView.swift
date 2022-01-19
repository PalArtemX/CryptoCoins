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
    @State private var showFullDescription = false
    
    private let columns: [GridItem] = [GridItem(.flexible()), GridItem(.flexible())]
    private let spacing: CGFloat = 30
    
    init(coin: Coin) {
        _detailVM = StateObject(wrappedValue: DetailViewModel(coin: coin))
    }
    
    var body: some View {
        ScrollView {
            
            VStack {
                // MARK: - ChartView
                ChartView(coin: detailVM.coin)
                    .padding(.vertical)
                
                VStack(spacing: 20.0) {
                    // MARK: - Title
                    OverviewSubview()
                    Divider()
                    
                    // MARK: - Description
                    ZStack {
                        if let coinDescription = detailVM.coinDescription, !coinDescription.isEmpty {
                            VStack(alignment: .leading) {
                                Text(coinDescription)
                                    .lineLimit(showFullDescription ? nil : 3)
                                    .font(.callout)
                                    .foregroundColor(.theme.secondaryText)
                                
                                Button {
                                    withAnimation(.easeInOut) {
                                        showFullDescription.toggle()
                                    }
                                } label: {
                                    Image(systemName: showFullDescription ? "arrow.up.to.line.compact" : "arrow.down.to.line.compact")
                                        .symbolRenderingMode(.hierarchical)
                                    
                                    Text(showFullDescription ? "Less" : "Read more")
                                        .fontWeight(.bold)
                                }
                                .font(.caption)
                            }
                        }
                    }
                    
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
                    
                    // MARK: - Website
                    VStack(alignment: .leading, spacing: 20.0) {
                        if let webSiteString = detailVM.webSiteURL, let url = URL(string: webSiteString) {
                            Link(destination: url) {
                                Image(systemName: "network")
                                    .symbolRenderingMode(.hierarchical)
                                Text("Website")
                            }
                        }
                        
                        if let redditString = detailVM.redditURL, let url = URL(string: redditString) {
                            Link(destination: url) {
                                Image(systemName: "person.3.sequence")
                                    .symbolRenderingMode(.hierarchical)
                                Text("Reddit")
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                }
                .padding()
            }
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
            .foregroundColor(.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}

// AdditionalDetailsSubview
struct AdditionalDetailsSubview: View {
    var body: some View {
        Text("Additional Details")
            .font(.title)
            .bold()
            .foregroundColor(.theme.accent)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}


