//
//  ExchangeRatesAPIRouter.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

import Foundation
import Alamofire

enum ExchangeRatesAPIRouter: URLRequestConvertible, APIRouterContract {
    case getExchangeRates(currency: String?)
    
    var path: String {
        switch self {
        case .getExchangeRates:
            return "/tecajn/v1"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getExchangeRates:
            return .get
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .getExchangeRates(let currency):
            guard let currency = currency else { return [:] }
            return [ "valuta" : currency ]
        }
    }
}
