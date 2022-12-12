//
//  SettingsModel.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 09.12.2022.
//  Copyright © 2022 ___ORGANIZATIONNAME___. All rights reserved.
//

import Foundation

class SettingsModel {
    
    // MARK: - Props
    let cameraList = Camera.allCases
    var camera: Camera?
    var date: Date?
    
    // MARK: - Initialization
    init() { }
}
