//
//  InitialViewModel.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 09.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol InitialViewModelInput {
    func configure(with data: Any?)
}

class InitialViewModel {
    
    // MARK: - Props
    private var model: InitialModel
    public var router: InitialRouterInput?
    
    var openMainVC: (() -> ())?
    
    // MARK: - Initialization
    init() {
        self.model = InitialModel()
    }
    
    // MARK: - Public functions
    func viewIsReady() {
        self.openMainVC?()
    }
}

// MARK: - Module functions
extension InitialViewModel { }

// MARK: - InitialViewModelInput
extension InitialViewModel: InitialViewModelInput {
    func configure(with data: Any?) { }
}
