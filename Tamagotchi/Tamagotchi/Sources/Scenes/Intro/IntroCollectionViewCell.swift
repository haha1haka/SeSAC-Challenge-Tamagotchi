//
//  IntroCollectionViewCell.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/07/24.
//

import UIKit

class IntroCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    func configureCellUI(data: Tamagotchi) {
        imageView.image = UIImage(named: data.image)
        nameLabel.text = data.name
        nameLabel.font = UIFont.systemFont(ofSize: 13,weight: .semibold)
        nameLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        nameLabel.textAlignment = .center
        nameLabel.layer.cornerRadius = 3
        nameLabel.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        nameLabel.layer.borderWidth = 1
    }
}
