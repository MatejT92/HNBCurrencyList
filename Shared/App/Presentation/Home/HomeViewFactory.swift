//
//  HomeViewFactory.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 22.09.2022..
//

import Foundation
import Resolver
import SwiftUI

class HomeViewFactory {
    func createHomeView() -> HomeView {
        let view: HomeView = Resolver.resolve()
        return view
    }
    
    func createExchangeItem(exchangeNumber: String,
                            applicationDate: Date,
                            country: String,
                            currencyCode: String,
                            currency: String,
                            unit: Int,
                            valueCurrencyBuy: String,
                            valueCurrencyMedium: String,
                            valueCurrencySale: String
            ) -> ExchangeRateItem {
        let view: ExchangeRateItem = Resolver.resolve(args:
                                                        [ "exchangeNumber": exchangeNumber,
                                                          "applicationDate": applicationDate,
                                                          "country": country,
                                                          "currencyCode": currencyCode,
                                                          "currency": currency,
                                                          "unit": unit,
                                                          "valueCurrencyBuy": valueCurrencyBuy,
                                                          "valueCurrencyMedium": valueCurrencyMedium,
                                                          "valueCurrencySale": valueCurrencySale
                                                        ])
        return view
    }
}
