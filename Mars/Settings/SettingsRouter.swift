//
//  SettingsRouter.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 09.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol SettingsRouterInput {
    func showAlert(title: String, message: String)
}

final class SettingsRouter: SettingsRouterInput {
    
    // MARK: - Props
    weak var viewController: SettingsViewController?
    
    // MARK: - SettingsRouterInput
    func showAlert(title: String, message: String) {
        self.viewController?.showAlert(title: title, message: message)
    }
    
    // MARK: - Module functions
}
