//
//  HomeView.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var viewModel: HomeViewModel
    private let paddingBottom : CGFloat = 40
    
    var body: some View {
        NavigationView {
            ZStack {
                Colors.background.color
                    .ignoresSafeArea(.all)
                
                if self.viewModel.dataSource.count == 0 {
                    createNoDataScreen()
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        createDataTable()
                    }
                    .navigationTitle(LabelStrings.title.string)
                }
            }
        }
        .onReceive(self.viewModel.foregroundObserver.$enteredForeground) { _ in
            guard self.viewModel.network.startAndCheck() else { return }
            self.viewModel.startDataSync()
        }
        .onChange(of: self.viewModel.network.connected) { isUserConnected in
            guard isUserConnected else { return }
            self.viewModel.startDataSync()
        }

    }
    
    @ViewBuilder func createNoDataScreen() -> some View {
        VStack {
            Spacer()
            Text(LabelStrings.noData.string)
            Spacer()
        }
    }
    
    @ViewBuilder func createDataTable() -> some View {
        ScrollView {
            LazyVStack(spacing: 5) {
                withAnimation {
                    showItemList()
                }
            }
        }
        .padding(.bottom, self.paddingBottom)
    }
    
    @ViewBuilder func showItemList() -> some View {
        ForEach(self.viewModel.dataSource, id: (\.self)) { item in
            HStack {
                self.viewModel.homeFactory.createExchangeItem(
                    exchangeNumber: item.exchangeNumber,
                    applicationDate: item.applicationDate,
                    country: item.country,
                    currencyCode: item.currencyCode,
                    currency: item.currency,
                    unit: item.unit,
                    valueCurrencyBuy: item.valueCurrencyBuy,
                    valueCurrencyMedium: item.valueCurrencyMedium,
                    valueCurrencySale: item.valueCurrencySale
                )
            }
        }
    }
}
