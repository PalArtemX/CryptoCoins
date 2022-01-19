//
//  CryptoCoinsApp.swift
//  CryptoCoins
//
//  Created by Artem Paliutin on 05.01.2022.
//

import SwiftUI

@main
struct CryptoCoinsApp: App {
    
    @StateObject var vm = HomeViewModel()
    
    init() {
        // title color changes NavigationTitle
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.theme.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .navigationViewStyle(.stack)
            .environmentObject(vm)
        }
    }
}
