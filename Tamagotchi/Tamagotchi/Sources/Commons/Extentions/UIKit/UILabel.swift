//
//  UILabel.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/08/06.
//

import UIKit

extension UILabel {
    
    func myNomalLabelSet() {
        self.font = UIFont.systemFont(ofSize: 13,weight: .bold)
        self.textAlignment = .center
        self.textColor = MyColor.textColor
    }
    
    
    func myNameLabelSet() {
        self.myNomalLabelSet()
        self.layer.cornerRadius = 3
        self.layer.borderColor = MyColor.textColor.cgColor
        self.layer.borderWidth = 1
    }

}
