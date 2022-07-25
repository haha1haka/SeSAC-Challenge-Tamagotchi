//
//  MainViewController.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/07/24.
//

import UIKit

class MainViewController: UIViewController {
    
    var tamagotchiInfo = TamagotchiInfo()
    
    var dummyLabels: [String] = ["\(DetailViewController.nickName)님 오늘 과제 하셨어용?",
                                 "\(DetailViewController.nickName)님 오늘 깃허브 푸쉬 하셨어영?",
                                 "\(DetailViewController.nickName)님 오늘 과제 하셨어용?",
                                 "\(DetailViewController.nickName)님 오늘 잘 노셨나요^^"]
    
    @IBOutlet weak var bubbleImageView: UIImageView!
    @IBOutlet weak var dummyLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var statusPresentLabel: UILabel!
    @IBOutlet weak var inputRiceTextField: UITextField!
    @IBOutlet weak var inputWaterTextField: UITextField!
    @IBOutlet weak var riceButton: UIButton!
    @IBOutlet weak var waterButton: UIButton!
    
    var index = UserDefaults.standard.integer(forKey: "index") // 1,2,3
    var riceCounter: Int = 0
    var waterCounter: Int = 0
    var levelCalculator: Int = 0
    
    var levelCounter: Int = 1 {
        didSet {
            imageView.image = UIImage(named: "\(String(describing: tamagotchiInfo.tamagotchi[index-1].index))-\(levelCounter)")
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        index = UserDefaults.standard.integer(forKey: "index")
        configureInitialUI()
        imageView.image = UIImage(named:"\(String(describing: tamagotchiInfo.tamagotchi[index].index))-\(levelCounter)")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        title = "\(DetailViewController.nickName)님의 다마고치"
        loadData()
        imageView.image = UIImage(named: "\(String(describing: tamagotchiInfo.tamagotchi[index-1].index))-\(levelCounter)")
        statusPresentLabel.text = "LV\(levelCounter)  밥알 \(riceCounter)개 • 물방울 \(waterCounter)개"
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        index = UserDefaults.standard.integer(forKey: "index")
    }
    
    func saveData() {
        let userdefaults = UserDefaults.standard
        userdefaults.set(levelCounter, forKey: "levelCounter")
        userdefaults.set(riceCounter, forKey: "riceCounter")
        userdefaults.set(waterCounter, forKey: "waterCounter")
        userdefaults.set("\(tamagotchiInfo.tamagotchi[index-1].index)-\(levelCounter)",forKey: "image")
    }
    
    func loadData() {
        let userdefaults = UserDefaults.standard
        let data1 = userdefaults.integer(forKey: "levelCounter")
        let data2 = userdefaults.integer(forKey: "riceCounter")
        let data3 = userdefaults.integer(forKey: "waterCounter")
        guard let data4 = userdefaults.string(forKey: "image") else { return }
        
        levelCounter = data1
        riceCounter = data2
        waterCounter = data3
        imageView.image  = UIImage(named: data4)
    }
    
    func updateStatusPresentLabel() {
        levelCounter = calculator()
        saveData()
        statusPresentLabel.text = "LV\(levelCounter)  밥알 \(riceCounter)개 • 물방울 \(waterCounter)개"
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
        
        nameLabel.text = tamagotchiInfo.tamagotchi[index-1].name
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
        let vc = sb.instantiateViewController(withIdentifier: "SettingTableViewController") as! SettingTableViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
