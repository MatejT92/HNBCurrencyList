//
//  ExchangeRateRepositoryContract.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

import Combine
import UIKit

protocol ExchangeRateRepositoryContract {
    func getExchangeRates() -> AnyPublisher<[ExchangeRateModel], Error>
    func syncExchangeRates(currency: String?) -> AnyPublisher<Bool, Error>
}
