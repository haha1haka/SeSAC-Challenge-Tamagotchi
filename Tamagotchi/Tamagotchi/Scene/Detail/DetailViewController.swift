//
//  DetailViewController.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/07/24.
//

import UIKit

//protocol SendDataDelegate {
//    func recieveData(response: String) -> Void
//}


class DetailViewController: UIViewController {
    
    var initialUserName: String?
    
    @IBOutlet weak var reNameTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitUI()
    }

    func configureInitUI() {
        
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "저장" , style: .plain, target: self, action: #selector(tappedSaveButton))
        navigationItem.rightBarButtonItem?.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)
    }
    
    @objc func tappedSaveButton() {
        saveData(textField: reNameTextField)
        loadData()
        self.navigationController?.popViewController(animated: true)
    }
    
    func saveData(textField: UITextField!) {
        guard let changedUserName = textField.text else { return }
        let userdefaults = UserDefaults.standard
        userdefaults.set(changedUserName, forKey: "changedUserName")
    }
    
    func loadData() {
        let userdefaults = UserDefaults.standard
        guard let changedUserName = userdefaults.string(forKey: "changedUserName") else { return }
        initialUserName = changedUserName
    }

}
