//
//  HomeUseCaseContract.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

import Combine

protocol HomeUseCaseContract {
    func getExchangeRates() -> AnyPublisher<[ExchangeRateModel], Error>
    func syncExchangeRates(currency: String?) -> AnyPublisher<Bool, Error> 
}
