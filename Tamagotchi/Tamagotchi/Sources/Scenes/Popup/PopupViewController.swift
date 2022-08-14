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
    
    var tamagotchi: Tamagotchi?
}

// MARK: - viewDidLoad
extension PopupViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialUI()
    }
    
    func configureInitialUI() {
        containerView.backgroundColor = MyColor.backgroundColor
        nameLabel.myNameLabelSet()
        descriptionLabel.myNomalLabelSet()
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.mySelectionButtonSet()
        startButton.mySelectionButtonSet()
    }
}
// MARK: - Button Action Methods
extension PopupViewController {
    
    @IBAction func tappedStartButton(_ sender: UIButton) {
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate =  windowScene?.delegate as? SceneDelegate
        let sb = UIStoryboard(name: StoryboardName.main, bundle: nil)
        guard let vc = sb.instantiateViewController(withIdentifier: MainViewController.className)
                as? MainViewController else { return }
        let nav =  UINavigationController(rootViewController: vc)

        let index = tamagotchi?.identificationNumber

        
        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
        
        self.present(nav, animated: true)
    }

    @IBAction func tappedCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
}

