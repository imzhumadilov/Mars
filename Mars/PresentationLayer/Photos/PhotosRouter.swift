//
//  PhotosRouter.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 12.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import UIKit

protocol PhotosRouterInput {
    func showAlert(title: String?, message: String?)
    func showImage(model: ImageModel)
}

final class PhotosRouter: PhotosRouterInput {
    
    // MARK: - Props
    weak var viewController: PhotosViewController?
    
    // MARK: - PhotosRouterInput
    func showAlert(title: String?, message: String?) {
        self.viewController?.showAlert(title: title, message: message)
    }
    
    func showImage(model: ImageModel) {
        let vc = ImageConfigurator.create()
        ImageConfigurator.configure(with: vc, model: model)
        DispatchQueue.main.async {
            self.viewController?.navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    // MARK: - Module functions
}
