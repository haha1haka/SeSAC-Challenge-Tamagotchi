//
//  IntroCollectionViewController.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/07/24.
//

import UIKit



class IntroCollectionViewController: UICollectionViewController {
    
    var tamagotchCollection = TamagotchiCollection()
    
    static var changedNavigationBarTitleName: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialUI()
        configureCollectionViewCellLayout()
        title = "다마고치 선택하기"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        if UserDefaults.standard.string(forKey: "changedUserName") != nil {
            title = "다마고치 변경하기"
        }
    }
    
    func distinguishIntroScene() {
        if UserDefaults.standard.bool(forKey: "distinguishIntroScene") {
            
        }
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
        return 20
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "IntroCollectionViewCell",
                                                      for: indexPath) as! IntroCollectionViewCell
        

        
        indexPath.row < 3 ? cell.configureCellUI(data: tamagotchCollection.tamagotchi[indexPath.row])
                          : cell.configureCellUI(data: tamagotchCollection.tamagotchi.last!)
        
        
        return cell
        
    }
    
    // MARK: 화면이동 (intro -> popup)
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let sb = UIStoryboard(name: "Popup", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "PopupViewController")
        as! PopupViewController
        vc.modalPresentationStyle = .overFullScreen
        vc.view.backgroundColor = .tertiarySystemFill
        
        if indexPath.row < 3 {
            vc.imageView.image = UIImage(named: "\( tamagotchCollection.tamagotchi[indexPath.row].image)")
            vc.nameLabel.text = tamagotchCollection.tamagotchi[indexPath.row].name
            vc.descriptionLabel.text = tamagotchCollection.tamagotchi[indexPath.row].description
            vc.tamagotchi = tamagotchCollection.tamagotchi[indexPath.row]
            
            //Detail화면 에서 초기화하기 버튼을 눌렀을시 Userdefault에 값을 넣어 줬습니다
            if UserDefaults.standard.string(forKey: "변경하기버튼") == nil {
                vc.startButton.setTitle("시작하기", for: .normal)
            } else {
                vc.startButton.setTitle("변경하기", for: .normal)
            }
        }
        
        self.present(vc, animated: true, completion: nil)
    }
}

