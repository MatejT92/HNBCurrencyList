//
//  HNBCurrencyListApp.swift
//  Shared
//
//  Created by Matej Terek on 21.09.2022..
//

import SwiftUI
import Resolver

@main
struct HNBCurrencyListApp: App {
    
    @Injected private var homeFactory: HomeViewFactory
    
    var body: some Scene {
        WindowGroup {
            homeFactory.createHomeView()
        }
    }
}
