//
//  IntroCollectionViewController.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/07/24.
//

import UIKit



class IntroCollectionViewController: UICollectionViewController {
    
    var tamagotchiInfo = TamagotchiInfo()
    
    var str: String = "다마고치 선택하기" {
        didSet {
            title = str
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialUI()
        configureCollectionViewCellLayout()
    }
    override func viewDidAppear(_ animated: Bool) {
        title = str
    }

    func configureInitialUI() {
        collectionView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
    }
    
    func configureCollectionViewCellLayout() {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 0
        let width: CGFloat = UIScreen.main.bounds.width - (spacing * 4)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width / 3, height: width/3)
        collectionView.collectionViewLayout = layout
    }
}

extension IntroCollectionViewController {
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        tamagotchiInfo.tamagotchi.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroCollectionViewCell",
                                                      for: indexPath) as! IntroCollectionViewCell
        cell.configureCellUI(data: tamagotchiInfo.tamagotchi[indexPath.row])
        return cell
    }
    
    // MARK: 화면이동 (intro -> popup)
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Popup", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PopupViewController") as! PopupViewController
        vc.modalPresentationStyle = .overFullScreen
        vc.view.backgroundColor = .tertiarySystemFill
        vc.imageView.image = UIImage(named: "\( tamagotchiInfo.tamagotchi[indexPath.row].image)")
        vc.nameLabel.text = tamagotchiInfo.tamagotchi[indexPath.row].name
        vc.descriptionLabel.text = tamagotchiInfo.tamagotchi[indexPath.row].description
        vc.tamagotchi = tamagotchiInfo.tamagotchi[indexPath.row]
        
        self.present(vc, animated: true, completion: nil)
    }
}

