//
//  HomeViewModel.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

import Foundation
import Combine
import Resolver

class HomeViewModel: ObservableObject {
    
    @Injected var homeFactory: HomeViewFactory
    @Injected var network: NetworkConnectivity
    @Injected var foregroundObserver: ForegroundObserver

    @Published var dataSource: [ExchangeRateModel] =  []
    
    private var exchangeUseCase: HomeUseCaseContract
    private var cancellables = Set<AnyCancellable>()
    
    init(exchangeUseCase: HomeUseCaseContract) {
        self.exchangeUseCase = exchangeUseCase
        bindModel()
    }
    
    private func bindModel() {
        exchangeUseCase.getExchangeRates()
            .sink { _ in
            } receiveValue: { [weak self] exchangeRates in
                guard let self = self else { return }
                self.dataSource = exchangeRates
            }
            .store(in: &cancellables)
    }
    
    func startDataSync() {
        //Here we can setup different primary value fetch
        exchangeUseCase.syncExchangeRates(currency: nil)
            .sink { _ in } receiveValue: { _ in }
            .store(in: &cancellables)
    }
}
