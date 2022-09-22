//
//  ExchangeRateRealmModel.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

import Foundation
import RealmSwift
import Combine

class ExchangeRateRealmModel: Object {
    
    @Persisted var exchangeNumber: String?
    @Persisted var applicationDate: String?
    @Persisted var country: String?
    @Persisted(primaryKey: true) var currencyCode: String?
    @Persisted var currency: String?
    @Persisted var unit: Int?
    @Persisted var valueCurrencyBuy: String?
    @Persisted var valueCurrencyMedium: String?
    @Persisted var valueCurrencySale: String?
    
    convenience init(
        exchangeNumber: String?,
        applicationDate: String?,
        country: String?,
        currencyCode: String?,
        currency: String?,
        unit: Int?,
        valueCurrencyBuy: String?,
        valueCurrencyMedium: String?,
        valueCurrencySale: String?
    ) {
        self.init()
        self.exchangeNumber = exchangeNumber
        self.applicationDate = applicationDate
        self.country = country
        self.currencyCode = currencyCode
        self.currency = currency
        self.unit = unit
        self.valueCurrencyBuy = valueCurrencyBuy
        self.valueCurrencyMedium = valueCurrencyMedium
        self.valueCurrencySale = valueCurrencySale
    }
}

extension ExchangeRateRealmModel {
    func toDomainModel() -> ExchangeRateModel {
        return ExchangeRateModel(
            exchangeNumber: self.exchangeNumber ?? "",
            applicationDate: self.applicationDate?.toDate() ?? Date(),
            country: self.country ?? "",
            currencyCode: self.currencyCode ?? "",
            currency: self.currency ?? "",
            unit: self.unit ?? 0,
            valueCurrencyBuy: self.valueCurrencyBuy ?? "",
            valueCurrencyMedium: self.valueCurrencyMedium ?? "",
            valueCurrencySale: self.valueCurrencySale ?? ""
        )
    }
}
