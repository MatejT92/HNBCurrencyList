//
//  LabelStrings.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

import Foundation

enum LabelStrings {
    
    case title
    case subtitle
    case noData
    case exchangeRate
    case currencyBuy
    case currencyMedium
    case currencySale

    var string: String {
        switch self {
        case .title:
            return "Tečajna lista"
        case .subtitle:
            return "subtitle"
        case .noData:
            return "No data"
        case .exchangeRate:
            return "Devizni tečaj:"
        case .currencyBuy:
            return "Kupovni"
        case .currencyMedium:
            return "Srednji"
        case .currencySale:
            return "Prodajni"
        }
    }
}
