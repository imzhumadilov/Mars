//
//  SceneDelegate.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 09.12.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: windowScene)
        self.setup(window)
    }
    
    func sceneDidEnterBackground(_ scene: UIScene) {
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    private func setup(_ window: UIWindow) {
        let vc = InitialConfigurator.create()
        InitialConfigurator.configure(with: vc)
        
        self.window = window
        if #available(iOS 13.0, *) { self.window?.overrideUserInterfaceStyle = .light }
        self.window?.rootViewController = vc
        self.window?.makeKeyAndVisible()
    }
}
