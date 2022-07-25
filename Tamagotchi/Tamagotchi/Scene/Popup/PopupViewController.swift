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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitialUI()
    }
    
    @IBAction func tappedStartButton(_ sender: UIButton) {
        
        let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
        let sceneDelegate =  windowScene?.delegate as? SceneDelegate
        let sb = UIStoryboard(name: "Main", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "MainViewController") as! MainViewController
        let nav =  UINavigationController(rootViewController: vc)

        let index = tamagotchi?.index
        UserDefaults.standard.set(index, forKey: "index")
        
        UserDefaults.standard.set(true, forKey: "First")
        
        sceneDelegate?.window?.rootViewController = nav
        sceneDelegate?.window?.makeKeyAndVisible()
        
        self.present(nav, animated: true)
    }

    @IBAction func tappedCancelButton(_ sender: UIButton) {
        self.dismiss(animated: true)
    }
    
}

extension PopupViewController {
    
    func configureInitialUI() {
        
        containerView.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        nameLabel.font = UIFont.systemFont(ofSize: 13,weight: .semibold)
        nameLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        nameLabel.textAlignment = .center
        nameLabel.layer.cornerRadius = 3
        nameLabel.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        nameLabel.layer.borderWidth = 1
        
        descriptionLabel.font = UIFont.systemFont(ofSize: 14,weight: .regular)
        descriptionLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        descriptionLabel.textAlignment = .center
        
        cancelButton.setTitle("취소", for: .normal)
        cancelButton.layer.borderColor = UIColor.lightGray.cgColor
        cancelButton.layer.borderWidth = 0.5
        cancelButton.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        
        startButton.setTitle("시작하기", for: .normal)
        startButton.layer.borderColor = UIColor.lightGray.cgColor
        startButton.layer.borderWidth = 0.5
        startButton.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        
    }
    
}
