//
//  SettingsConfigurator.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 09.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

enum SettingsConfigurator {
    
    static func create() -> SettingsViewController {
        return SettingsViewController()
    }
    
    @discardableResult
    static func configure(with reference: SettingsViewController) -> SettingsViewModelInput {
        let viewModel = SettingsViewModel()
        
        let router = SettingsRouter()
        router.viewController = reference
        
        viewModel.router = router
        reference.viewModel = viewModel
        
        return viewModel
    }
    
}
