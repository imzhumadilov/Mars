//
//  InitialViewModel.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 09.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol InitialViewModelInput {
    func configure(with data: Any?)
}

class InitialViewModel {
    
    // MARK: - Props
    private var model: InitialModel
    public var router: InitialRouterInput?
    
    // MARK: - Initialization
    init() {
        self.model = InitialModel()
    }
    
    // MARK: - Public functions
    func viewIsReady() {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { [weak self] _ in
            self?.router?.showSettings()
        })
    }
}

// MARK: - Module functions
extension InitialViewModel { }

// MARK: - InitialViewModelInput
extension InitialViewModel: InitialViewModelInput {
    func configure(with data: Any?) { }
}
