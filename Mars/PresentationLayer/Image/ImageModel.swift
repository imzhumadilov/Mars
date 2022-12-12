//
//  ImageModel.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 12.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class ImageModel {
    
    // MARK: - Props
    let id: Int
    let imageURL: String
    
    // MARK: - Initialization
    init(id: Int, imageURL: String) {
        self.id = id
        self.imageURL = imageURL
    }
}
