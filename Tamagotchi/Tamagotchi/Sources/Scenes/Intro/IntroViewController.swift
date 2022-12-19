//
//  IntroCollectionViewController.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/07/24.
//

import UIKit



class IntroViewController: UICollectionViewController {
    var tamagotchiObjects = TamagotchiInfo.tamagotchiObjects
}


// MARK: - viewDidLoad
extension IntroViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print("")
        configureInitialUI()
        collectionView.collectionViewLayout = configureCollectionViewCellLayout()
    }
    
    func configureInitialUI() {
        collectionView.backgroundColor = MyColor.backgroundColor
        title = "다마고치 선택하기"
    }
}


// MARK: - viewWillAppear
extension IntroViewController {
    override func viewWillAppear(_ animated: Bool) {
    }
}




// MARK: - CollectionView Methods
extension IntroViewController {
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueCell(IntroCollectionViewCell.self, for: indexPath)
        indexPath.row < 3 ? cell.configureCellUI(data: tamagotchiObjects[indexPath.row])
        : cell.configureCellUI(data: tamagotchiObjects.last!)
        return cell
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(StoryboardName.popup)
        guard let popupViewController = sb.instantiateViewController(withIdentifier: PopupViewController.className)
        as? PopupViewController else { return }
        
        
        if indexPath.row < 3 {
            popupViewController.tamagotchiObject = tamagotchiObjects[indexPath.row]
            
            
            
            
        } else {
            popupViewController.tamagotchiObject = tamagotchiObjects.last!
            

        }
        
        
        
        popupViewController.modalPresentationStyle = .overFullScreen
        popupViewController.view.backgroundColor = .tertiarySystemFill
        
        

        
        
      
        
        
        
        
        
        
        
        
        self.present(popupViewController, animated: true, completion: nil)
    }
    
    
    
    func configureCollectionViewCellLayout() -> UICollectionViewLayout {
        let layout = UICollectionViewFlowLayout()
        let spacing: CGFloat = 0
        let width: CGFloat = UIScreen.main.bounds.width - (spacing * 4)
        layout.sectionInset = UIEdgeInsets(top: spacing, left: spacing, bottom: spacing, right: spacing)
        layout.minimumLineSpacing = spacing
        layout.minimumInteritemSpacing = spacing
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: width / 3, height: width/3)
        return layout
    }
}

