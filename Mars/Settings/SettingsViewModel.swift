//
//  SettingsViewModel.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 09.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol SettingsViewModelInput {
    func configure(with data: Any?)
}

class SettingsViewModel {
    
    // MARK: - Props
    private var model: SettingsModel
    public var router: SettingsRouterInput?
    
    // MARK: - Initialization
    init() {
        self.model = SettingsModel()
    }
    
    // MARK: - Public functions
    
}

// MARK: - Module functions
extension SettingsViewModel { }

// MARK: - SettingsViewModelInput
extension SettingsViewModel: SettingsViewModelInput {
    func configure(with data: Any?) { }
}
