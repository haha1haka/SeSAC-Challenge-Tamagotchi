//
//  SettingTableViewController.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/07/24.
//

import UIKit

class SettingTableViewController: UITableViewController {
    
    @IBOutlet var settingCellCollection: [UITableViewCell]!
    @IBOutlet weak var rightDetailLabel: UILabel!
    let titlename = "다마고치 변경하기"
    
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
        
        if UserDefaults.standard.string(forKey: "changedUserName") == nil {
            rightDetailLabel.text = "대장님"
        } else {
            rightDetailLabel.text = UserDefaults.standard.string(forKey: "changedUserName")
        }
        
    }
    
    func userdefaultSaveData() {
        
    }
    func userdefaultLoadData() {
        
    }
    
}

extension SettingTableViewController {

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        switch indexPath.row {
        case 0: // 이름 바꾸기
            let sb = UIStoryboard(name: "Detail", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: DetailViewController.reuseIdenrifier)
            as! DetailViewController
            
            
            self.navigationController?.pushViewController(vc, animated: true)
            
        case 1: // 다마고치 변경하기
            let sb = UIStoryboard(name: "Intro", bundle: nil)
            let vc = sb.instantiateViewController(withIdentifier: IntroCollectionViewController.reuseIdenrifier)
            as! IntroCollectionViewController
            
            
            
            IntroCollectionViewController.changedNavigationBarTitleName = "다마고치 변경하기"
            UserDefaults.standard.set(titlename, forKey: "변경하기버튼")
        
            self.navigationController?.pushViewController(vc, animated: true)
            
            
            
            
            
            
        case 2: // 초기화
            let alert = UIAlertController(title: "데이터 초기화", message: "정말 다시 처음부터 시작하실 건가요?", preferredStyle: .alert)
            let confirmButton = UIAlertAction(title: "응~", style: .default) { [weak self] action in
                guard let self = self else { return }
                
                for key in UserDefaults.standard.dictionaryRepresentation().keys {
                            UserDefaults.standard.removeObject(forKey: key.description)
                }
                
                let sb = UIStoryboard(name: "Intro", bundle: nil)
                guard let vc = sb.instantiateViewController(withIdentifier: IntroCollectionViewController.reuseIdenrifier)
                        as? IntroCollectionViewController else { return }
                let nav = UINavigationController(rootViewController: vc)
                nav.modalTransitionStyle = .crossDissolve
                nav.modalPresentationStyle = .fullScreen
                
                
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
