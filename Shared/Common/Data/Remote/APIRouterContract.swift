//
//  APIRouterContract.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

import Foundation
import Alamofire

protocol APIRouterContract {
    var path: String { get }
    var method: HTTPMethod { get }
    var parameters: [String: Any] { get }
    var authorization: String? { get }
}

extension APIRouterContract {
    var parameters: [String: Any] {
        return [:]
    }
    
    var authorization: String? {
        return ""
    }

    func asURLRequest() throws -> URLRequest {
        let url = URL(string: Config.OAuth.baseAPIUrl)
        var urlRequest = try URLRequest(url: (url?.appendingPathComponent(path))!, method: method)
        urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
    
        switch method {
        case .post:
            return try JSONEncoding.default.encode(urlRequest, with: parameters)
        default:
            return try URLEncoding.default.encode(urlRequest, with: parameters)
        }
        
    }
}
