//
//  Config.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

struct Config {
    struct OAuth {
        private static var productionURL = "https://api.hnb.hr"
        private static var productionBasePrefix = ""

        // using diffrent MACROS we could implement diffrent enpoints
        static var baseAPIUrl = productionURL + productionBasePrefix
    }
    
    //example for defining of usage of mock data
    struct App {
#if DEBUG
        static var useMockData = false
#else
        static var useMockData = false
#endif
    }
    
    struct Realm {
        static let serviceQueueName: String = "RealmQueue"
        static let currentSchemeVersion: UInt64 = 0
    }
}
