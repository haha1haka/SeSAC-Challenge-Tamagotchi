//
//  UICollectionView.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/08/13.
//

import UIKit

extension UICollectionView {
    func dequeueCell<T: UICollectionViewCell>(_ cellType: T.Type, for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withReuseIdentifier: cellType.className, for: indexPath) as? T else { fatalError() }
        return cell
    }
}
