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
    
    func configureCellUI(data: TamagotchiObjet) {
        
        guard let image = data.image.last else { return }
        imageView.image = UIImage(named: image)
        
        nameLabel.text = data.name

        nameLabel.myNameLabelSet()
    }
}
