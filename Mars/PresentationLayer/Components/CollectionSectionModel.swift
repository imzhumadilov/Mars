//
//  CollectionSectionModel.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 12.12.2022.
//

import Foundation

public protocol CollectionCellIdentifiable { }

public protocol CollectionSectionRepresentable {
    var items: [CollectionCellIdentifiable] { get set }
}

final class CollectionSectionModel: CollectionSectionRepresentable {
    
    // MARK: - Props
    public var items: [CollectionCellIdentifiable]
    
    // MARK: - Initialization
    public init() {
        self.items = []
    }
}
