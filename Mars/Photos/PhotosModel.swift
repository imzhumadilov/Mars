//
//  PhotosModel.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 12.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class PhotosModel {
    
    // MARK: - Props
    let camera: CameraList
    let date: Date
    let service: NetworkServiceInterface = NetworkService()
    
    var images: [PhotoResponse] = []
    var page = 1
    var isFetching = false
    var isFinished = false
    
    // MARK: - Initialization
    init(camera: CameraList, date: Date) {
        self.camera = camera
        self.date = date
    }
}
