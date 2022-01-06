//
//  HomeView.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 05.01.2022.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack {
            // MARK: - Background
            BackgroundView()
            
            VStack {
                // MARK: - HeaderHomeView
                HeaderHomeView()
                
                Spacer(minLength: 0)
            }
        }
    }
}










struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
        }
    }
}
