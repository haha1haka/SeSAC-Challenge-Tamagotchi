//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/07/24.
//

import UIKit

class MainViewController: UIViewController {
    
    @IBOutlet weak var dummyLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var inputRiceTextField: UITextField!
    @IBOutlet weak var inputWaterTextField: UITextField!
    @IBOutlet weak var riceButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    @IBOutlet weak var statusPresentLabel: UILabel!

    var tamagotchi = TamagotchiInfo.tamagotchis[UserDefaultsManager.standard.identificationNumber]

    var rice: Int = 0
    var water: Int = 0
    var level: Int = 0
}





// MARK: - viewDidLoad
extension MainViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    func configureUI() {
    
        view.backgroundColor = MyColor.backgroundColor
        
        guard let image = tamagotchi.image.first else { return }
        imageView.image = UIImage(named: image)
        
        nameLabel.text = tamagotchi.name
        nameLabel.myNameLabelSet()
        statusPresentLabel.text = "LV\(level) • 밥알 \(rice)개 • 물방울 \(water)개"
        
        
        inputRiceTextField.myTextFieldSet("밥 주세용")
        inputWaterTextField.myTextFieldSet("물 주세용")
        riceButton.myEatButtonSet("밥먹기")
        waterButton.myEatButtonSet("물먹기")
        
        navigationItem.rightBarButtonItem?.tintColor = MyColor.textColor
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(tappedSettingButton))
        
    }
    
    @objc func tappedSettingButton() {
        let sb = UIStoryboard(StoryboardName.setting)
        guard let settingViewController = sb.instantiateViewController(withIdentifier: SettingViewController.className) as? SettingViewController else { return }
        
        self.navigationController?.pushViewController(settingViewController, animated: true)
    }
}



// MARK: - viewWillAppear
extension MainViewController {
    override func viewWillAppear(_ animated: Bool) {
        
        rice = UserDefaultsManager.standard.rice
        water = UserDefaultsManager.standard.water
    
    }
}


// MARK: - Methodes
extension MainViewController {
    
    @IBAction func tappedRiceButton(_ sender: UIButton) {
        
        guard let input = inputRiceTextField.text else { return }
        guard let inputNumber = Int(input) else { return }
        
        if !inputRiceTextField.isEditing {
            rice += 1
        } else {
            if inputNumber > 99 {
                dummyLabel.text = "99개 이상은 못먹어요ㅠㅠ"
                inputRiceTextField.resignResponder()
            } else {
                rice += inputNumber
                inputRiceTextField.resignResponder()
            }
        }
    }

    @IBAction func tappedWaterButton(_ sender: UIButton) {
        
        guard let input = inputWaterTextField.text else { return }
        guard let inputNumber = Int(input) else { return }
        
        if !inputWaterTextField.isEditing {
            water += 1
        } else {
            if inputNumber > 99 {
                dummyLabel.text = "99개 이상은 못먹어요ㅠㅠ"
                inputWaterTextField.resignResponder()
            } else {
                water += inputNumber
                inputWaterTextField.resignResponder()
            }
        }
    }
    
    

    func calculateLevel(rice: Double, water: Double)  {
        level = Int(((rice / 5) + (water / 2)) / 10)
    }
    
    
    func settingRiceAndWater() {
        
        UserDefaultsManager.standard.rice = rice
        UserDefaultsManager.standard.water = water
        

    }

}





