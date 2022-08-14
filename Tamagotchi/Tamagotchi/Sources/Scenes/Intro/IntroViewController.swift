//
//  IntroCollectionViewController.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/07/24.
//

import UIKit



class IntroViewController: UICollectionViewController {
    var tamagotchis = TamagotchiInfo.tamagotchis
}


// MARK: - viewDidLoad
extension IntroViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialUI()
        collectionView.collectionViewLayout = configureCollectionViewCellLayout()
    }
    
    func configureInitialUI() {
        collectionView.backgroundColor = MyColor.backgroundColor
        configureCollectionViewCellLayout()
        title = "다마고치 선택하기"
    }
    
}


// MARK: - viewWillAppear
extension IntroViewController {
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.string(forKey: "changedUserName") != nil {
            title = "다마고치 변경하기"
        }
    }
}



// MARK: - CollectionView Methods
extension IntroViewController {
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueCell(IntroCollectionViewCell.self, for: indexPath)
        
        indexPath.row < 3 ? cell.configureCellUI(data: tamagotchis[indexPath.row])
        : cell.configureCellUI(data: tamagotchis.last!)
        
        
        return cell
    }
    
    
    
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let sb = UIStoryboard(StoryboardName.popup)
        guard let popupViewController = sb.instantiateViewController(withIdentifier: PopupViewController.className) as? PopupViewController else { return }
        

        popupViewController.modalPresentationStyle = .overFullScreen
        popupViewController.view.backgroundColor = .tertiarySystemFill
        
        
        if indexPath.row < 3 {
            popupViewController.tamagotchi = tamagotchis[indexPath.row]
        } else {
            popupViewController.tamagotchi = tamagotchis.last!
        }
        
        //Detail화면 에서 초기화하기 버튼을 눌렀을시 Userdefault에 값을 넣어 줬습니다
        if UserDefaults.standard.string(forKey: "변경하기버튼") == nil {
            popupViewController.startButton.setTitle("시작하기", for: .normal)
        } else {
            popupViewController.startButton.setTitle("변경하기", for: .normal)
        }
        
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

