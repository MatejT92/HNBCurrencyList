//
//  ExchangeRateRealmDataSource.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

import Foundation
import RealmSwift
import Combine

class ExchangeRateRealmDataSource {
    
    func getExchangeRates() -> AnyPublisher<[ExchangeRateRealmModel], Error> {
        
        let realm = Thread.isMainThread ? Realm.currentRealm : Realm.currentGlobalQueueRealm
        
        return realm.objects(ExchangeRateRealmModel.self)
            .collectionPublisher
            .map({ results in
                results.map { $0 }
            })
            .eraseToAnyPublisher()
    }
    
    func saveExcangeRates(exchanges : [ExchangeRateRealmModel]) -> AnyPublisher<Bool, Error> {
        do {
            let realm = Thread.isMainThread ? Realm.currentRealm : Realm.currentGlobalQueueRealm
            
            if realm.isInWriteTransaction {
                return Just(false)
                    .setFailureType(to: Error.self)
                    .eraseToAnyPublisher()
            } else {
                try? realm.write {
                    realm.add(exchanges, update: Realm.UpdatePolicy.modified)
                }
            }

            return Just(true)
                .setFailureType(to: Error.self)
                .eraseToAnyPublisher()
        }
    }
}
