//
//  NetworkService.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 12.12.2022.
//

import Alamofire

protocol NetworkServiceInterface {
    func getPhotos(date: String, camera: String, page: Int, apiKey: String)
}

class NetworkService: NetworkServiceInterface {
    
    private let url = "https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos"
    
    func getPhotos(date: String, camera: String, page: Int, apiKey: String) {
        let param: Parameters = ["earth_date": date, "camera": camera, "page": page, "api_key": apiKey]
        AF.request(self.url, method: .get, parameters: param, encoding: URLEncoding.default, headers: nil).responseJSON { json in
            print(json)
        }
    }
}
