//
//  PhotosResponse.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 12.12.2022.
//

import Foundation

struct PhotosListResponse: Codable {
    let photos: [PhotoResponse?]?

    private enum CodingKeys: String, CodingKey {
        case photos = "photos"
    }
}

struct PhotoResponse: Codable {
    let id: Int?
    let image: String?

    private enum CodingKeys: String, CodingKey {
        case id = "id"
        case image = "img_src"
    }
}
