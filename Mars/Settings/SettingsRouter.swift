//
//  SettingsRouter.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 09.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol SettingsRouterInput {
    func showAlert(title: String, message: String)
    func showPhotos(model: PhotosModel)
}

final class SettingsRouter: SettingsRouterInput {
    
    // MARK: - Props
    weak var viewController: SettingsViewController?
    
    // MARK: - SettingsRouterInput
    func showAlert(title: String, message: String) {
        self.viewController?.showAlert(title: title, message: message)
    }
    
    func showPhotos(model: PhotosModel) {
        let vc = PhotosConfigurator.create()
        PhotosConfigurator.configure(with: vc, model: model)
        DispatchQueue.main.async {
            self.viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: - Module functions
}
