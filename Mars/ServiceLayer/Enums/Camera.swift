//
//  Camera.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 13.12.2022.
//

import Foundation

enum Camera: String, CaseIterable {
    case fhaz = "FHAZ"
    case rhaz = "RHAZ"
    case mast = "MAST"
    case chemcam = "CHEMCAM"
    case mahli = "MAHLI"
    case mardi = "MARDI"
    case navcam = "NAVCAM"
    case pancam = "PANCAM"
    case minites = "MINITES"
    
    var title: String {
        switch self {
        case .fhaz:
            return "Front Hazard Avoidance Camera"
        case .rhaz:
            return "Rear Hazard Avoidance Camera"
        case .mast:
            return "Mast Camera"
        case .chemcam:
            return "Chemistry and Camera Complex"
        case .mahli:
            return "Mars Hand Lens Imager"
        case .mardi:
            return "Mars Descent Imager"
        case .navcam:
            return "Navigation Camera"
        case .pancam:
            return "Panoramic Camera"
        case .minites:
            return "Miniature Thermal Emission Spectrometer (Mini-TES)    "
        }
    }
}
