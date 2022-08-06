//
//  UITableViewCell.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/08/06.
//

import UIKit

extension UITableViewCell: ReuseIdenrifier {
    static var reuseIdenrifier: String {
        return String(describing: self)
    }
}
