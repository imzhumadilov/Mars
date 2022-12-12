//
//  Date+.swift
//  Mars
//
//  Created by Ilyas Zhumadilov on 13.12.2022.
//

import Foundation

extension Date {
    func toString(format: String = "dd.MM.yyyy") -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = format
        return formatter.string(from: self)
    }
}
