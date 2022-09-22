//
//  ExchangeRateResponseModel.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

struct ExchangeRateResponseModel: Codable {
    let exchangeNumber: String?
    let applicationDate: String?
    let country: String?
    let currencyCode: String?
    let currency: String?
    let unit: Int?
    let valueCurrencyBuy: String?
    let valueCurrencyMedium: String?
    let valueCurrencySale: String?
}

extension ExchangeRateResponseModel {
    enum CodingKeys: String, CodingKey {
        case exchangeNumber = "Broj tečajnice"
        case applicationDate = "Datum primjene"
        case country = "Država"
        case currencyCode = "Šifra valute"
        case currency = "Valuta"
        case unit = "Jedinica"
        case valueCurrencyBuy = "Kupovni za devize"
        case valueCurrencyMedium = "Srednji za devize"
        case valueCurrencySale = "Prodajni za devize"
    }
}

extension ExchangeRateResponseModel {
    func toRealmModel() -> ExchangeRateRealmModel {
        return ExchangeRateRealmModel(
            exchangeNumber: self.exchangeNumber,
            applicationDate: self.applicationDate,
            country: self.country,
            currencyCode: self.currencyCode,
            currency: self.currency,
            unit: self.unit,
            valueCurrencyBuy: self.valueCurrencyBuy,
            valueCurrencyMedium: self.valueCurrencyMedium,
            valueCurrencySale: self.valueCurrencySale
        )
    }
}
