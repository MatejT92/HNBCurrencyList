//
//  Fonts.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 22.09.2022..
//

import SwiftUI

enum Fonts {
    case themeTitle
    case themeSubTitle
    case cellTitle
    case cellSubTitle
    case cellSmallText

    var font: Font {
        switch self {
        case .themeTitle:
            return Font.title
        case .themeSubTitle:
            return Font.title3
        case .cellTitle:
            return Fonts.themeBold(size: 21)
        case .cellSubTitle:
            return Fonts.themeRegular(size: 19)
        case .cellSmallText:
            return Fonts.themeRegular(size: 12)
        }
    }
    
    static func themeRegular(size: CGFloat) -> Font {
        return Font.system(size: size)
    }
    
    static func themeBold(size: CGFloat) -> Font {
        return Font.system(size: size).bold()
    }    
}
