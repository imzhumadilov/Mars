//
//  ImageConfigurator.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 12.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum ImageConfigurator {
    
    static func create() -> ImageViewController {
        return ImageViewController()
    }
    
    @discardableResult
    static func configure(with reference: ImageViewController, model: ImageModel) -> ImageViewModelInput {
        let viewModel = ImageViewModel(model: model)
        
        let router = ImageRouter()
        router.viewController = reference
        
        viewModel.router = router
        reference.viewModel = viewModel
        
        return viewModel
    }
    
}
