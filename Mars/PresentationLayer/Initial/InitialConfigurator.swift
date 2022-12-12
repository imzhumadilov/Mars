//
//  InitialConfigurator.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 09.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum InitialConfigurator {
    
    static func create() -> InitialViewController {
        return InitialViewController()
    }
    
    @discardableResult
    static func configure(with reference: InitialViewController) -> InitialViewModelInput {
        let viewModel = InitialViewModel()
        
        let router = InitialRouter()
        router.viewController = reference
        
        viewModel.router = router
        reference.viewModel = viewModel
        
        return viewModel
    }
    
}
