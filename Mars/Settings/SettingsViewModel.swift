//
//  SettingsViewModel.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 09.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

protocol SettingsViewModelInput {
    func configure(with data: Any?)
}

class SettingsViewModel {
    
    // MARK: - Props
    private var model: SettingsModel
    public var router: SettingsRouterInput?
    
    var setupCameraList: (([String]) -> Void)?
    var showAlert: ((String?, String?) -> Void)?
    
    // MARK: - Initialization
    init() {
        self.model = SettingsModel()
    }
    
    // MARK: - Public functions
    func viesIsReady() {
        self.setupCameraList?(self.model.cameraList.compactMap({ $0.title }))
    }
    
    func provideCamera(row: Int) {
        guard self.model.cameraList.count > row else { return }
        self.model.camera = self.model.cameraList[row]
    }
    
    func provideDate(_ date: Date) {
        self.model.date = date.toString(format: "yyyy-MM-dd")
    }
    
    func exploreButtonTapped() {
        guard let camera = self.model.camera?.rawValue,
        let date = self.model.date else {
            self.router?.showAlert(title: "Error", message: "Please fil all fields")
            return
        }
//        NetworkService().getPhotos(date: date, camera: camera, page: 1, apiKey: "DEMO_KEY")
    }
}

// MARK: - Module functions
extension SettingsViewModel { }

// MARK: - SettingsViewModelInput
extension SettingsViewModel: SettingsViewModelInput {
    func configure(with data: Any?) { }
}
