//
//  InitialRouter.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 09.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol InitialRouterInput {
    func showSettings()
}

final class InitialRouter: InitialRouterInput {
    
    // MARK: - Props
    weak var viewController: InitialViewController?
    
    // MARK: - InitialRouterInput
    func showSettings() {
        let vc = SettingsConfigurator.create()
        SettingsConfigurator.configure(with: vc)
        let nc = UINavigationController(rootViewController: vc)
        nc.modalPresentationStyle = .overFullScreen
        
        DispatchQueue.main.async {
            self.viewController?.present(nc, animated: false)
        }
    }
    
    // MARK: - Module functions
}
