//
//  Realm.swift
//  HNBCurrencyList (iOS)
//
//  Created by Matej Terek on 21.09.2022..
//

import Foundation
import RealmSwift

extension Realm {
    private static let serviceQueue = DispatchQueue(label: Config.Realm.serviceQueueName)

    static var currentConfiguretion: Realm.Configuration {
        get {
            return Realm.Configuration(schemaVersion: Config.Realm.currentSchemeVersion)
        }
    }
    
    static var currentRealm: Realm {
        return try! Realm(configuration: Realm.currentConfiguretion)
    }
    
    static var currentGlobalQueueRealm: Realm {
        return try! Realm(configuration: Realm.currentConfiguretion, queue: serviceQueue)
    }
    
    public func write(_ block: (() throws -> Void)) throws {
        beginWrite()
        do {
            try block()
        } catch let error {
            if isInWriteTransaction { cancelWrite() }
            throw error
        }
        if isInWriteTransaction { try commitWrite() }
    }
}
