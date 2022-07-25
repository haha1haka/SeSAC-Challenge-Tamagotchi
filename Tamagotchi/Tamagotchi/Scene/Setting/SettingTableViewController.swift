//
//  SettingTableViewController.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/07/24.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    static var changeTitle = "변경하기"
    
    @IBOutlet var settingCellCollection: [UITableViewCell]!
    @IBOutlet weak var rightDetailLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureInitUI()
        self.navigationController?.navigationBar.topItem?.title = ""
    }
    
    func configureInitUI() {
        title = "설정"
        view.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1)
        settingCellCollection.forEach{ $0.backgroundColor = UIColor(red: 245/255, green: 252/255, blue: 252/255, alpha: 1) }
        settingCellCollection.forEach{ $0.tintColor = UIColor(red: 77/255, green: 106/255, blue: 120/255, alpha: 1)}
    }
    
    override func viewWillAppear(_ animated: Bool) {
        rightDetailLabel.text = DetailViewController.nickName
    }
    
}

extension SettingTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch indexPath.row {
        case 0:
            let sb = UIStoryboard(name: "Detail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "DetailViewController")
            as! DetailViewController
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 1:
            let sb = UIStoryboard(name: "Intro", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: "IntroCollectionViewController")
            as! IntroCollectionViewController
            vc.str = "다마고치 변경하기"
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 2:
            let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가요?", preferredStyle: .alert)
            let confirmButton = UIAlertAction(title: "응~", style: .default) {
                [weak self] action in
                guard let self = self else { return }
                
                for key in UserDefaults.standard.dictionaryRepresentation().keys {
                            UserDefaults.standard.removeObject(forKey: key.description)
                }
                
                let sb = UIStoryboard(name: "Intro", bundle: nil)

                let vc = sb.instantiateViewController(withIdentifier: "IntroCollectionViewController")
                as! IntroCollectionViewController
                
                
                let nav = UINavigationController(rootViewController: vc)

                
                nav.modalTransitionStyle = .crossDissolve
                nav.modalPresentationStyle = .fullScreen
                vc.title = SettingTableViewController.changeTitle
                
                
                self.present(nav, animated: true)
                
            }
            
            let cancelButton = UIAlertAction(title: "취소", style: .cancel)
            alert.addAction(confirmButton)
            alert.addAction(cancelButton)
            present(alert, animated: true)
            
        default:
            break
        }
        
    }
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
}
