//
//  UIButton.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/08/06.
//

import UIKit

extension UIButton {
    
    func mySelectionButtonSet(_ name: String) {
        self.setTitle(name, for: .normal)
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        self.setTitleColor(MyColor.textColor, for: .normal)
    }
    
    func myEatButtonSet(_ name: String) {
        self.setTitle(" \(name)", for: .normal)
        self.setTitleColor(MyColor.textColor, for: .normal)
        self.layer.borderColor = MyColor.textColor.cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.tintColor = MyColor.textColor
    }

}
