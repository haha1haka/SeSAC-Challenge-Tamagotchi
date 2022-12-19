//
//  PopupViewController.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/07/24.
//

import UIKit

class PopupViewController: UIViewController {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var buttonStackView: UIStackView!
    @IBOutlet weak var cancelButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    var tamagotchiObject: TamagotchiObjet?
}



// MARK: - viewDidLoad
extension PopupViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialUI()
    }
    
    func configureInitialUI() {
        print("✅PopupViewController\(tamagotchiObject)")
        containerView.backgroundColor = MyColor.backgroundColor
        nameLabel.myNameLabelSet()
        nameLabel.text = tamagotchiObject?.name
        descriptionLabel.myNomalLabelSet()
        descriptionLabel.text = tamagotchiObject?.description
        guard let imageString = tamagotchiObject?.image.last! else { return }
        imageView.image = UIImage(named: imageString)
        cancelButton.mySelectionButtonSet("취소")
        startButton.mySelectionButtonSet("확인")
    }
}



// MARK: - Button Action Methods
extension PopupViewController {
    
    @IBAction func tappedStartButton(_ sender: UIButton) {
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate =  windowScene?.delegate as? SceneDelegate
        let sb = UIStoryboard(name: StoryboardName.main, bundle: nil)
        guard let mainViewController = sb.instantiateViewController(withIdentifier: MainViewController.className)
        as? MainViewController else { return }
        let nav =  UINavigationController(rootViewController: mainViewController)
        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
        
        
        UserDefaultsManager.standard.identificationNumber = tamagotchiObject?.identificationNumber ?? 0
        mainViewController.tamagotchiObject = tamagotchiObject
        
        self.present(nav, animated: true)
    }

    
    @IBAction func tappedCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

