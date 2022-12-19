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

    var tamagotchiObject: TamagotchiObjet?
    
    var rice = 0
    var water = 0
    
    var level: Int {
        let measures = Int((rice / 5) + (water / 2)) / 10
        if measures <= 1{
            return 1
        } else if measures > 1 && measures < 10 {
            return measures
        } else {
            return 10
        }
    }
    var imageString: String {
        if self.level <= 1 {
            return tamagotchiObject?.image.first ?? ""
        } else if level > 1 && level < 10 {
            return tamagotchiObject?.image[level] ?? ""
        } else {
            return tamagotchiObject?.image.last ?? ""
        }
        
    }

    
}





// MARK: - viewDidLoad
extension MainViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("⭐️MainViewController\(tamagotchiObject)")
        //내 캐릭터 UserDefaults
        UserDefaultsManager.standard.identificationNumber = tamagotchiObject?.identificationNumber ?? 0
        
        
        
        configureUI()
        
    }
    
    func configureUI() {
    
        view.backgroundColor = MyColor.backgroundColor
        
        guard let image = tamagotchiObject?.image.first else { return }
        imageView.image = UIImage(named: imageString)
        
        nameLabel.text = tamagotchiObject?.name
        nameLabel.myNameLabelSet()
        
        statusPresentLabel.text = "LV\(level) • 밥알 \(rice)개 • 물방울 \(water)개"
        statusPresentLabel.myNomalLabelSet()
        
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
        super.viewWillAppear(animated)
        rice = UserDefaultsManager.standard.rice
        water = UserDefaultsManager.standard.water
        imageView.image = UIImage(named: imageString)
        configureUI()

    }
}


// MARK: - Methodes
extension MainViewController {
    
    @IBAction func tappedRiceButton(_ sender: UIButton) {


        if !inputRiceTextField.isEditing {
            rice += 1
            print("🍘")
            statusPresentLabel.text = "LV\(level) • 밥알 \(rice)개 • 물방울 \(water)개"
            UserDefaultsManager.standard.rice = rice
            imageView.image = UIImage(named: imageString)
        } else {
            if Int(inputRiceTextField.text ?? "")! > 99 {
                dummyLabel.text = "99개 이상은 못먹어요ㅠㅠ"
                inputRiceTextField.resignResponder()
            } else {
                rice += Int(inputRiceTextField.text ?? "")!
                inputRiceTextField.resignResponder()
            }
        }
        
    }

    @IBAction func tappedWaterButton(_ sender: UIButton) {
    
        if !inputWaterTextField.isEditing {
            water += 1
            print("🍉")
            statusPresentLabel.text = "LV\(level) • 밥알 \(rice)개 • 물방울 \(water)개"
            UserDefaultsManager.standard.water = water
            imageView.image = UIImage(named: imageString)
        } else {
            if Int(inputWaterTextField.text ?? "")! > 99 {
                dummyLabel.text = "99개 이상은 못먹어요ㅠㅠ"
                inputWaterTextField.resignResponder()
            } else {
                water += Int(inputWaterTextField.text ?? "")!
                UserDefaultsManager.standard.water = water
                imageView.image = UIImage(named: imageString)
                statusPresentLabel.text = "LV\(level) • 밥알 \(rice)개 • 물방울 \(water)개"
                inputWaterTextField.resignResponder()
            }
        }
    }
    
    


    
    
    func settingRiceAndWater() {
        
        UserDefaultsManager.standard.rice = rice
        UserDefaultsManager.standard.water = water
        

    }

}





