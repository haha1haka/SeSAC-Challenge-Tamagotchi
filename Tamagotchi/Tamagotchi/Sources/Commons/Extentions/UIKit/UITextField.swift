//
//  UITextField.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/08/06.
//

import UIKit


extension UITextField {
    func myTextFieldSet(_ placeholer: String) {
        self.placeholder = "\(placeholer)"
        self.backgroundColor = .clear
        self.textAlignment = .center
    }
    func resignResponder() {
        self.text = nil
        self.endEditing(true)
    }
}
