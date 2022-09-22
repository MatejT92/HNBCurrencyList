//
//  ApplicationModule.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 22.09.2022..
//

import Resolver

extension Resolver: ResolverRegistering {
    
    public static func registerAllServices() {
        registerMainModule()
        registerExchangeRateModule()
    }
    
    private static func registerMainModule() {
        register { NetworkConnectivity() }.scope(.application)
        register { ForegroundObserver() }.scope(.application)
        
        register { HomeViewFactory() }
        register { HomeView(viewModel: Resolver.resolve()) }
        register {
            HomeViewModel(exchangeUseCase: Config.App.useMockData ? Resolver.resolve(ExchangeRateMockUseCase.self) : Resolver.resolve(ExchangeRateUseCase.self))
        }
        register { _, args in
            ExchangeRateItem(exchangeNumber: args("exchangeNumber"),
                             applicationDate: args("applicationDate"),
                             country: args("country"),
                             currencyCode: args("currencyCode"),
                             currency: args("currency"),
                             unit: args("unit"),
                             valueCurrencyBuy: args("valueCurrencyBuy"),
                             valueCurrencyMedium: args("valueCurrencyMedium"),
                             valueCurrencySale: args("valueCurrencySale")
            )
        }
    }
    
    private static func registerExchangeRateModule() {
        register { ExchangeRateRepository() }
        register { ExchangeRateRemoteDataSource() }
        
        register { ExchangeRateRealmDataSource() }.scope(.application)
        
        if Config.App.useMockData {
            register { ExchangeRateMockUseCase() }
        } else {
            register { ExchangeRateUseCase(repository: Resolver.resolve(ExchangeRateRepository.self)) }
        }
    }
}
