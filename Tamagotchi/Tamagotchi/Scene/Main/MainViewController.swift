//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/07/24.
//

import UIKit

class MainViewController: UIViewController {
    
    var tamagotchiCollection = TamagotchiCollection()
    var tamagotchi: Tamagotchi?
    var changedUserName: String = "대장"
    var changedName = UserDefaults.standard.string(forKey: "changedUserName") == nil ? "대장" : UserDefaults.standard.string(forKey: "changedUserName")
    
    var currentName: String?
    
    
    var dummyLabels: [String] = []
    
    
    @IBOutlet weak var bubbleImageView: UIImageView!
    @IBOutlet weak var dummyLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var inputRiceTextField: UITextField!
    @IBOutlet weak var inputWaterTextField: UITextField!
    @IBOutlet weak var riceButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    
    @IBOutlet weak var statusPresentLabel: UILabel! {
        didSet {
            statusPresentLabel.text = "LV\(levelCounter)  밥알 \(riceCounter)개 • 물방울 \(waterCounter)개"
        }
    }
    
    var levelCounter: Int = 1 {
        didSet {
            imageView.image = UIImage(named: "\(tamagotchi!.identificationNumber+1)-\(levelCounter)")
        }
    }
    
    var identificationNumber: Int?  // 0,1,2
    var riceCounter: Int = 0
    var waterCounter: Int = 0
    var levelCalculator: Int = 0
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        identificationNumber = UserDefaults.standard.integer(forKey: "identificationNumber")
        tamagotchi = tamagotchiCollection.tamagotchi[identificationNumber!]
        userdefaultLoadData()
        imageView.image = UIImage(named:"\(tamagotchi!.identificationNumber+1)-\(levelCounter)")
        nameLabel.text = tamagotchi?.name
        statusPresentLabel.text = "LV\(levelCounter)  밥알 \(riceCounter)개 • 물방울 \(waterCounter)개"
        
        
        configureInitialUI()
        
        
    }

    
    override func viewWillAppear(_ animated: Bool) {

        userdefaultLoadData()
        if UserDefaults.standard.string(forKey: "changedUserName") == nil {
            title = "대장님의 다마고치"
            currentName = "대장"
            dummyLabel.text = currentName! + "님 잘 쉬셨나요?"
        } else {
            title = "\(UserDefaults.standard.string(forKey: "changedUserName")!) 님의 다마고치"
            currentName = "\(UserDefaults.standard.string(forKey: "changedUserName")!)"
            dummyLabel.text = (currentName ?? "대장") + "님 잘 쉬셨나요?"
        
        }
        dummyLabels = ["\(currentName ?? "대장") 님 오늘 잘 잘 자셨나요?",
                     "\(currentName ?? "대장") 님 오늘 깃허브 푸쉬 하셨어영?",
                     "\(currentName ?? "대장") 님 오늘 과제 하셨어용?",
                    "\(currentName ?? "대장") 님 잘 쉬셨나요?"]


    }
    
    func userdefaultSaveData() {
        let userdefaults = UserDefaults.standard
        userdefaults.set(riceCounter, forKey: "riceCounter")
        userdefaults.set(waterCounter, forKey: "waterCounter")
    }
    
    func userdefaultLoadData() {
        let userdefaults = UserDefaults.standard
        let riceData = userdefaults.integer(forKey: "riceCounter")
        let waterData = userdefaults.integer(forKey: "waterCounter")
        
        riceCounter = riceData
        waterCounter = waterData
        levelCounter = calculator()
    }
    
    func updateStatusPresentLabel() {
        userdefaultSaveData()
        statusPresentLabel.text = "LV\(levelCounter)  밥알 \(riceCounter)개 • 물방울 \(waterCounter)개"
        levelCounter = calculator()
    }
    
    @IBAction func tappedRiceButton(_ sender: UIButton) {
        if !inputRiceTextField.isEditing {
            riceCounter += 1
            updateStatusPresentLabel()
        } else {
            if Int(inputRiceTextField.text ?? "") ?? 0 > 99 {
                dummyLabel.text = "99개 이상은 못먹어!"
                inputRiceTextField.text = nil
                inputRiceTextField.endEditing(true)
            } else {
                riceCounter += Int(inputRiceTextField.text ?? "") ?? 0
                updateStatusPresentLabel()
                inputRiceTextField.text = nil
                inputRiceTextField.endEditing(true)
            }
        }
        dummyLabel.text = dummyLabels.randomElement()
    }
    
    @IBAction func tappedWaterButton(_ sender: UIButton) {
        if !inputWaterTextField.isEditing {
            waterCounter += 1
            updateStatusPresentLabel()
        } else {
            if Int(inputWaterTextField.text ?? "") ?? 0 > 99 {
                dummyLabel.text = "99개 이상은 못먹어!"
                inputWaterTextField.text = nil
                inputWaterTextField.endEditing(true)
            } else {
                waterCounter += Int(inputWaterTextField.text ?? "") ?? 0
                updateStatusPresentLabel()
                inputWaterTextField.text = nil
                inputWaterTextField.endEditing(true)
            }
        }
        dummyLabel.text = dummyLabels.randomElement()
    }
    
    func calculator() -> Int {
        levelCalculator =  riceCounter/5 + waterCounter/2
        switch levelCalculator {
        case 0..<10:
            return 1
        case 10..<20:
            return 1
        case 20..<30:
            return 2
        case 30..<40:
            return 3
        case 40..<50:
            return 4
        case 50..<60:
            return 5
        case 60..<70:
            return 6
        case 70..<80:
            return 7
        case 80..<90:
            return 8
        case 90..<100:
            return 9
        default:
            return 10 //⭐️
        }
    }
}

extension MainViewController {
    
    func configureInitialUI() {
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(systemName: "person.circle"), style: .plain, target: self, action: #selector(tappedSettingButton))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    
        
        bubbleImageView.image = UIImage(named: "bubble")
        dummyLabel.text = dummyLabels.randomElement()
        dummyLabel.textAlignment = .center
        
        
        nameLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        nameLabel.font = UIFont.systemFont(ofSize: 13,weight: .semibold)
        nameLabel.textAlignment = .center
        nameLabel.layer.cornerRadius = 3
        nameLabel.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        nameLabel.layer.borderWidth = 1
        
        statusPresentLabel.text = "LV\(levelCounter)  밥알 \(riceCounter)개 • 물방울 \(waterCounter)개"
        statusPresentLabel.font = UIFont.systemFont(ofSize: 13,weight: .bold)
        statusPresentLabel.textAlignment = .center
        statusPresentLabel.textColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        inputRiceTextField.placeholder = "밥 주세용"
        inputRiceTextField.backgroundColor = .clear
        inputRiceTextField.textAlignment = .center
        
        inputWaterTextField.placeholder = "물 주세용"
        inputWaterTextField.backgroundColor = .clear
        inputWaterTextField.textAlignment = .center
        
        riceButton.setTitle(" 밥먹기", for: .normal)
        riceButton.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        riceButton.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        riceButton.layer.borderWidth = 1
        riceButton.layer.cornerRadius = 5
        riceButton.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
        
        waterButton.setTitle(" 물먹기", for: .normal)
        waterButton.setTitleColor(UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1), for: .normal)
        waterButton.layer.borderColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1).cgColor
        waterButton.layer.borderWidth = 1
        waterButton.layer.cornerRadius = 5
        waterButton.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    }
    
    @objc func tappedSettingButton() {
        let sb = UIStoryboard(name: "Setting", bundle: nil)
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController")
        as! SettingTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
