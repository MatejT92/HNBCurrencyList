//
//  ForegroundObserver.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 22.09.2022..
//

import SwiftUI

class ForegroundObserver: ObservableObject {
    @Published var enteredForeground = true

    init() {
        NotificationCenter.default.addObserver(self, selector: #selector(willEnterForeground), name: UIApplication.willEnterForegroundNotification, object: nil)
    }
    @objc func willEnterForeground() {
        enteredForeground.toggle()
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
}
