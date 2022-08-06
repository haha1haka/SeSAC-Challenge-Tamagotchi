//
//  UIViewController.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/08/06.
//

import UIKit

extension UIViewController: ReuseIdenrifier {
    static var reuseIdenrifier: String {
        return String(describing: self)
    }
}
