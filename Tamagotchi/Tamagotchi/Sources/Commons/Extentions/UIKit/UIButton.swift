//
//  UIButton.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/08/06.
//

import UIKit

extension UIButton {
    
    func mySelectionButtonSet() {
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.borderWidth = 0.5
        self.setTitleColor(MyColor.textColor, for: .normal)
    }
    
    func myEatButtonSet(_ name: String) {
        self.setTitle(" \(name)", for: .normal)
        self.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        self.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        self.layer.borderWidth = 1
        self.layer.cornerRadius = 5
        self.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    }

}
