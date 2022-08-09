//
//  SceneDelegate.swift
//  HabitTracker
//
//  Created by Artemiy Zuzin on 07.08.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        
        let mainTabBarController = MainTabBarController()
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        self.window?.rootViewController = mainTabBarController
        self.window?.makeKeyAndVisible()
        self.window?.windowScene = windowScene
    }
    
}

