//
//  NSObject.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/08/13.
//

import Foundation

extension NSObject {
  static var className: String {
    return String(describing: Self.self)
  }
}
