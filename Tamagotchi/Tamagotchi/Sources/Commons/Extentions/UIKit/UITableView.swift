//
//  UITableView.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/08/13.
//

import UIKit

extension UITableView {
    func dequeueCell<T: UITableViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = self.dequeueReusableCell(withIdentifier: cellType.className, for: indexPath) as? T else { fatalError() }
        return cell
    }
}
