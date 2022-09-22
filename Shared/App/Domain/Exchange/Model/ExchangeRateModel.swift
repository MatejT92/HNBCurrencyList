//
//  ExchangeRateModel.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

import Foundation

struct ExchangeRateModel: Hashable {
    let exchangeNumber: String
    let applicationDate: Date
    let country: String
    let currencyCode: String
    let currency: String
    let unit: Int
    let valueCurrencyBuy: String
    let valueCurrencyMedium: String
    let valueCurrencySale: String
}
