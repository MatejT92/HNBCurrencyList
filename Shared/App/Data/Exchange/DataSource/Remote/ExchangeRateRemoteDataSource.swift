//
//  ExchangeRateRemoteDataSource.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

import Foundation
import Combine
import Alamofire

class ExchangeRateRemoteDataSource {

    func getExchangeRates(currency: String?) -> AnyPublisher<[ExchangeRateResponseModel], Error> {
        return AF.request(ExchangeRatesAPIRouter.getExchangeRates(currency: currency))
            .publishDecodable(type: [ExchangeRateResponseModel].self)
            .tryCompactMap { response in
                if let statusCode = response.response?.statusCode, statusCode != 200 {
                    throw statusCode == 404 ? APIError.notFound : APIError.unknown
                }
                guard let responseModel = response.value else { throw APIError.deserialization }
                return responseModel
            }
            .eraseToAnyPublisher()
    }
}

enum APIError: Error {
    case notFound
    case unknown
    case deserialization
    case failure(String)
}
