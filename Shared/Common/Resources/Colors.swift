//
//  Colors.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

import Foundation
import SwiftUI

enum Colors {
    case background
    case text
    case textSecondary
    case rowColor

    var color: Color {
        switch self {
        case .background:
            return Color.white
        case .text:
            return Color.black
        case .textSecondary:
            return Color.black
                .opacity(0.8)
        case .rowColor:
            return Color.gray
                .opacity(0.05)
        }
    }
}
