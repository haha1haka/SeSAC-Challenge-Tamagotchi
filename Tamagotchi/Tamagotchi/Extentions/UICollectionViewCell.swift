//
//  UICollectionViewCell.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/08/06.
//

import UIKit

extension UICollectionViewCell: ReuseIdenrifier {
    static var reuseIdenrifier: String {
        return String(describing: self)
    }
}
