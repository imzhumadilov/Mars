//
//  PhotoCollectionViewCellModel.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 12.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class PhotoCollectionViewCellModel: CollectionCellIdentifiable {
    
    typealias ActionHandler = () -> Void
    
    // MARK: - Props
    let imageURL: String
    var action: ActionHandler?
    
    // MARK: - Initialization
    init(imageURL: String) {
        self.imageURL = imageURL
    }
}
