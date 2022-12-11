//
//  PhotosViewModel.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 12.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

protocol PhotosViewModelInput {
    func configure(with data: Any?)
}

class PhotosViewModel {
    
    // MARK: - Props
    private var model: PhotosModel
    public var router: PhotosRouterInput?
    
    public var loadDataCompletion: ((Result<[CollectionSectionModel], Error>) -> Void)?
    public var showLoader: (() -> Void)?
    public var hideLoader: (() -> Void)?
    public var showAlert: ((String?, String?) -> Void)?
    
    // MARK: - Initialization
    init(model: PhotosModel) {
        self.model = model
    }
    
    // MARK: - Public functions
    func viewIsReady() {
        self.model.service.getPhotos(date: self.model.date.toString(format: "yyyy-MM-dd"),
                                     camera: self.model.camera.rawValue,
                                     page: self.model.page,
                                     apiKey: "DEMO_KEY") { [weak self] result in
            switch result {
            case .success(let response):
                print(response.photos?.compactMap({ $0?.image }))
            case .failure(let error):
                print(error)
            }
        }
    }
}

// MARK: - Module functions
extension PhotosViewModel { }

// MARK: - PhotosViewModelInput
extension PhotosViewModel: PhotosViewModelInput {
    func configure(with data: Any?) { }
}
