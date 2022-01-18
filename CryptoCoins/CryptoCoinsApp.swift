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
    @StateObject var detailVM = DetailViewModel()
    
    init() {
        // title color changes NavigationTitle
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor : UIColor(Color.accentColor)]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor : UIColor(Color.accentColor)]
    }
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                HomeView()
                    .navigationBarHidden(true)
            }
            .environmentObject(vm)
            .environmentObject(detailVM)
        }
    }
}
