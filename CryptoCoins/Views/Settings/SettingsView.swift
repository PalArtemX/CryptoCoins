//
//  SettingsView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 19.01.2022.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) var dismiss
    let gitHubURL = URL(string: "https://github.com/PalArtemX")!
    let coinGeckoURL = URL(string: "https://github.com/PalArtemX")!
    
    var body: some View {
        NavigationView {
            VStack {
                
                // MARK: - List
                List {
                    // MARK: - Section CoinGecko
                    Section {
                        Text("The cryptocurrency data that is used in this app comes from a free API from CoinGecko. Prices may be slightly delayed.")
                            .font(.callout)
                        Link(destination: coinGeckoURL) {
                            HStack {
                                Text("Website")
                                    .fontWeight(.bold)
                                Image("coingecko")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(height: 18)
                            }
                            .font(.caption)
                            .foregroundColor(.accentColor)
                        }
                    } header: {
                        Image("coingecko")
                            .resizable()
                            .scaledToFit()
                            .frame(height: 30)
                    }
                    
                    // MARK: - Developer
                    Section {
                        Link(destination: gitHubURL) {
                            Text("Go to GitHub")
                                .font(.caption)
                                .fontWeight(.bold)
                                .foregroundColor(.accentColor)
                        }
                    } header: {
                        HStack {
                            Image(systemName: "person.text.rectangle")
                            Text("Developer")
                        }
                        .font(.headline)
                    }

                    
                    
                }
                .listStyle(.plain)
                
                
                // MARK: - Footer
                VStack {
                    Text("The application was created for a portfolio")
                        .fontWeight(.light)
                    Text("Created by Artem Paliutin")
                        .fontWeight(.light)
                }
                .font(.caption)
                .foregroundColor(.gray)
                .opacity(0.7)
                
            }
            .padding(.vertical)
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    ButtonXmarkView { dismiss() }
                }
            }
        }
    }
}










struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
