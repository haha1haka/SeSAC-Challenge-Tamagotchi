//
//  SceneDelegate.swift
//  Tamagotchi
//
//  Created by HWAKSEONG KIM on 2022/07/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let scene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: scene)

        if UserDefaults.standard.string(forKey: "identificationNumber") != nil {

            let sb = UIStoryboard(StoryboardName.main)
            guard let vc = sb.instantiateViewController(withIdentifier: MainViewController.className)
                    as? MainViewController else { return }
            self.window?.rootViewController =  UINavigationController(rootViewController: vc)

        } else {

            let sb = UIStoryboard(StoryboardName.intro)
            guard let vc = sb.instantiateViewController(withIdentifier: IntroViewController.className)
                    as? IntroViewController else { return }
            self.window?.rootViewController =  UINavigationController(rootViewController: vc)

        }

        window?.makeKeyAndVisible()
    }
    
}


