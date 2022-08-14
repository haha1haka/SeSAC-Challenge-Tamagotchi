//
//  UIViewController.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/08/14.
//

import UIKit

extension UIViewController {
    func embededIn<T: UINavigationController>(_ type: T.Type) -> T { return T(rootViewController: self)
    }

}
