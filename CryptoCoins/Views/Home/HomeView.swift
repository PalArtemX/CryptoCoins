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
            Color.theme.background
                .ignoresSafeArea()
            
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
        NavigationView {
            HomeView()
                .navigationBarHidden(true)
        }
    }
}
