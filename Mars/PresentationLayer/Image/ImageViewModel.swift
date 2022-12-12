//
//  ImageViewModel.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 12.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol ImageViewModelInput {
    func configure(with data: Any?)
}

class ImageViewModel {
    
    // MARK: - Props
    private var model: ImageModel
    public var router: ImageRouterInput?
    
    public var setupData: ((_ id: String, _ imageURL: String) -> Void)?
    
    // MARK: - Initialization
    init(model: ImageModel) {
        self.model = model
    }
    
    // MARK: - Public functions
    func viewIsReady() {
        self.setupData?(String(model.id), self.model.imageURL)
    }
}

// MARK: - Module functions
extension ImageViewModel { }

// MARK: - ImageViewModelInput
extension ImageViewModel: ImageViewModelInput {
    func configure(with data: Any?) { }
}
