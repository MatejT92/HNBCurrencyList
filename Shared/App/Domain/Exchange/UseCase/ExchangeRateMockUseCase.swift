//
//  ExchangeRateMockUseCase.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

import Foundation
import Combine

class ExchangeRateMockUseCase: HomeUseCaseContract {
    
    func getExchangeRates() -> AnyPublisher<[ExchangeRateModel], Error> {
        return Just([
            ExchangeRateModel(
                exchangeNumber: "123",
                applicationDate: Date(),
                country: "SAD",
                currencyCode: "840",
                currency: "USD",
                unit: 1,
                valueCurrencyBuy: "2",
                valueCurrencyMedium: "3",
                valueCurrencySale: "4"
            )
        ]
        )
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
    
    func syncExchangeRates(currency: String?) -> AnyPublisher<Bool, Error> {
        return Just(false )
            .setFailureType(to: Error.self)
            .eraseToAnyPublisher()
    }
}
