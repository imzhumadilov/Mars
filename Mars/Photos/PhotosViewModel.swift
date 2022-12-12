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
    public var setupNavBar: ((_ camera: String, _ date: String) -> Void)?
    public var showLoader: (() -> Void)?
    public var hideLoader: (() -> Void)?
    public var showAlert: ((String?, String?) -> Void)?
    
    // MARK: - Initialization
    init(model: PhotosModel) {
        self.model = model
    }
    
    // MARK: - Public functions
    func viewIsReady() {
        self.getPhotos()
        self.setupNavBar?(self.model.camera.title, self.model.date.toString(format: "d MMM yyyy"))
    }
    
    func fetchMorePhotos(row: Int) {
        guard self.model.images.count == row + 1,
              !self.model.isFetching,
              !self.model.isFinished else { return }
        self.model.page += 1
        self.getPhotos()
    }
}

// MARK: - Module functions
extension PhotosViewModel {
    
    private func makeSections() {
        let section = CollectionSectionModel()
        
        for image in self.model.images {
            if let imageURL = image.image, let id = image.id {
                let photoModel = PhotoCollectionViewCellModel(imageURL: imageURL)
                photoModel.action = { [weak self] in
                    guard let self = self else { return }
                    print(id)
                }
                section.items.append(photoModel)
            }
        }
        
        self.loadDataCompletion?(.success([section]))
    }
    
    private func getPhotos() {
        print(#function, self.model.page)
        self.showLoader?()
        self.model.isFetching = true
        self.model.service.getPhotos(date: self.model.date.toString(format: "yyyy-MM-dd"),
                                     camera: self.model.camera.rawValue,
                                     page: self.model.page,
                                     apiKey: "DEMO_KEY") { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let response):
                let newImages = response.photos?.compactMap({ $0 }) ?? []
                self.model.images += newImages
                self.model.isFinished = newImages.isEmpty
                self.makeSections()
            case .failure(let error):
                self.loadDataCompletion?(.failure(error))
            }
            self.model.isFetching = false
        }
    }
}

// MARK: - PhotosViewModelInput
extension PhotosViewModel: PhotosViewModelInput {
    func configure(with data: Any?) { }
}
