//
//  ExchangeRateRepository.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

import Combine
import Resolver

class ExchangeRateRepository: ExchangeRateRepositoryContract {
    @Injected private var remoteDataSource: ExchangeRateRemoteDataSource
    @Injected private var localDataSource: ExchangeRateRealmDataSource
    
    func syncExchangeRates(currency: String?) -> AnyPublisher<Bool, Error> {
        return remoteDataSource
            .getExchangeRates(currency: currency)
            .flatMap({ responseModelArray -> AnyPublisher<Bool, Error> in
                let responseModel = responseModelArray
                    .map{ $0.toRealmModel() }
                
                return self.localDataSource.saveExcangeRates(exchanges: responseModel )
            })
            .eraseToAnyPublisher()
    }
    
    func getExchangeRates() -> AnyPublisher<[ExchangeRateModel], Error> {
        return localDataSource
            .getExchangeRates()
            .compactMap({ exchangeRateModel in
                return exchangeRateModel
                    .map {  $0.toDomainModel() }
            })
            .eraseToAnyPublisher()
    }
}
