//
//  InfoView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 19.01.2022.
//

import SwiftUI

struct InfoView: View {
    
    @Environment(\.dismiss) var dismiss
    let gitHubURL = URL(string: "https://github.com/PalArtemX")!
    let coinGeckoURL = URL(string: "https://www.coingecko.com")!
    let version = "Version 1.0.1, Build 1"
    @EnvironmentObject private var vm: HomeViewModel
    
    
    var body: some View {
        if vm.showSheetSecretView == false {
            NavigationView {
                VStack {
                    // MARK: - Logo
                    LogoView()
                        .frame(height: 200)
                    Text("CryptoCoin")
                        .font(.headline)
                        .foregroundColor(.theme.accent)
                    
                    // MARK: - Version
                    Text(version)
                        .font(.callout)
                        .foregroundColor(.theme.secondaryText)
                        .padding()
                    
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
                    .onTapGesture(count: 5) {
                        withAnimation(.linear) {
                            vm.showSheetSecretView = true
                        }
                    }
                    
                }
                .padding(.vertical)
                .navigationTitle("Informations")
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        ButtonXmarkView { dismiss() }
                    }
                }
            }
        } else {
            SecretView()
        }
        
    }
}










struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
            .environmentObject(HomeViewModel())
    }
}
