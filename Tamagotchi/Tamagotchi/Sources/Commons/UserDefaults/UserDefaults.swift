//
//  UserDefaultManager.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/08/06.
//

import Foundation

class UserDefaultsManager {
    
    static let standard = UserDefaultsManager()

    let userDefaults = UserDefaults.standard
    
    
    enum UserDefaultKeys: String {
        case identificationNumber, rice, water
    }
    
    var identificationNumber: Int {
        get {
            return userDefaults.integer(forKey: UserDefaultKeys.identificationNumber.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: UserDefaultKeys.identificationNumber.rawValue)
        }
    }
    
    
    var rice: Int {
        get {
            return userDefaults.integer(forKey: UserDefaultKeys.rice.rawValue)
        }
        set {
            userDefaults.set(newValue, forKey: UserDefaultKeys.rice.rawValue)
        }
    }
    
    var water: Int {
        get {
            return userDefaults.integer(forKey: UserDefaultKeys.water.rawValue)
        }
        set {
            userDefaults.set(newValue,forKey: UserDefaultKeys.water.rawValue)
        }
    }
    
    
}
