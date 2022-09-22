//
//  ExchangeRateUseCase.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

import Foundation
import Combine

class ExchangeRateUseCase: HomeUseCaseContract {
    private var repository: ExchangeRateRepositoryContract
    
    init(repository: ExchangeRateRepositoryContract) {
        self.repository = repository
    }
    
    func getExchangeRates() -> AnyPublisher<[ExchangeRateModel], Error> {
        return self.repository.getExchangeRates()
    }
    
    func syncExchangeRates(currency: String?) -> AnyPublisher<Bool, Error> {
        return self.repository.syncExchangeRates(currency: currency)
    }
}
