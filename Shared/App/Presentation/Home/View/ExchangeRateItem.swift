//
//  ExchangeRateItem.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 22.09.2022..
//

import SwiftUI

struct ExchangeRateItem: View {
    
    private let padding : CGFloat = 15
    private let elementSpacing : CGFloat = 10
    private let elementSpacingSmall : CGFloat = 5

    @State var exchangeNumber: String
    @State var applicationDate: Date
    @State var country: String
    @State var currencyCode: String
    @State var currency: String
    @State var unit: Int
    @State var valueCurrencyBuy: String
    @State var valueCurrencyMedium: String
    @State var valueCurrencySale: String
    
    var body: some View {
        VStack(alignment: .center, spacing: self.elementSpacingSmall) {
            HStack(alignment: .firstTextBaseline) {
                Text("\(self.currency) / \(self.country)")
                    .font(Fonts.cellTitle.font)
                Spacer()
                Text(self.applicationDate.toString())
                    .font(Fonts.cellSmallText.font)
                    .foregroundColor(Colors.textSecondary.color)
            }
            VStack(alignment: .leading, spacing: self.elementSpacingSmall, content: {
                self.createExchangeRateSection()
            })
        }
        .foregroundColor(Colors.text.color)
        .padding(.all, self.padding)
        .background(Colors.rowColor.color)
    }
    
    @ViewBuilder func createExchangeRateSection() -> some View {
        HStack(spacing: self.elementSpacing) {
            Text(LabelStrings.exchangeRate.string)
                .font(Fonts.themeSubTitle.font)
            Text("\(self.unit) \(self.currency)")
                .foregroundColor(Colors.textSecondary.color)
                .font(Fonts.themeSubTitle.font)
            Spacer()
        }
        HStack(alignment: .center) {
            VStack(spacing: self.elementSpacingSmall) {
                Text(LabelStrings.currencyBuy.string)
                Text(self.valueCurrencyBuy)
            }
            Spacer()
            VStack(spacing: self.elementSpacingSmall) {
                Text(LabelStrings.currencyMedium.string)
                Text(self.valueCurrencyMedium)
            }
            Spacer()
            VStack(spacing: self.elementSpacingSmall) {
                Text(LabelStrings.currencySale.string)
                Text(self.valueCurrencySale)
            }
        }
        .font(Fonts.themeSubTitle.font)
        .padding(.horizontal, self.padding)
    }
}
