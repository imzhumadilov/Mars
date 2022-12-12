//
//  PhotosConfigurator.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 12.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum PhotosConfigurator {
    
    static func create() -> PhotosViewController {
        return PhotosViewController()
    }
    
    @discardableResult
    static func configure(with reference: PhotosViewController, model: PhotosModel) -> PhotosViewModelInput {
        let viewModel = PhotosViewModel(model: model)
        
        let router = PhotosRouter()
        router.viewController = reference
        
        viewModel.router = router
        reference.viewModel = viewModel
        
        return viewModel
    }
    
}
